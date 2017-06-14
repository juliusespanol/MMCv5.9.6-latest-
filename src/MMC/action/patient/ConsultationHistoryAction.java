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

public class ConsultationHistoryAction  extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	Map<String, Object> sess = ActionContext.getContext().getSession();

	private List<DiagnosisBean> list;
	public String execute(){
		Map<String, Object> sess = ActionContext.getContext().getSession();
		String s=((UsersAccountBean)sess.get("patientuser")).getUsername();
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
		Session session = sessionFactory.openSession();
	

		String hql="FROM DiagnosisBean M WHERE M.patient= :patient  order by M.ts desc";
	
	    StrongTextEncryptor textEncryptor = new StrongTextEncryptor();
	    textEncryptor.setPassword("l1o2o3p4l5a6b");
		Query query=session.createQuery(hql);
		query.setParameter("patient", s);


		list = (List<DiagnosisBean>) query.list();
		if(list == null){
			System.out.println("uts null");
		}
		for(int i=0;i<list.size();i++){
			list.get(i).setDiagnosis(textEncryptor.decrypt(list.get(i).getDiagnosis()));
			list.get(i).setNotes(textEncryptor.decrypt(list.get(i).getNotes()));
			list.get(i).setPrescription(textEncryptor.decrypt(list.get(i).getPrescription()));
		}
		
		
	return SUCCESS;	
	}
	public List<DiagnosisBean> getList() {
		return list;
	}
	public void setList(List<DiagnosisBean> list) {
		this.list = list;
	}








	

}
