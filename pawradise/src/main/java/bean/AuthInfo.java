package bean;

public class AuthInfo {
	private int UserNum;
	private String id;
	private String email;
	private String name; 
	 
	
	public AuthInfo(int userNum, String id, String email, String name) {
		super();
		UserNum = userNum;
		this.id = id;
		this.email = email;
		this.name = name;
	}


	public int getUserNum() {
		return UserNum;
	}

	public void setUserNum(int userNum) {
		UserNum = userNum;
	}

	public String getId() {
		return id;
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
