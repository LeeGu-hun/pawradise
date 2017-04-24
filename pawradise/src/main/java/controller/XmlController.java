package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bean.AuthInfo;
import bean.Board;
import bean.Comment;
import command.LoginCommand;
import command.PageMaker;
import dao.BoardDao;
import dao.MemberDao;
import svcMember.AuthService;
import validator.BoardValidator;
import xml.Data;
import xml.MemData;
import xml.XmlDataList;
import xml.XmlMemDataList;

@Controller
public class XmlController {
	private BoardDao boardDao;
	private Comment comment;
	private AuthService authService;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@RequestMapping(value = "/mlogin", method = RequestMethod.POST)
	public String frmPost(HttpServletRequest request, Model model, LoginCommand loginCommand, Errors errors,
			HttpSession session, HttpServletResponse response) {
		System.out.println("post요청");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		System.out.println(id + " / " + pw);
		AuthInfo authInfo = authService.authenticate(id, pw);
		int userNum = authInfo.getUserNum();

		String result = "";
		if (errors.hasErrors())
			return result = "아이디와 패스워드를 확인해 주세요";

		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("userNum", userNum);
		System.out.println(id + " / " + pw + " / " + userNum);
		return "redirect:/boardToXml";

	}

	// 게시판xml변환
	@RequestMapping(value = "/boardToXml")
	@ResponseBody
	public XmlDataList xml(HttpServletRequest request) {

		List<Data> list = boardDao.xmlBoardList();
		System.out.println(list);

		return new XmlDataList(list);
	}

	// 게시판xml변환
	@RequestMapping(value = "/boardToMyXml")
	@ResponseBody
	public XmlDataList MyXml(int userNum, HttpServletRequest request) {	

		List<Data> listm = boardDao.xmlMyBoardList(userNum);
		System.out.println(listm);

		return new XmlDataList(listm);
	}

	// xml member
	@RequestMapping(value = "/MyPageXml")
	@ResponseBody
	public XmlMemDataList xml(int userNum, HttpServletRequest request) {
				
		List<MemData> list = memberDao.xmlMyList(userNum);

		System.out.println(list);

		return new XmlMemDataList(list);

	}

	// 모바일 글쓰기POST
	@RequestMapping(value = "/mboardWrite")
	public String mwrite(Board board, Errors errors, HttpSession session, HttpServletRequest request, 
			Model model, HttpServletResponse response) {

		new BoardValidator().validate(board, errors);
		if (errors.hasErrors())
			return "result";
		System.out.println("글쓰기 post요청");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String mfileName=request.getParameter("mfileName");
		String pub=request.getParameter("pub");
		
		

		System.out.println(id + " / " + pw + " / " + title+ " / " + content);
		AuthInfo authInfo = authService.authenticate(id, pw);
		board.setName(authInfo.getName());
		board.setUserNum(authInfo.getUserNum());
		System.out.println(" authInfo.getName() " + authInfo.getName() + " authInfo.getUserNum() " + authInfo.getUserNum());
		board.setTitle(title);
		board.setContent(content);
		board.setFileName(mfileName);
/*
		MultipartFile multi = board.getMultiFile();
		String newFileName = "";
		if (!multi.isEmpty()) {
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
	*/	
		boardDao.add(board);

		if (board.getPub() == 1) {
			return "redirect:/boardToXml";
		} else {			
			return "redirect:/boardToMyXml/";
		}
	}
	
	// 모바일 파일 업로드
	@RequestMapping("/mUpload")
	public String mUpload(){
		return "/board/getMultipart";
	}

}