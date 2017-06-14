package MMC.model.login;

import javax.persistence.*;


@Entity(name="PatientRecord")
/*@TypeDef(
	    name="encryptedpass", 
	    typeClass=EncryptedStringType.class, 
	    parameters= {
	        @Parameter(name="encryptorRegisteredName", value="strongHibernateEncryptor")
	    }
	)*/
public class PatientRegisterBean {
	
	@Id
	private String username;
	/*@Type(type="encryptedpass")*/

	private String fname;
	private String lname;
	private String birthdate;
	private String address;
	private String sex;


	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	

	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}


	
	
}
