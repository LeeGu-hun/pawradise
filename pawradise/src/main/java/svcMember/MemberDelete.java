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
	public void deleteMember(int userNum){
		Member member = memberDao.selectByUserNum(userNum);
		if(member == null){
			throw new MemberNotFoundException();
		}
		memberDao.memberDelete(userNum);
	}

}
