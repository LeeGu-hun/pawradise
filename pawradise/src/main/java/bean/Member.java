package bean;

import java.util.Date;

import exception.IdPasswordNotMatchingException;

public class Member {
	private int userNum;
	private String id;
	private String name;
	private String password;
	private String email;
	private String petName;
	private String phone;
	private String address;
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

	public Member(String id, String name, String password, String email, String petName, String phone, String address, Date regdate) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.petName = petName;
		this.phone = phone;
		this.address = address;
		this.regdate=regdate;   
	}
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
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
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
		if(!password.equals(oldPassword))
			throw new IdPasswordNotMatchingException();
		this.password = newPassword;
	}
	public boolean matchPassword(String password){
		return (this.password.equals(password))?true:false;
	}
}
