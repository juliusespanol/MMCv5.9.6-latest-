package MMC.model.doctor;



import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity(name="DocScheduleTable")
public class DocSchedBean{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int docSched;
	private String docName;

	private String docNum;//pk from doc table
	private String patientNum; //pk from patient table
	private Date date;
	private int time;
	private String timeString;
	private String status;


	public String getTimeString() {
		return timeString;
	}
	public void setTimeString(String timeString) {
		this.timeString = timeString;
	}
	public String getDocName() {
		return docName;
	}
	public void setDocName(String docName) {
		this.docName = docName;
	}
	public int getDocSched() {
		return docSched;
	}
	public void setDocSched(int docSched) {
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}


	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}


}
