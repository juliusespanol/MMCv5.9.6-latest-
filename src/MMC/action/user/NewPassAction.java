package MMC.action.user;



import java.util.Map;
import javax.servlet.http.HttpSession;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import org.jasypt.util.password.StrongPasswordEncryptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;

public class NewPassAction extends ActionSupport {
	/**
	 * 
	 */
	Map<String, Object> sess = ActionContext.getContext().getSession();

	private static final long serialVersionUID = 1L;
	private String oldpass;
	private String pass1;
	private String pass2;

	public String execute(){
		//see validation for code
		Map<String, Object> sess = ActionContext.getContext().getSession();
		UsersAccountBean use=(UsersAccountBean)sess.get("person");
		
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
		
		use.setPassword(passwordEncryptor.encryptPassword(pass1));
		session.beginTransaction();
		Query query=session.createQuery
				("update UsersAccountBean use set use.password = :pass1 WHERE use.username= :username");
		query.setParameter("pass1", use.getPassword());
		query.setParameter("username", use.getUsername());
		System.out.println("222"+use.getUsername());
		System.out.println("222"+use.getPassword());
		System.out.println("222"+pass1);


		int result = query.executeUpdate();
		session.getTransaction().commit();
		if(result==1)
		return SUCCESS;
		else{
		
		System.out.println("Error");
		return ERROR;	
		}
		
	}
	public void validate(){
		if(pass1.trim().length()==0||pass2.trim().length()==0){
			addFieldError("pass1", "No input");
		}
		else if(!pass1.equals(pass2)){
			addFieldError("pass1", "input does not match");

		}
		if(pass1.length()<=5){
			addFieldError("pass1", "weak password");
		}
		if(pass1.length()>=25){
			addFieldError("pass1", "password too long:(max=24characters)");
		}
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
			Session session = sessionFactory.openSession();
		
		String hql="FROM UsersAccountBean P WHERE P.username= :username";
		UsersAccountBean user= (UsersAccountBean) sess.get("person");
		
		Query query=session.createQuery(hql);
		query.setParameter("username", user.getUsername());
		if(pass1.equals(user.getUsername())){
			addFieldError("pass1", "pass is same as username");

		}

		List<UsersAccountBean> list = (List<UsersAccountBean>) query.list();
		if(list.size() == 0){
			addFieldError("username", "This username does not exist");
		}else{
		UsersAccountBean U= (UsersAccountBean) query.uniqueResult();

		StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
		
		if (passwordEncryptor.checkPassword(oldpass, U.getPassword())) {
			Map<String, Object> sess = ActionContext.getContext().getSession();			

			} else {
				System.out.println("baddd");
				addFieldError("oldpass", "Wrong Credentials");
	  	  	}
		}
		
		
	}
	public String getPass1() {
		return pass1;
	}
	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}
	public String getPass2() {
		return pass2;
	}
	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}
	public String getOldpass() {
		return oldpass;
	}
	public void setOldpass(String oldpass) {
		this.oldpass = oldpass;
	}
	
		


}
