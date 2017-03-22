package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import bean.Member;
import bean.Mypage;
import command.PageMaker;
import dao.MemberDao;
import exception.MemberNotFoundException;
import validator.ListCommandValidator;

@Controller
public class MemberListController {
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
			PageMaker pageMaker, Model model){
		
//		new ListCommandValidator().validate(pageMaker, errors);
//		if(errors.hasErrors()) return "member/memberList";
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

	@RequestMapping(value="/member/detail/{id}")
	public String detail(
			@PathVariable("id") Long id, Model model){
		Member member = memberDao.selectById(id);
		if(member == null) throw new MemberNotFoundException();
		model.addAttribute("member", member);
		return "member/memberDetail";
	}
	@ExceptionHandler(MemberNotFoundException.class)
	public String handNotFoundException(){
		return "member/noMember";
	}
	@ExceptionHandler(TypeMismatchException.class)
	public String typeMismatchException(){
		return "member/invalidId";
	}
	@RequestMapping(value="/mypage/mydetail/{email}")
	public String detail2(
			@PathVariable("email") String email, Model model, Mypage mypage){
		Member member = memberDao.selectByEmail(email);
		if(member == null) throw new MemberNotFoundException();
		model.addAttribute("member", member);
		return "mypage/mydetail";
	}
}
