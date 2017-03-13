package svcMember;

import org.springframework.transaction.annotation.Transactional;

import bean.Member;
import dao.MemberDao;
import exception.MemberNotFoundException;

public class ChangePasswordService {
	private MemberDao memberDao;

	public ChangePasswordService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	@Transactional
	public void changePassword(String email, String oldPwd, String newPwd){
		Member member = memberDao.selectByEmail(email);
		if(member == null) throw new MemberNotFoundException();
		
		member.changePassword(oldPwd, newPwd);
		memberDao.update(member);
	}
}
