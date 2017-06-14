package MMC.model.login;

import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class UsersAccountBean {
	
	@Id
	private String username;

	private String password;
	@Transient
	private String vercode;
	private String userType;
	private String email;
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getVercode() {
		return vercode;
	}

	public void setVercode(String vercode) {
		this.vercode = vercode;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
