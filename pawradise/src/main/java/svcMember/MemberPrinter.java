package svcMember;

import bean.Member;

public class MemberPrinter {
	public void print(Member mem){
		System.out.printf(
			"회원정보 : 아이디=%d, 이메일=%s, 이름=%s, 등록일=%tF\n", 
			mem.getId(), mem.getEmail(), mem.getName(), 
			mem.getRegisterDate());
	}
}
