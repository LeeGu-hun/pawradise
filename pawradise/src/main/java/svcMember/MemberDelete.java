package svcMember;

import bean.Member;
import dao.MemberDao;
import exception.MemberNotFoundException;

public class MemberDelete {
private MemberDao memberDao;
	
	public MemberDelete() {
	}
	public void setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
	}
	public void deleteMember(String email){
		Member member = memberDao.selectByEmail(email);
		if(member == null){
			throw new MemberNotFoundException();
		}
		memberDao.memberDelete(member);
	}

}
