package controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.AuthInfo;
import command.LoginCommand;
import exception.IdPasswordNotMatchingException;
import svcMember.AuthService;
import validator.LoginCommandValidator;

@Controller

public class LoginController {
	private AuthService authService;

	public void setAuthService(AuthService authService) {
		this.authService = authService; 
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String form(LoginCommand loginCommand,
			@CookieValue(value="REMEMBER", required=false)Cookie rCookie){
		if(rCookie != null){
			loginCommand.setEmail(rCookie.getValue());
			loginCommand.setRememberEmail(true); 
		}
		return "login/loginForm";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String submit(LoginCommand loginCommand, Errors errors,
			HttpSession session, HttpServletResponse response){
		new LoginCommandValidator().validate(loginCommand, errors);
		if(errors.hasErrors()) return "login/loginForm";
		try{
			AuthInfo authInfo = authService.authenticate(
					loginCommand.getEmail(), loginCommand.getPassword());
			session.setAttribute("authInfo", authInfo);
			Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getEmail());
			rememberCookie.setPath("/");
			if(loginCommand.isRememberEmail()){
				rememberCookie.setMaxAge(66*60*24*30);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie); 
			return "redirect:/boardList";
		} catch(IdPasswordNotMatchingException e){
			errors.reject("idPasswordNotMatching");
			return "login/loginForm";
		}
	}
}
