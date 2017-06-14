package MMC.model.doctor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;



public class WeeklyDateBean {
//	private List<DocSchedBean>[] weeksched = (ArrayList<DocSchedBean>[]) new ArrayList[7];
	private String DocNum;
	
	private Date sun;
	private String dateNow;
	private Date mon;
	private Date tue;
	private Date wed;
	private Date thu;
	private Date fri;
	private Date sat;
	
	
//	public List<DocSchedBean>[] getWeeksched() {
//		return weeksched;
//	}
//	public void setWeeksched(List<DocSchedBean>[] weeksched) {
//		this.weeksched = weeksched;
//	}
	public String getDocNum() {
		return DocNum;
	}
	public void setDocNum(String docNum) {
		DocNum = docNum;
	}
	
	public String getDateNow() {
		return dateNow;
	}
	public void setDateNow(String dateNow) {
		this.dateNow = dateNow;
	}
	public Date getSun() {
		return sun;
	}
	public void setSun(Date sun) {
		this.sun = sun;
	}
	public Date getMon() {
		return mon;
	}
	public void setMon(Date mon) {
		this.mon = mon;
	}
	public Date getTue() {
		return tue;
	}
	public void setTue(Date tue) {
		this.tue = tue;
	}
	public Date getWed() {
		return wed;
	}
	public void setWed(Date wed) {
		this.wed = wed;
	}
	public Date getThu() {
		return thu;
	}
	public void setThu(Date thu) {
		this.thu = thu;
	}
	public Date getFri() {
		return fri;
	}
	public void setFri(Date fri) {
		this.fri = fri;
	}
	public Date getSat() {
		return sat;
	}
	public void setSat(Date sat) {
		this.sat = sat;
	}

	}
