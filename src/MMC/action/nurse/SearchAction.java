package MMC.action.nurse;
import MMC.model.login.DoctorBean;
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
import com.opensymphony.xwork2.ModelDriven;

public class SearchAction extends ActionSupport implements ModelDriven<PatientRegisterBean>{
	
	PatientRegisterBean pb=new PatientRegisterBean();

	List<PatientRegisterBean> p;
	List<DoctorBean> dlist;

	public String execute(){
		
		/* returns list of of doctors and search patients*/
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
		Session session = sessionFactory.openSession();
		
		String hql="FROM DoctorBean where specialization<>:doctor"; //is not admin which are doctors
		
		Query query=session.createQuery(hql);
		query.setParameter("doctor", "ADMIN");

		dlist =(List<DoctorBean>)query.list();
		if(dlist == null){
			System.out.println("no doctors");
			return ERROR;
		}else{
			return SUCCESS;
		}

		
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
		query.setParameter("username", "%"+pb.getUsername()+"%");
		query.setParameter("fname", "%"+pb.getFname()+"%");
		query.setParameter("lname", "%"+pb.getLname()+"%");
		query.setParameter("birthdate", "%"+pb.getBirthdate()+"%");
		query.setParameter("sex", "%"+pb.getSex()+"%");



		 p = (List<PatientRegisterBean>) query.list();
		if(p.size() == 0){
			addFieldError("username", "No Patients Found");
		}else{

			System.out.println("goood");			
			
		}
		
	}
	
	public List<DoctorBean> getDlist() {
		return dlist;
	}
	public void setDlist(List<DoctorBean> dlist) {
		this.dlist = dlist;
	}
	public PatientRegisterBean getPb() {
		return pb;
	}
	public void setPb(PatientRegisterBean pb) {
		this.pb = pb;
	}
	public List<PatientRegisterBean> getP() {
		return p;
	}
	public void setP(List<PatientRegisterBean> p) {
		this.p = p;
	}
	public PatientRegisterBean getModel() {
		// TODO Auto-generated method stub
		return null;
	}
}
