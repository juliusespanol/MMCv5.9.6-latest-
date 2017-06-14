package MMC.model.doctor;

import java.sql.Timestamp;

import javax.annotation.Generated;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.jasypt.util.text.StrongTextEncryptor;
import org.jasypt.util.text.TextEncryptor;

@Entity
public class MedHistBean{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int histID;
	private Timestamp dtime;
	private String patient;
	private String physician;
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
	
	public int getHistID() {
		return histID;
	}
	public void setHistID(int histID) {
		this.histID = histID;
	}
	public String getPatient() {
		return patient;
	}
	public void setPatient(String patient) {
		this.patient = patient;
	}
	public String getPhysician() {
		return physician;
	}
	public void setPhysician(String physician) {
		this.physician = physician;
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
	/*public String getDate() {
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
	public Timestamp getDtime() {
		return dtime;
	}
	public void setDtime(Timestamp dtime) {
		this.dtime = dtime;
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
