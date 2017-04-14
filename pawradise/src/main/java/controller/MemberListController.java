package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.TypeMismatchException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.Member;
import command.PageMaker;
import dao.MemberDao;
import exception.IdPasswordNotMatchingException;
import exception.MemberNotFoundException;
import svcMember.AuthService;
import validator.ListCommandValidator;
import xml.Data;
import xml.MemData;
import xml.XmlDataList;
import xml.XmlMemDataList;

@Controller
public class MemberListController {
	private AuthService authService;

	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String form(PageMaker pageMaker) {
		return "member/memberList";
	}

	@RequestMapping(value = "/member/list", method = RequestMethod.POST)
	public String list(@RequestParam(value = "from", required = false) String strFrom,
			@RequestParam(value = "to", required = false) String strTo, PageMaker pageMaker, Model model,
			Errors errors) {

		new ListCommandValidator().validate(pageMaker, errors);
		if (errors.hasErrors())
			return "member/memberList";
		Date from = transDate(strFrom, " 00:00:00");
		Date to = transDate(strTo, " 23:59:59");
		int count = 0;
		int limit = 10;
		pageMaker.setPage(pageMaker.getPage());
		int point = (pageMaker.getPage() - 1) * 10;
		if (from != null && to != null) {
			count = memberDao.countPage(from, to);
			// 레코드 총 갯수 구함
			pageMaker.setCount(count); // 페이지 계산
			List<Member> members = memberDao.selectPage(from, to, point, limit);
			model.addAttribute("from", strFrom);
			model.addAttribute("to", strTo);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("members", members);
		}
		return "member/memberList";
	}

	public Date transDate(String d, String times) {
		Date date = null;
		if (d != null) {
			SimpleDateFormat transFormat;
			transFormat = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
			try {
				date = transFormat.parse(d + times);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return date;
	}

	@RequestMapping(value = "/mypage/mypage/{userNum}")
	public String detail(@PathVariable("userNum") int userNum, Model model, HttpSession session) {
		Member member = memberDao.selectByUserNum(userNum);
		System.out.println("마이페이지");
		System.out.println(userNum);
		if (member == null)
			throw new MemberNotFoundException();
		model.addAttribute("member", member);
		return "mypage/mypage";
	}

	@ExceptionHandler(MemberNotFoundException.class)
	public String handNotFoundException() {
		return "member/noMember";
	}

	@ExceptionHandler(TypeMismatchException.class)
	public String typeMismatchException() {
		return "member/invalidId";
	}
	@RequestMapping(value="/mypage/memdelete/{userNum}", method=RequestMethod.GET)
	public String delet(){
		return "mypage/mempassword";
	}
	
//  회원 탈퇴
	@RequestMapping(value = "/mypage/memdelete/{userNum}", method=RequestMethod.POST)
	public String delete(@PathVariable("userNum") int userNum,
			HttpServletRequest request, HttpServletResponse response)throws Exception{
		String result = "";
		String pw = request.getParameter("pw");
		Member mem = memberDao.selectByUserNum(userNum);
		System.out.println("pass : "+pw+" / mem.pw : " + mem.getPassword().toString());
		if(mem.getPassword().equals(pw)){
			memberDao.memberDelete(userNum);
			return result = "mypage/memberout";
		} else {
			response.setContentType("text/html");
		    response.setCharacterEncoding("UTF-8");
			PrintWriter writer = null;
			writer = response.getWriter();
			writer.println("<script>alert('이메일과 비밀번호 확인 요망.'); location.href='"+
			request.getContextPath() +"/mypage/memdelete/"+userNum+"';</script>");
			writer.close();
			return "mypage/mempassword";
		}
	}
	
	//xml member
	@RequestMapping(value = "/MyPageXml/{userNum}")
    @ResponseBody
	public XmlMemDataList xml(@PathVariable("userNum")int userNum) {
		
		List<MemData> list = memberDao.xmlMyList(userNum);
		System.out.println(list);
		
		XmlMemDataList xdl = new XmlMemDataList(list);		
				 
		 return xdl;
	}
}
