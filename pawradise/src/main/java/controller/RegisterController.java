package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.RegisterRequest;
import exception.AlreadyExistingMemberException;
import svcMember.MemberRegisterService;
import validator.RegisterRequestValidator;

@Controller
public class RegisterController {
	private MemberRegisterService memRegSvc;
	
	public void setMemRegSvc(MemberRegisterService memRegSvc) {
		this.memRegSvc = memRegSvc;
	}

	@RequestMapping("/register/step1")
	public String handleStep1(){
		return "register/step1";
	}
	
	@RequestMapping(value="/register/step2", method=RequestMethod.GET)
	public String handleStep2Get(){
		return "redirect:/register/step1";
	}
	
	@RequestMapping(value="/register/step2", method=RequestMethod.POST)
	public String handleStep2Post(
			@RequestParam(value="agree", defaultValue="false") 
				Boolean agreeVal,RegisterRequest request){
		if(!agreeVal){
			return "register/step1";
		}
		return "register/step2";
	}
	
	@RequestMapping(value="/register/step3", method=RequestMethod.POST)
	public String handleStep3Post(RegisterRequest request, Errors errors,
			Model model){
		new RegisterRequestValidator().validate(request, errors);
		if(errors.hasErrors()) return "register/step2";
		model.addAttribute("word","완료");
		try{
			memRegSvc.regist(request);
			return "register/step3";
		} catch (AlreadyExistingMemberException e){
			errors.rejectValue("email", "duplicate");
			return "register/step2";
		}
	}
	
	@RequestMapping(value="/register/step3", method=RequestMethod.GET)
	public String handleStep3Get(){
		return "redirect:/register/step1";
	}
}
