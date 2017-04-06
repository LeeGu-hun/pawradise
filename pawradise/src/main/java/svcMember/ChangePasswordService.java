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
	public void changePassword(int userNum, String oldPwd, String newPwd){
		Member member = memberDao.selectByUserNum(userNum);
//		System.out.println(member);
		if(member == null) throw new MemberNotFoundException();
//		System.out.println("oldPwd: "+oldPwd+"newPwd: "+ newPwd);
		member.changePassword(oldPwd, newPwd);
		memberDao.update(newPwd, userNum);
	}
}
