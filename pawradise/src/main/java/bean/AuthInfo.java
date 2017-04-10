package bean;

public class AuthInfo {
	private int UserNum;
	private String email;
	private String name;
	
	
	public AuthInfo(int userNum, String name, String email) {
		super();
		UserNum = userNum;
		this.name = name;
		this.email = email;
	} 

	public int getUserNum() {
		return UserNum;
	}

	public void setUserNum(int userNum) {
		UserNum = userNum;
	}
	
	public String getEmail() {
		return email;
	}
	public String getName() {
		return name;
	}
	public void add(){
		
	}
	
}
