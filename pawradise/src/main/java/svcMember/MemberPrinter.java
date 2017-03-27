package svcMember;

import java.util.Date;

import bean.Member;

public class MemberPrinter {
	public void print(Member mem){
		System.out.printf(
			"회원정보 : 닉네임=%s, 이름=%s, 반려동물이름 =%s, 전화번호=%s, 주소=%s, 이메일 =%s, 등록일=%tF\n", 
			
			mem.getId(), mem.getName(), mem.getPetName(), mem.getPhone(), mem.getAddress(), mem.getEmail(),	mem.getRegdate());
	}
}
