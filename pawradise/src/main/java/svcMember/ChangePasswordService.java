package svcMember;

import org.springframework.transaction.annotation.Transactional;

import bean.Member;
import command.ChangePwdCommand;
import dao.MemberDao;
import exception.MemberNotFoundException;

public class ChangePasswordService {
	private MemberDao memberDao;
	private ChangePwdCommand changePwdCommand;
	
	public ChangePasswordService(MemberDao memberDao) {
		super();
		this.memberDao = memberDao;
	}

	@Transactional
	public void changePassword(String email, String currentPassword, String newPassword){
		Member member = memberDao.selectByEmail(email);
//		System.out.println(member);
		if(member == null) throw new MemberNotFoundException();
//		System.out.println("oldPwd: "+oldPwd+"newPwd: "+ newPwd);
		member.changePassword(currentPassword, newPassword);
		memberDao.update(newPassword, email);
	}
}
