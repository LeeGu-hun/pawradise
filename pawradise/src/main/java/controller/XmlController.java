package controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	
	// 리스트
	@RequestMapping("/mboardList")
	public String boardListGetPost(String srch, PageMaker pageMaker, Model model) {
		int count = 0;
		int limit = 8;
		pageMaker.setPage(pageMaker.getPage());
		int point = (pageMaker.getPage() - 1) * 9;
		if(point>=0)point=point+1;
		srch = pageMaker.getSrch();
		count = boardDao.countPage(srch);
		// 레코드 총 갯수 구함
		pageMaker.setCount(count); // 페이지 계산
		List<Board> boards = boardDao.selectPage(srch, point, limit);
		System.out.println("리스트: " + count);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boards", boards);
		return "m/mboardList";
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
	@RequestMapping(value = "/boardToMyXml", method = RequestMethod.POST)
	@ResponseBody
	public XmlDataList MyXml(HttpServletRequest request) {	
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("마이리스트 id " + id + " pw " + pw);
		AuthInfo authInfo = authService.authenticate(id, pw);
		int userNum=authInfo.getUserNum();
		
		System.out.println("MyXml-----authInfo.getUserNum() " + authInfo.getUserNum());
		
//		int userNum=115;
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
	@RequestMapping(value = "/mWrite", method = RequestMethod.POST)	
	public String mwrite(Board board, Errors errors, HttpSession session, HttpServletRequest request, 
			Model model, HttpServletResponse response) {
		System.out.println("1");
		new BoardValidator().validate(board, errors);
		System.out.println("에러");
		if (errors.hasErrors())			
			return "redirect:/boardToXml";
		
		System.out.println("글쓰기 post요청");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		

		
		

		System.out.println(id + " / " + pw + " / " + title+ " / " + content);
		AuthInfo authInfo = authService.authenticate(id, pw);
		board.setName(authInfo.getName());
		board.setUserNum(authInfo.getUserNum());
		System.out.println(" authInfo.getName() " + authInfo.getName() + " authInfo.getUserNum() " + authInfo.getUserNum());
		board.setTitle(title);
		board.setContent(content);
		board.setPub(1);
		
		 // 웹서버 컨테이너 경로
/*	    String root = request.getSession().getServletContext().getRealPath("/");
	    // 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
	    String savePath = root + "uploads";*/
		
			
		MultipartFile multi = (MultipartFile) request.getAttribute("multiFile");
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
		
		boardDao.add(board);

		if (board.getPub() == 1) {
			return "redirect:/boardToXml";
		} else {			
			return "redirect:/boardToMyXml/";
		}
	}
	// 모바일 글쓰기POST
	@RequestMapping(value = "/mAppWrite", method = RequestMethod.GET)	
	public void mAppwrite(Board board, HttpServletRequest request, Model model, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String filename="http://192.168.0.126:8080/Applinkage/upload/"+ request.getParameter("filename");
		String pub=request.getParameter("pubz");
		
		System.out.println(id + " / " + pw + " / " + title+ " / " + content + "/" + filename + "/" + pub);
		AuthInfo authInfo = authService.authenticate(id, pw);
		board.setName(authInfo.getName());
		board.setUserNum(authInfo.getUserNum());
		System.out.println(" authInfo.getName() " + authInfo.getName() + " authInfo.getUserNum() " + authInfo.getUserNum());
		board.setTitle(title);
		board.setContent(content);
		int tmp = (pub.equals("On"))?1:0;
		board.setPub(tmp);
		board.setFileName(filename);
		
		boardDao.add(board);

	}
	
	// 모바일 파일 업로드
	@RequestMapping("/mUpload")
	public String mUpload(){
		return "/m/getMultipart";
	}

}