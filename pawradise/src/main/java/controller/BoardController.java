package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import bean.AuthInfo;
import bean.Board;
import bean.Comment;
import command.PageMaker;
import dao.BoardDao;
import validator.BoardValidator;

@Controller
public class BoardController {
	private BoardDao boardDao;
	private Comment comment;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	// 게시글삭제
	@RequestMapping("/board/delete/{seq}")
	public String delete(@PathVariable("seq") int seq) {
		boolean board = boardDao.delete(seq);
		boolean comment = boardDao.commnetDelete(seq);
		System.out.println(board);
		return "redirect:/boardList";
	}

	// 수정하기 페이지로이동
	@RequestMapping("/board/update/{seq}")
	public String update(@PathVariable("seq") int seq, Model model) {
		Board board = boardDao.getDetail(seq);
		model.addAttribute("board", board);
		return "board/boardUpdate";
	}

	// 수정하기POST
	@RequestMapping(value = "/board/update/{seq}", method = RequestMethod.POST)
	public String submit(@PathVariable("seq") int seq, Board board) {
		boardDao.update(board);
		return "redirect:/board/detail/{seq}";
	}

	// 리스트
	@RequestMapping("/boardList")
	public String boardListGetPost(String srch, PageMaker pageMaker, Model model) {
		int count = 0;
		int limit = 9;
		pageMaker.setPage(pageMaker.getPage());
		int point = (pageMaker.getPage() - 1) * 9;
		srch = pageMaker.getSrch();
		count = boardDao.countPage(srch);
		// 레코드 총 갯수 구함
		pageMaker.setCount(count); // 페이지 계산
		List<Board> boards = boardDao.selectPage(srch, point, limit);
		System.out.println("리스트: " + count);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boards", boards);
		return "board/boardList";
	}

	// 상세보기
	@RequestMapping("/board/detail/{seq}")
	public String detail2(@PathVariable("seq") int seq, Model model, Board board, Comment comment, Errors errors, HttpSession session) {
		board = boardDao.getDetail(seq);
		System.out.println("board.getFileName"+board.getFileName());
		System.out.println("board.getFiles"+board.getFiles());
		System.out.println("board.getMultiFile"+board.getMultiFile());
		boardDao.readCountUpdate(seq);		
		System.out.println(comment.getC_seq());
		if(!(comment.getName()==null) && !(comment.getC_content()==null)){
			boardDao.insertComment(comment, seq);				
		}
		List<Comment> comments = boardDao.commentList(seq);		
		model.addAttribute("comments", comments);
		model.addAttribute("board", board);
		boardDao.commnet1Delete(comment.getC_seq());
		
		return "board/boardDetail";
	}
		
	// 글쓰기GET
	@RequestMapping(value = "/board/boardWrite", method = RequestMethod.GET)
	public String form(Board board) {
		return "board/boardWrite";
	}

	// 글쓰기POST
	@RequestMapping(value = "/board/boardWrite")
	public String write(Board board,  Errors errors, HttpSession session) {

		new BoardValidator().validate(board, errors);
		if (errors.hasErrors())
			return "board/boardWrite";

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		board.setName(authInfo.getName());

		MultipartFile multi = board.getMultiFile();
		String newFileName = "";
		if (multi != null) {
			String fileName = multi.getOriginalFilename();
			// 파일명이 중복되지 않게 파일명에 시간추가
			newFileName = System.currentTimeMillis() + "_" + fileName;
			board.setFileName(newFileName);
			String path = board.getUpDir() + newFileName;
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("board.getFileName"+board.getFileName());
		System.out.println("board.getFiles"+board.getFiles());
		System.out.println("board.getMultiFile"+board.getMultiFile());
		boardDao.add(board);
		return "redirect:/boardList";
	}

}
