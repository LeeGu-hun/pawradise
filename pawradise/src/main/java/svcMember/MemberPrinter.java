package svcMember;

import java.util.Date;

import bean.Member;

public class MemberPrinter { 
	public void print(Member mem){
		System.out.printf(
			"회원정보 : 닉네임=%s, 전화번호=%s, 이메일 =%s, 등록일=%tF\n", 
			
			 mem.getName(), mem.getPhone(),  mem.getEmail(), mem.getRegdate());		
	}
}
