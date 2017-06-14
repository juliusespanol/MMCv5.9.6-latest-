package MMC.action.doctor;
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.jasypt.util.password.StrongPasswordEncryptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport{
	private String fname;
	private String username;
	private String lname;
	private String birthdate;
	private String sex;
	List<PatientRegisterBean> p;

	public String execute(){
		
		return SUCCESS;
	}
	public void validate(){
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
			Session session = sessionFactory.openSession();
		
		String hql="FROM PatientRecord P  where lower(P.username) like lower(:username) and "
				+ "lower(P.fname) like lower(:fname) and "
				+"lower(P.lname) like lower(:lname) and "
				+"lower(P.birthdate) like lower(:birthdate) and "
				+"lower(P.sex) like lower(:sex)";
		
		
		Query query=session.createQuery(hql);
		query.setParameter("username", "%"+username+"%");
		query.setParameter("fname", "%"+fname+"%");
		query.setParameter("lname", "%"+lname+"%");
		query.setParameter("birthdate", "%"+birthdate+"%");
		query.setParameter("sex", "%"+sex+"%");



		 p = (List<PatientRegisterBean>) query.list();
		if(p.size() == 0){
			addFieldError("username", "No Patients Found");
		}else{

			System.out.println("goood");			
			
		}
		
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public List<PatientRegisterBean> getP() {
		return p;
	}
	public void setP(List<PatientRegisterBean> p) {
		this.p = p;
	}
}
