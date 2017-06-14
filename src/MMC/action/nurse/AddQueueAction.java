package MMC.action.nurse;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.jasypt.util.text.StrongTextEncryptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.doctor.DiagnosisBean;
import MMC.model.doctor.MedHistBean;
import MMC.model.doctor.QueueBean;
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;

public class AddQueueAction extends ActionSupport{
	Map<String, Object> sess = ActionContext.getContext().getSession();

	private String patient;
	private String doctor;
	private String type;

	QueueBean q=new QueueBean();
	public String execute(){
		System.out.println("ihafkiwaeuif"+doctor);
		java.util.Date ts= new java.util.Date();
		Timestamp ts_now = new Timestamp(ts.getTime());
		q.setDtime(ts_now);
		q.setPatient(patient);
		q.setPhysician(doctor);
		q.setType("WALKIN");
		
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();	   
			Session session = sessionFactory.openSession();
		String hql="FROM UsersAccountBean P WHERE P.username= :username";
			
			
		Query query=session.createQuery(hql);
		query.setParameter("username", patient);
		List<UsersAccountBean> list = (List<UsersAccountBean>) query.list();
		if(list.size()!=0){
			q.setAccount("ACCOUNT");

		}else{
			q.setAccount("GUEST");
		}

		session.beginTransaction();
		session.save(q);
	
		session.getTransaction().commit();
		return SUCCESS;
	}


	public String getPatient() {
		return patient;
	}


	public void setPatient(String patient) {
		this.patient = patient;
	}


	public String getDoctor() {
		return doctor;
	}


	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}

}
