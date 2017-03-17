package bean;

import java.util.Date;

import exception.IdPasswordNotMatchingException;

public class Member {
	private int userNum;
	private String id;
	private String name;
	private String passwd;
	private String email;
	private String petName;
	private String address;
	private Date regdate;	
	
	public Member(String id, String name, String passwd, String email, String petName, String address,
			Date regdate) {
		
		this.id = id;
		this.name = name;
		this.passwd = passwd;
		this.email = email;
		this.petName = petName;
		this.address = address;
		this.regdate = regdate;
	}
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserno(int userNum) {
		this.userNum = userNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetname(String petName) {
		this.petName = petName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public void changePassword(String oldPassword, String newPassword){
		if(!passwd.equals(oldPassword))
			throw new IdPasswordNotMatchingException();
		this.passwd = newPassword;
	}
	public boolean matchPassword(String password){
		return (this.passwd.equals(password))?true:false;
	}
}
