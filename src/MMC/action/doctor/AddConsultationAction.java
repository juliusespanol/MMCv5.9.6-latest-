package MMC.action.doctor;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

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

public class AddConsultationAction extends ActionSupport{
	Map<String, Object> sess = ActionContext.getContext().getSession();
	DiagnosisBean db=new DiagnosisBean();

	private String diagnosis;
	private String prescription;
	private String notes;

	List<MedHistBean> list;
	private String patient;
	public String execute(){
		UsersAccountBean doctor=(UsersAccountBean)sess.get("docuser");
		StrongTextEncryptor textEncryptor = new StrongTextEncryptor();
		textEncryptor.setPassword("l1o2o3p4l5a6b");
		java.util.Date ts= new java.util.Date();
		Timestamp ts_now = new Timestamp(ts.getTime());
		db.setNotes(textEncryptor.encrypt(notes));
		db.setPrescription(textEncryptor.encrypt(prescription));
		db.setDiagnosis(textEncryptor.encrypt(diagnosis));
		db.setTs(ts_now);
		db.setPhysician(doctor.getUsername());
		db.setPatient((String)sess.get("patient"));
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();	   
			Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(db);
	
		session.getTransaction().commit();
		return SUCCESS;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public List<MedHistBean> getList() {
		return list;
	}
	public void setList(List<MedHistBean> list) {
		this.list = list;
	}
	public String getPrescription() {
		return prescription;
	}
	public void setPrescription(String prescription) {
		this.prescription = prescription;
	}
}
