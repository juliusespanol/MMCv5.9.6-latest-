package MMC.action.patient;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionSupport;

import MMC.action.doctor.DocSchedAction;
import MMC.model.login.DoctorBean;
import MMC.model.doctor.DocSchedBean;

public class WeeklyDateAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private DocSchedBean dsb = new DocSchedBean();
	
	private String docSched; //pk in schedule table
	private String docNum; //pk from doc table
	private String patientNum; //pk from patient table
	
	private String date;
	private String time;
	private String note;
	private String status;
	private Date converted;
	private int convTime;
	
	public String execute() throws ParseException{
		convTime = Integer.parseInt(getTime());
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		converted = df.parse(getDate());
		
		dsb.setDocSched(Integer.parseInt(docSched));
		dsb.setDocNum(docNum);
		dsb.setPatientNum(patientNum);
		dsb.setDate(converted);
		dsb.setTime(convTime);
		dsb.setStatus(status);
			
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();	   
			Session session = sessionFactory.openSession();

			session.beginTransaction();
			session.save(dsb);
			session.getTransaction().commit();
		
		
		
		return SUCCESS;
	}


	public String getDocSched() {
		return docSched;
	}


	public void setDocSched(String docSched) {
		this.docSched = docSched;
	}


	public String getDocNum() {
		return docNum;
	}


	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}


	public String getPatientNum() {
		return patientNum;
	}


	public void setPatientNum(String patientNum) {
		this.patientNum = patientNum;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	

	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
