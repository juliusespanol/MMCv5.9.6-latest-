package MMC.action.login;



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

import MMC.model.login.DoctorBean;
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;

public class LoginAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String type;
	SessionFactory sessionFactory = new Configuration()
			.configure().buildSessionFactory();

	Session session = sessionFactory.openSession();

	public String execute(){
		Map<String, Object> sess = ActionContext.getContext().getSession();
		UsersAccountBean use=(UsersAccountBean)sess.get("person");
		if(use.getUserType().equals("PATIENT")){
			sess.put("patientuser", use);
			Query query=session.createQuery("FROM PatientRecord P WHERE P.username= :username");
			query.setParameter("username", username);

			PatientRegisterBean P= (PatientRegisterBean) query.uniqueResult();
			sess.put("name", P.getFname()+" "+ P.getLname());
			sess.put("type","Patient");

			return "patient";

		}	else if(use.getUserType().equals("DOCTOR")){
			sess.put("docuser", use);
			Query query=session.createQuery("FROM DoctorBean P WHERE P.username= :username");
			query.setParameter("username", username);

			DoctorBean D= (DoctorBean) query.uniqueResult();
			sess.put("name", D.getFname()+" "+ D.getLname());
			sess.put("type","Doctor");
			return "doctor";

		}	else if(use.getUserType().equals("NURSE")){
			sess.put("nurseuser", use);
			Query query=session.createQuery("FROM DoctorBean P WHERE P.username= :username");
			query.setParameter("username", username);
			DoctorBean D= (DoctorBean) query.uniqueResult();
			sess.put("name", D.getFname()+" "+ D.getLname());
			sess.put("type","Nurse");
			return "nurse";

		}
		System.err.println("Usertype is not a doctor/nurse/patient");
		//see validation for code
		return ERROR;


	}
	public void validate(){
		if(username.trim().length()==0){
			addFieldError("username", "No input");
		}
		if(password.trim().length()==0){
			addFieldError("password", "No input");
		}


		String hql="FROM UsersAccountBean P WHERE P.username= :username";


		Query query=session.createQuery(hql);
		query.setParameter("username", username);


		List<UsersAccountBean> list = (List<UsersAccountBean>) query.list();
		if(list.size() == 0){
			addFieldError("username", "This username does not exist");
		}else{
			UsersAccountBean U= (UsersAccountBean) query.uniqueResult();

			StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();

			if (passwordEncryptor.checkPassword(password, U.getPassword())) {
				Map<String, Object> sess = ActionContext.getContext().getSession();
				sess.put("login",true);
				sess.put("person", U);

				setType(U.getUserType());			
				System.out.println("goood");			
			} else {
				System.out.println("baddd");
				addFieldError("username", "Wrong Credentials");
			}
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
