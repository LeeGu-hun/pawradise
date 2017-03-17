package bean;

public class Comment {

	public int c_seq; // 게시글 번호
	public String name; // 이름
	public String c_content;// 커멘트

	public Comment() {
	}
	
	

	public Comment(String name, String c_content) {
		this.name = name;
		this.c_content = c_content;
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

}
