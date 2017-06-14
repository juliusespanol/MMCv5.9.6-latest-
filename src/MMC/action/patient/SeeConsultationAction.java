package MMC.action.patient;

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
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;

public class SeeConsultationAction  extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	Map<String, Object> sess = ActionContext.getContext().getSession();
	private String s;
	private DiagnosisBean d;
	public String execute(){
		Map<String, Object> sess = ActionContext.getContext().getSession();
		//sess.put("patient",patient);
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
		Session session = sessionFactory.openSession();
	
		System.out.println("thisiddddsit"+Integer.parseInt(s));

		String hql="FROM DiagnosisBean M WHERE M.DId= :id";
	
	    StrongTextEncryptor textEncryptor = new StrongTextEncryptor();
	    textEncryptor.setPassword("l1o2o3p4l5a6b");
		Query query=session.createQuery(hql);
		query.setParameter("id", Integer.parseInt(s));


		d = (DiagnosisBean) query.uniqueResult();
		if(d == null){
			System.out.println("diagnosis null");
		}else{
			//decrypts encrypted stuffs
			d.setDiagnosis(textEncryptor.decrypt(d.getDiagnosis()));
			d.setPrescription(textEncryptor.decrypt(d.getPrescription()));
			d.setNotes(textEncryptor.decrypt(d.getNotes()));

		}
		
		
	return SUCCESS;	
	}




	public DiagnosisBean getD() {
		return d;
	}
	public void setD(DiagnosisBean d) {
		this.d = d;
	}


	public String getS() {
		return s;
	}


	public void setS(String s) {
		this.s = s;
	}

	

}
