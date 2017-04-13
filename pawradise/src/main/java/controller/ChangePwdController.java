package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	private ChangePasswordService changePwdSvc;
	private AuthService authService;
	private MemberDao memberDao;

	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void setChangePwdSvc(ChangePasswordService changePwdSvc) {
		this.changePwdSvc = changePwdSvc;
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
	
	
	@RequestMapping(value="/mypage/modify/{email}", method = RequestMethod.GET)
	public String formt() {
		return "mypage/memberModify";
	}
	
	@RequestMapping(value="/mypage/modifyDone")
	public String modifyDone() {
		return "mypage/memberModifyDone";
	}

	@RequestMapping(value="/mypage/modify/{email}", method = RequestMethod.POST)
	public String submit(ChangePwdCommand pwdCmd, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		int userNum = pwdCmd.getUserNum();
		String currentPassword = pwdCmd.getCurrentPassword();
		String newPassword = pwdCmd.getNewPassword();

		Member member = memberDao.selectByUserNum(userNum);

		System.out.println("member.getPassword() = " + member.getPassword() + member.getEmail());
		System.out.println("currentPassword = " + currentPassword +" / newPassword = " + newPassword);
		
		if(member.getPassword().equals(currentPassword)){
			changePwdSvc.changePassword(member.getEmail(), 
					pwdCmd.getCurrentPassword(), pwdCmd.getNewPassword());
			response.setContentType("text/html");
		    response.setCharacterEncoding("UTF-8");
			PrintWriter writer = null;
			writer = response.getWriter();
			writer.println("<script>alert('비밀번호가 정상적으로 변경되었습니다.'); location.href='"
					+ request.getContextPath() + "/mypage/modifyDone';</script>");
			writer.close();
			return "mypage/memberModifyDone";
		} else {
			response.setContentType("text/html");
		    response.setCharacterEncoding("UTF-8");
			PrintWriter writer = null;
			writer = response.getWriter();
			writer.println("<script>alert('입력하신 비밀번호가 기존의 비밀번호와 일치하지 않습니다.'); location.href='"
					+ request.getContextPath() + "/mypage/modify/"+ userNum +"';</script>");
			writer.close();
			return "mypage/modify";
		}
	}
}