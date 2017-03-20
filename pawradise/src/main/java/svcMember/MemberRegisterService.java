package svcMember;

import java.util.Date;

import bean.Member;
import bean.RegisterRequest;
import dao.MemberDao;
import exception.AlreadyExistingMemberException;

public class MemberRegisterService {
	private MemberDao memberDao;

	public MemberRegisterService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	public void regist(RegisterRequest req){
		Member member = memberDao.selectByEmail(req.getEmail());
		
		if(member != null)
			throw new AlreadyExistingMemberException(
					"중복된 아이디" + req.getEmail());
		Member newMember = new Member(req.getId(), req.getName(), req.getPassword(),req.getEmail(), req.getPetName(),
				req.getPhone(),req.getAddress(),new Date());

		memberDao.insert(newMember);
	}
}
