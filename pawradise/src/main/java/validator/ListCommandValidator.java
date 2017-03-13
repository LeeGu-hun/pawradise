package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.PageMaker;

public class ListCommandValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		return PageMaker.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "from", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "to", "required");
		
	}
	
}
