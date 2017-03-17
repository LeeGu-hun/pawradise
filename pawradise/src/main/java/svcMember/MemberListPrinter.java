package svcMember;

import java.util.Collection;

import bean.Member;
import dao.MemberDao;

public class MemberListPrinter {
	private MemberDao memberDao;
	private MemberPrinter printer;
	public MemberListPrinter(MemberDao memberDao, MemberPrinter printer) {
		super();
		this.memberDao = memberDao;
		this.printer = printer;
	}
	
	public void printAll(){
		Collection<Member> members = memberDao.selectAll();
		for(Member m : members){
//			printer.print(m);
		}
	}
}
