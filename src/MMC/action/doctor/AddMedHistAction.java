package MMC.action.doctor;

import java.sql.Timestamp;
import java.util.Map;

import javax.swing.plaf.basic.BasicSliderUI.ActionScroller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.jasypt.util.text.StrongTextEncryptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import MMC.model.doctor.MedHistBean;
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;


public class AddMedHistAction extends ActionSupport{
	private String doc;	
	private String condi;
	private String hospital;
	//private String date;
	private String allergies;
	
	private String bp;
	private String ht;
	private String hr;
	private String wt;
	private String rr;
	private String bmi;
	private String prevhosp;
	private String prevop;
	
	Map<String, Object> sess = ActionContext.getContext().getSession();
	MedHistBean mh=new MedHistBean();
	public String execute(){
		UsersAccountBean doctor=(UsersAccountBean)sess.get("person");
		StrongTextEncryptor textEncryptor = new StrongTextEncryptor();
		textEncryptor.setPassword("l1o2o3p4l5a6b");
		java.util.Date ts= new java.util.Date();
		Timestamp ts_now = new Timestamp(ts.getTime());
		mh.setDtime(ts_now);
		mh.setDoc(textEncryptor.encrypt(doc));
		mh.setCondi(textEncryptor.encrypt(condi));
		mh.setHospital(textEncryptor.encrypt(hospital));
	//	mh.setDate(textEncryptor.encrypt(date));
		mh.setAllergies(textEncryptor.encrypt(allergies));
		mh.setPhysician(doctor.getUsername());
		
		mh.setBp(textEncryptor.encrypt(bp));
		mh.setHt(textEncryptor.encrypt(ht));
		mh.setHr(textEncryptor.encrypt(hr));
		mh.setWt(textEncryptor.encrypt(wt));
		mh.setRr(textEncryptor.encrypt(rr));
		mh.setBmi(textEncryptor.encrypt(bmi));
		
		mh.setPrevhosp(textEncryptor.encrypt(prevhosp));
		mh.setPrevop(textEncryptor.encrypt(prevop));
		
		mh.setPatient((String)sess.get("patient"));
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();	   
			Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(mh);
		String s=textEncryptor.encrypt("meesage");
		System.out.println(s);
		System.out.println(textEncryptor.decrypt(s));
		session.getTransaction().commit();
		return SUCCESS;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getCondi() {
		return condi;
	}
	public void setCondi(String condi) {
		this.condi = condi;
	}
	public String getHospital() {
		return hospital;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
/*	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}*/
	public String getAllergies() {
		return allergies;
	}
	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}
	public String getBp() {
		return bp;
	}
	public void setBp(String bp) {
		this.bp = bp;
	}
	public String getHt() {
		return ht;
	}
	public void setHt(String ht) {
		this.ht = ht;
	}
	public String getHr() {
		return hr;
	}
	public void setHr(String hr) {
		this.hr = hr;
	}
	public String getWt() {
		return wt;
	}
	public void setWt(String wt) {
		this.wt = wt;
	}
	public String getRr() {
		return rr;
	}
	public void setRr(String rr) {
		this.rr = rr;
	}
	public String getBmi() {
		return bmi;
	}
	public void setBmi(String bmi) {
		this.bmi = bmi;
	}
	public String getPrevhosp() {
		return prevhosp;
	}
	public void setPrevhosp(String prevhosp) {
		this.prevhosp = prevhosp;
	}
	public String getPrevop() {
		return prevop;
	}
	public void setPrevop(String prevop) {
		this.prevop = prevop;
	}

}
