package bean;

import java.util.Date;

import exception.IdPasswordNotMatchingException;

public class Member {
	private int userNum;
	private String name;
	private String password;
	private String email;
	private String phone;
	private Date regdate;
		
	private String currentPassword;
	private String newPassword;	

	public String getCurrentPassword() {
		return currentPassword;
	}
	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	
	public Member() {
		super();
	}

	public Member(String name, String password, String email, String phone, Date regdate) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
		this.regdate=regdate;   
		this.phone=phone;
	}
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone; 
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public void changePassword(String currentPassword, String newPassword){
		if(!password.equals(currentPassword))
			throw new IdPasswordNotMatchingException();
		this.password = newPassword;
	}
	public boolean matchPassword(String password){
		return (this.password.equals(password))?true:false;
	}
	
}
