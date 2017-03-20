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

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	// 게시글삭제
	@RequestMapping("/board/delete/{num}")
	public String delete(@PathVariable("num") int num) {
		boolean board = boardDao.delete(num);
		System.out.println(board);
		return "redirect:/boardList";
	}

	// 수정하기 페이지로이동
	@RequestMapping("/board/update/{num}")
	public String update(@PathVariable("num") int num, Model model) {
		Board board = boardDao.getDetail(num);
		model.addAttribute("board", board);
		return "board/boardUpdate";
	}

	// 수정하기POST
	@RequestMapping(value = "/board/update/{num}", method = RequestMethod.POST)
	public String submit(@PathVariable("num") int num, Board board) {
		boardDao.update(board);
		return "redirect:/board/detail/{num}";
	}

	// 리스트
	@RequestMapping("/boardList")
	public String boardListGetPost(String srch, PageMaker pageMaker, Model model) {
		int count = 0;
		int limit = 9;
		pageMaker.setPage(pageMaker.getPage());
		int point = (pageMaker.getPage() - 1) * 10;
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
	public String detail(@PathVariable("seq") int seq, Model model) {
		Board board = boardDao.getDetail(seq);
		boardDao.commentList(seq);
		boardDao.readCountUpdate(seq);
		model.addAttribute("board", board);
		return "board/boardDetail";
	}

	// 글쓰기GET
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String form(Board board) {
		return "board/boardWrite";
	}

	// 글쓰기POST
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public String write(Board board, Comment comment, Errors errors, HttpSession session) {

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
		boardDao.add(board);
		boardDao.insertComment(comment);
		return "redirect:/boardList";
	}

}
