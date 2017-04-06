package bean;

import java.util.Date;

public class Comment {
	
	public int seq;
	public int c_seq; // 게시글 번호
	public String name; // 이름
	public String c_content;// 커멘트
	public Date regdate;
	public int userNum;

	
	public Comment() {
	}	

	public Comment(int c_seq, String name, String c_content, Date regdate, int userNum) {
		super();
		this.c_seq = c_seq;
		this.name = name;
		this.c_content = c_content;
		this.regdate = regdate;
		this.userNum = userNum;
	}
	
	public int getSeq() {
		return seq;
	}
	
	public int setSeq() {
		return seq;
	}

	public int getC_seq() {
		return c_seq;
	}

	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
	
}
