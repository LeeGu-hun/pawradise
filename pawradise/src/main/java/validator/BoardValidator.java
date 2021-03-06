package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import bean.Board;


public class BoardValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		return Board.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "required");		
	}
	
}
