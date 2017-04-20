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
import org.springframework.web.servlet.ModelAndView;

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
	public String frmPost(HttpServletRequest request,Model model, LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) {
		System.out.println("post요청");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id+" / "+pw);
		AuthInfo authInfo = authService.authenticate(id, pw);
		int userNum = authInfo.getUserNum();
		
		String result = "";
		if (errors.hasErrors()) return result = "아이디와 패스워드를 확인해 주세요";
		
		
		model.addAttribute("id", id);model.addAttribute("pw",pw);
		model.addAttribute("userNum",userNum);
		System.out.println(id+" / "+pw+" / "+userNum);
		return "redirect:/MyPageXml/";	
		
		
	}
	
	//게시판xml변환
	@RequestMapping(value = "/boardToXml")
    @ResponseBody
	public XmlDataList xml(HttpServletRequest request) {
		
		List<Data>  list = boardDao.xmlBoardList(request.getContextPath());
		System.out.println(list);
		
		return new XmlDataList(list);		
	}
	
	//게시판xml변환
	@RequestMapping(value = "/boardToMyXml/")
    @ResponseBody
	public XmlDataList MyXml(String email) {
		
		List<Data>  listm = boardDao.xmlMyBoardList(email);
		System.out.println(listm);
		
		return new XmlDataList(listm);		
	}
	
	
	//xml member
	@RequestMapping(value = "/MyPageXml/")
    @ResponseBody
	public ModelAndView xml(String email) {
		
		ModelAndView mav = new ModelAndView();
		List<MemData> list = memberDao.xmlMyList(email);
		List<Data>  listm = boardDao.xmlMyBoardList(email);
		
		mav.addObject("list",list);
		mav.addObject("listm",listm);
        mav.setViewName("xml");
		
		System.out.println(mav);
		return mav;	 

	}
	
	
	
}