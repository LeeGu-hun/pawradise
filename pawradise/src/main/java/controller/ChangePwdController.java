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
@RequestMapping("/mypage/modify")
public class ChangePwdController {
	private AuthService authService;

	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
	
	private MemberDao memberDao;
	public void setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
	}

	private ChangePasswordService changePasswordService;

	public void setChangePasswordService(ChangePasswordService changePasswordService) {
		this.changePasswordService = changePasswordService;
	}

//	@RequestMapping(method = RequestMethod.GET, value="/mypage/modify")
//	public String form(@ModelAttribute("command") ChangePwdCommand pwdCmd) {
//		return "mypage/modify";
//	}
	
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
			return "mypage/modify";
		}
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		try {
			changePasswordService.changePassword(authInfo.getEmail(), 
					pwdCmd.getCurrentPassword(),
					pwdCmd.getNewPassword());
			return "mypage/modifyDone";
		} catch (IdPasswordNotMatchingException e) {
			errors.rejectValue("currentPassword", "notMatching");
			return "mypage/modify";
		}
	}		

}