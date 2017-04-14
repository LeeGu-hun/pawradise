package xml;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="memdata", 
	propOrder={"name","password", "email", "phone","userNum"})
public class MemData{  
	
	
	private String name;
	private String password;
	private String email;
	private String phone;
	private int userNum;


	public MemData() {}
	
	@Override
	public String toString(){
		return "memdata [name=" + name +
				", password=" + password +
				", email=" + email +
				", phone=" + phone +	
				", userNum=" + userNum +
				"]";
	}
	
	public MemData(String name, String password, String email, String phone, int userNum) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.userNum = userNum;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}	
	
}
 
