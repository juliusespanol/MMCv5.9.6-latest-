package MMC.action.login;

import java.util.Map;
import javax.servlet.http.HttpSession;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import org.jasypt.util.password.StrongPasswordEncryptor;

import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;
import MMC.model.login.VerCodeBean;
import MMC.utility.verify;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ForgotAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	Map<String, Object> s= ActionContext.getContext().getSession();
	
	UsersAccountBean use= new UsersAccountBean();
	private verify ver = new verify();
	private String email;
	
	
	SessionFactory sessionFactory = new Configuration()
			.configure().buildSessionFactory();
	Session session = sessionFactory.openSession();
	
	
	String code = ver.genCode();
	public String execute(){
		System.out.println("("+email+")");
		
	//	prb.setEmail(email);
		use.setVercode(code);
		

		String hql="FROM UsersAccountBean U WHERE U.username= :email";
		Query query=session.createQuery(hql);
		query.setParameter("email", email);
		List<UsersAccountBean> list = (List<UsersAccountBean>) query.list();	
		
		use.setUsername(list.get(0).getUsername());
		System.out.println(" "+list.get(0).getUsername());
		Map<String, Object> sess = ActionContext.getContext().getSession();
		sess.put("Account", use);
		
		return SUCCESS;
		
	}
	
	public void validate(){
		System.out.println("huhuhuh"+email.trim().length()==0+"huhu");
		if(email.trim().length()==0){
			addFieldError("email", "No input");
		}
		String hql="FROM UsersAccountBean U WHERE U.username= :email";
		Query query=session.createQuery(hql);
		query.setParameter("email", email);
		List<UsersAccountBean> list = (List<UsersAccountBean>) query.list();

		if(list.size()==0){
			addFieldError("email", "does not exist");
		}
		
	}
	

	

	public UsersAccountBean getUse() {
		return use;
	}

	public void setUse(UsersAccountBean use) {
		this.use = use;
	}



	public verify getVer() {
		return ver;
	}

	public void setVer(verify ver) {
		this.ver = ver;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
	


}
