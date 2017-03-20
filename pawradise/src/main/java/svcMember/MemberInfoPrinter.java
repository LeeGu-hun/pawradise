package svcMember;

import bean.Member;
import dao.MemberDao;
import exception.MemberNotFoundException;

public class MemberInfoPrinter {
	MemberDao memberDao;
	MemberPrinter printer;
	
	public MemberDao getMemberDao() {
		return memberDao;
	}
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	public MemberPrinter getPrinter() {
		return printer;
	}
	public void setPrinter(MemberPrinter printer) {
		this.printer = printer;
	}
	
	public void printMemberInfo(String email){
		Member mem = memberDao.selectByEmail(email);
		if(mem == null){
			throw new MemberNotFoundException();
		}
		printer.print(mem);
		System.out.println();
	}
}
