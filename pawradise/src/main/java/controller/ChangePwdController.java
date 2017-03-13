package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.AuthInfo;
import command.ChangePwdCommand;
import exception.IdPasswordNotMatchingException;
import svcMember.ChangePasswordService;
import validator.ChangePwdCommandValidator;

@Controller
@RequestMapping("/member/changePassword")
public class ChangePwdController {

	private ChangePasswordService changePasswordService;

	public void setChangePasswordService(ChangePasswordService changePasswordService) {
		this.changePasswordService = changePasswordService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String form(@ModelAttribute("command") ChangePwdCommand pwdCmd) {
		return "member/changePwdForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String submit(
			@ModelAttribute("command") ChangePwdCommand pwdCmd, 
			Errors errors, HttpSession session) {
		new ChangePwdCommandValidator().validate(pwdCmd, errors);
		if (errors.hasErrors()) {
			return "member/changePwdForm";
		}
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		try {
			changePasswordService.changePassword(authInfo.getEmail(), 
					pwdCmd.getCurrentPassword(),
					pwdCmd.getNewPassword());
			return "member/changedPwd";
		} catch (IdPasswordNotMatchingException e) {
			errors.rejectValue("currentPassword", "notMatching");
			return "member/changePwdForm";
		}
	}
}