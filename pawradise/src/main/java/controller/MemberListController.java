package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import bean.AuthInfo;
import bean.Member;
import command.ChangePwdCommand;
import command.LoginCommand;
import command.PageMaker;
import dao.MemberDao;
import exception.IdPasswordNotMatchingException;
import exception.MemberNotFoundException;
import svcMember.AuthService;
import svcMember.ChangePasswordService;
import validator.ChangePwdCommandValidator;
import validator.ListCommandValidator;

@Controller
public class MemberListController {	
	private AuthService authService;
	
	private ChangePasswordService changePasswordService;

	public void setChangePasswordService(ChangePasswordService changePasswordService) {
		this.changePasswordService = changePasswordService;
	}

	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
	
	private MemberDao memberDao;
	public void setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
	}
	
	@RequestMapping(value="/member/list", method = RequestMethod.GET)
	public String form(PageMaker pageMaker){
		return "member/memberList";
	}
	
	@RequestMapping(value="/member/list", method = RequestMethod.POST)
	public String list(
			@RequestParam(value="from", required=false) String strFrom,
			@RequestParam(value="to", required=false) String strTo,
			PageMaker pageMaker, Model model, Errors errors){
		
		new ListCommandValidator().validate(pageMaker, errors);
		if(errors.hasErrors()) return "member/memberList";
		Date from = transDate(strFrom, " 00:00:00");
		Date to   = transDate(strTo, " 23:59:59");		
		int count = 0;
		int limit = 10;
		pageMaker.setPage(pageMaker.getPage());
		int point = (pageMaker.getPage() - 1) * 10;
		if(from != null && to != null){
			count = 
				memberDao.countPage(from, to); 
			// 레코드 총 갯수 구함 
			pageMaker.setCount(count); // 페이지 계산 
			List<Member> members = memberDao.selectPage(
					from, to, point, limit);
			model.addAttribute("from", strFrom);
			model.addAttribute("to", strTo);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("members", members);
		}
		return "member/memberList";
	}
	
	@RequestMapping(value="/mypage/modify/{userNum}")
	public String detail(@PathVariable("userNum") int userNum, Model model, HttpSession session,
			ChangePwdCommand pwdCmd, Errors errors){
		Member member = memberDao.selectByUserNum(userNum);
		System.out.println("수정페이지");
		System.out.println(userNum);
		if(member == null) throw new MemberNotFoundException();
		model.addAttribute("member", member);
		new ChangePwdCommandValidator().validate(pwdCmd, errors);
		if (errors.hasErrors()) {
			return "mypage/memberModify";
		}

		try {
			changePasswordService.changePassword(member.getEmail(), 
					pwdCmd.getCurrentPassword(),
					pwdCmd.getNewPassword());
			return "mypage/memberModifyDone";
		} catch (IdPasswordNotMatchingException e) {
			errors.rejectValue("currentPassword", "notMatching");
			return "mypage/memberModify";
		}
	}
	
	

	public Date transDate(String d, String times){
		Date date = null;
		if(d != null){
			SimpleDateFormat transFormat; 
			transFormat = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
			try { date = transFormat.parse(d+times);
			} catch (Exception e) { e.printStackTrace(); }
		}
		return date;
	}

	@RequestMapping(value="/mypage/mypage/{userNum}")
	public String detail(@PathVariable("userNum") int userNum, Model model, HttpSession session){
		Member member = memberDao.selectByUserNum(userNum);
		System.out.println("마이페이지");
		System.out.println(userNum);
		if(member == null) throw new MemberNotFoundException();
		model.addAttribute("member", member);
		return "mypage/mypage";
	}
	
	@ExceptionHandler(MemberNotFoundException.class)
	public String handNotFoundException(){
		return "member/noMember";
	}
	@ExceptionHandler(TypeMismatchException.class)
	public String typeMismatchException(){
		return "member/invalidId";
	}

}
