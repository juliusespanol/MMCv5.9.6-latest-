package MMC.model.doctor;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DiagnosisBean {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int DId;
	private String patient;
	private String physician;
	private Timestamp ts;
	private String diagnosis;
	private String prescription;
	private String notes;
	public int getDId() {
		return DId;
	}
	public void setDId(int dId) {
		DId = dId;
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
	public Timestamp getTs() {
		return ts;
	}
	public void setTs(Timestamp ts) {
		this.ts = ts;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getPrescription() {
		return prescription;
	}
	public void setPrescription(String prescription) {
		this.prescription = prescription;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}



	
}
