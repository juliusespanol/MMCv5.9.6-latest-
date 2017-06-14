package MMC.model.doctor;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class QueueBean {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int histID;
	private Timestamp dtime;
	private String patient;
	private String physician;
	private String account;
	private String type;
	public int getHistID() {
		return histID;
	}
	public void setHistID(int histID) {
		this.histID = histID;
	}
	public Timestamp getDtime() {
		return dtime;
	}
	public void setDtime(Timestamp dtime) {
		this.dtime = dtime;
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

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	
}
