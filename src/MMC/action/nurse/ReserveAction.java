package MMC.action.nurse;

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

import MMC.model.doctor.DocSchedBean;
import MMC.model.doctor.WeeklyDateBean;
import MMC.model.login.UsersAccountBean;;

public class ReserveAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//public DocSchedBean dsb = new DocSchedBean();
	public WeeklyDateBean wd = new WeeklyDateBean();

	private String dateNow;
	private String DocNum;
	//private Date converted;
	private int docSched;
	//private int time;

	//private String status;


	public String execute(){
		
	
		return reserve();
	}
	
	
	public String reserve() {

	    	
	
		
		Map<String, Object> sess = ActionContext.getContext().getSession();
		String patient=(String)sess.get("patient");
		/*String hql="FROM DocScheduleTable WHERE docNum = :doc_num AND"
				+ " date between :start_date and :end_date AND"
				+ " status = 'available' " 
				+ "order by time";
		*/
	
	    
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();	   
			Session session = sessionFactory.openSession();

			session.beginTransaction();
			Query query = session.createQuery
					("From DocScheduleTable WHERE docSched= :docSched");
			query.setParameter("docSched", docSched);
			Date reserveday=((DocSchedBean)query.uniqueResult()).getDate();
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date today = new Date();
		
			
		    try {
		    	today=df.parse(df.format(today));

				if(reserveday.before(today)&&!reserveday.equals(today)){
					return ERROR;
				}
		    
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			query = session.createQuery
					("update DocScheduleTable as dsb set status = :stat"
							+ " , patientNum = :patientNum WHERE dsb.docSched= :docSched");
			
			
			
			query.setParameter("stat", "reserved");
			query.setParameter("patientNum", patient);
			query.setParameter("docSched", docSched);
			query.executeUpdate();
			session.getTransaction().commit();
			
			return SUCCESS;
			
	}


	/*public DocSchedBean getDsb() {
		return dsb;
	}
	public void setDsb(DocSchedBean dsb) {
		this.dsb = dsb;
	}*/
	public String getDateNow() {
		return dateNow;
	}
	public void setDateNow(String dateNow) {
		this.dateNow = dateNow;
	}
	public String getDocNum() {
		return DocNum;
	}
	public void setDocNum(String docNum) {
		DocNum = docNum;
	}
	/*public Date getConverted() {
		return converted;
	}
	public void setConverted(Date converted) {
		this.converted = converted;
	}
	*/
	

	public int getDocSched() {
		return docSched;
	}


	public void setDocSched(int docSched) {
		this.docSched = docSched;
	}


	public WeeklyDateBean getWd() {
		return wd;
	}


	public void setWd(WeeklyDateBean wd) {
		this.wd = wd;
	}

/*
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
	}*/


}
