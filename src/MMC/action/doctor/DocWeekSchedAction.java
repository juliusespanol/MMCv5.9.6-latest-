package MMC.action.doctor;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.doctor.DocWeekSched;
import MMC.model.login.UsersAccountBean;

@SuppressWarnings("serial")
public class DocWeekSchedAction extends ActionSupport{

	private boolean sun;
	private boolean mon;
	private boolean tue;
	private boolean wed;
	private boolean thu;
	private boolean fri;
	private boolean sat;
	private String DocNum;

	private DocWeekSched dws = new DocWeekSched();

	public String execute(){
		/**
		 * TODO: 
		 * 1. check session
		 * 2. if session is ok add a record to DocWeekSched
		 * where sun=sun mon = mon tue=tue and so on...
		 * and modified = getDate()
		 * and DocNum = DocNum
		 * 
		 */

		Map<String, Object> sess = ActionContext.getContext().getSession();
		UsersAccountBean doc=(UsersAccountBean) sess.get("docuser");

		if(doc!=null){
			try{dws.setDate(new Date());
			dws.setDocnum(doc.getUsername());
			dws.setSun(sun);
			dws.setMon(mon);
			dws.setTue(tue);
			dws.setWed(wed);
			dws.setThu(thu);
			dws.setFri(fri);
			dws.setSat(sat);

			SessionFactory sessionFactory = new Configuration()
					.configure().buildSessionFactory();	   
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(dws);
			session.getTransaction().commit();
			return SUCCESS;
			
			}catch(Exception e){
				e.printStackTrace();
				return ERROR;
			}

		}
		else{
			return "login";
		}



	}




	public DocWeekSched getDws() {
		return dws;
	}




	public void setDws(DocWeekSched dws) {
		this.dws = dws;
	}




	public boolean isSun() {
		return sun;
	}

	public void setSun(boolean sun) {
		this.sun = sun;
	}

	public boolean isMon() {
		return mon;
	}

	public void setMon(boolean mon) {
		this.mon = mon;
	}

	public boolean isTue() {
		return tue;
	}

	public void setTue(boolean tue) {
		this.tue = tue;
	}

	public boolean isWed() {
		return wed;
	}

	public void setWed(boolean wed) {
		this.wed = wed;
	}

	public boolean isThu() {
		return thu;
	}

	public void setThu(boolean thu) {
		this.thu = thu;
	}

	public boolean isFri() {
		return fri;
	}

	public void setFri(boolean fri) {
		this.fri = fri;
	}

	public boolean isSat() {
		return sat;
	}

	public void setSat(boolean sat) {
		this.sat = sat;
	}

	public String getDocNum() {
		return DocNum;
	}

	public void setDocNum(String docNum) {
		DocNum = docNum;
	}
}
