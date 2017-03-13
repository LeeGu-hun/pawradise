package controller;


import java.util.List;

import org.springframework.beans.TypeMismatchException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.Board;
import bean.Member;
import command.PageMaker;
import dao.BoardDao;
import exception.MemberNotFoundException;
import validator.ListCommandValidator;


@Controller
public class BoardController2 {
	private BoardDao boardDao;
	
	public void setBoardDao(BoardDao boardDao){
		this.boardDao = boardDao;
	}
	
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String form(@ModelAttribute("cmd") PageMaker pageMaker){
		return "board/boardList";
	}
	
	
	@RequestMapping(value = "/boardList", method = RequestMethod.POST)
	public String form(	@RequestParam(value = "srch", required = false) String srch, 
			PageMaker pageMaker, Model model) {
		int count = 0;
		int limit = 10;
		pageMaker.setPage(pageMaker.getPage());
		int point = (pageMaker.getPage() - 1) * 10;
		count = boardDao.countPage(srch);
		// 레코드 총 갯수 구함
		pageMaker.setCount(count); // 페이지 계산
		List<Board> boards = boardDao.selectPage(srch, point, limit);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boards", boards);
		return "board/boardList";
	}
	
	@RequestMapping(value="/board/detail/{num}")
	public String detail(
			@PathVariable("num") int num, Model model){
		Board board = boardDao.getDetail(num);

		model.addAttribute("board", board);
		return "board/boardDetail";
	}

}
