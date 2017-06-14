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

import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;

public class Logout extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute(){
		Map<String, Object> sess = ActionContext.getContext().getSession();
		sess.remove("person");
		sess.remove("patientuser");
		sess.remove("nurseuser");	
		sess.remove("docuser");
		sess.remove("name");	
		sess.remove("type");
		sess.remove("patient");	
		
		sess.put("login", false);

		return SUCCESS;
			
	}

}
