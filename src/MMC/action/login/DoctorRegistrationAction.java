package MMC.action.login;

import MMC.model.login.DoctorBean;
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;
import MMC.utility.verify;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Map;



import org.jasypt.util.password.StrongPasswordEncryptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DoctorRegistrationAction extends ActionSupport
		{
	private String username;
	private String password;
	private String fname;
	private String lname;
	private String address;
	private String birthdate;
	//private String email;
	private String sex;
	private String userType;
	private String specialization;
	
	private DoctorBean d = new DoctorBean();
	private UsersAccountBean use= new UsersAccountBean();
	private verify ver = new verify();
	public String execute(){		    
	String code = ver.genCode(); 
	

	d.setUsername(username);
	d.setFname(fname);
	d.setLname(lname);
	d.setAddress(address);
	d.setBirthdate(birthdate);
	d.setSex(sex);
	d.setSpecialization(specialization);
	if(userType.equals("NURSE"))
		d.setSpecialization("ADMIN");
	//hiwalay sila
	use.setUsername(username);
	use.setPassword(password);
	use.setUserType(userType);
	use.setVercode(code);
	//use.setEmail(email);
	System.out.println(code);
	StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
	use.setPassword(passwordEncryptor.encryptPassword(use.getPassword()));
	
	Map<String, Object> session = ActionContext.getContext().getSession();
	session.put("doctor",d);
	session.put("Account",use);
/*
	StrongTextEncryptor textEncryptor = new StrongTextEncryptor();
	textEncryptor.setPassword(myEncryptionPassword);
	String myEncryptedText = textEncryptor.encrypt(myText);
	...
	String plainText = textEncryptor.decrypt(myEncryptedText);*/
		/*SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			

			session.save(prb);
			session.getTransaction().commit();*/
		return SUCCESS;
	}
	
	public void validate(){
		
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
		Session session = sessionFactory.openSession();
		Query query=session.createQuery("FROM UsersAccountBean A WHERE A.username= :username");
		query.setParameter("username", username);
		boolean exists =query.uniqueResult() != null;
		
		Query query2=session.createQuery("FROM PatientRecord P WHERE P.username= :username");
		query2.setParameter("username", username);
		boolean exists2 =query2.uniqueResult() != null;
		
		if(username.equals(" ") || username.equals("")){
			addFieldError("username", "No Username has been entered.");
		}
		if(exists||exists2){
			addFieldError("username", "Username Exists");
		}
		if(password.equals(username)){
			addFieldError("password", "password is same as your username, choose another one");
		}
		if(password.length()<=5){
			addFieldError("password", "weak password");
		}
		if(password.length()>=25){
			addFieldError("password", "password too long:(max=24characters)");
		}
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}


	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	




}
