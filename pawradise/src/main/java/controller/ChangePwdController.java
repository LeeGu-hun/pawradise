package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.AuthInfo;
import bean.Member;
import command.ChangePwdCommand;
import dao.MemberDao;
import exception.IdPasswordNotMatchingException;
import exception.MemberNotFoundException;
import svcMember.AuthService;
import svcMember.ChangePasswordService;
import validator.ChangePwdCommandValidator;

@Controller
public class ChangePwdController {

	private ChangePasswordService changePasswordService;
	private AuthService authService;
	private MemberDao memberDao;

	public void setChangePasswordService(ChangePasswordService changePasswordService) {
		this.changePasswordService = changePasswordService;
	}
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	public void setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
	}
	
	
	/*@RequestMapping(value="/mypage/modify/{userNum}")
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
			changePasswordService.changePassword(member.getUserNum(), 
					pwdCmd.getCurrentPassword(),
					pwdCmd.getNewPassword());
			return "mypage/memberModifyDone";
		} catch (IdPasswordNotMatchingException e) {
			errors.rejectValue("currentPassword", "notMatching");
			return "mypage/memberModify";
		}
	}
	*/ 
	
//	
//	@RequestMapping(value="/mypage/modify/{userNum}", method = RequestMethod.GET)
//	public String form(@ModelAttribute("userNum") ChangePwdCommand pwdCmd, Model model, Member member) {
//		return "mypage/memberModify";
//	}

	@RequestMapping(value="/mypage/modify/{userNum}")
	public String submit(@ModelAttribute("userNum") ChangePwdCommand pwdCmd, Model model, Member member,
			Errors errors, HttpSession session) {
 
		
		if (errors.hasErrors()) {return "mypage/memberModify";}
		
//		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		try {
			changePasswordService.changePassword(member.getUserNum(), 
					pwdCmd.getCurrentPassword(), pwdCmd.getNewPassword());
			
			return "mypage/memberModifyDone";
			
		} catch (IdPasswordNotMatchingException e) {
			errors.rejectValue("currentPassword", "notMatching");
			
			return "mypage/memberModify";
		}
	}
}