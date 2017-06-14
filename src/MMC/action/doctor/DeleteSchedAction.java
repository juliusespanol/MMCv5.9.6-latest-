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

import MMC.model.doctor.DocSchedBean;
import MMC.model.doctor.WeeklyDateBean;
import MMC.model.login.UsersAccountBean;

public class DeleteSchedAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public WeeklyDateBean wd = new WeeklyDateBean();
	
	private String dateNow;
	private String docNum;
	private int docSched;
	
	
	public String execute(){
		
		
		return delete();
	}
	
	public String delete(){
	
	  	
		
		
			Map<String, Object> sess = ActionContext.getContext().getSession();
			UsersAccountBean u=(UsersAccountBean)sess.get("patientuser");
			/*String hql="FROM DocScheduleTable WHERE docNum = :doc_num AND"
					+ " date between :start_date and :end_date AND"
					+ " status = 'available' " 
					+ "order by time";
			*/
			System.out.println("dc "+docSched);
		    
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
				System.out.println("dc "+docSched+"rs "+reserveday+" "+today);

				
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
						("DELETE FROM DocScheduleTable dsb WHERE dsb.docSched= :docSched");
				
				
				
				query.setParameter("docSched", docSched);
				query.executeUpdate();
				session.getTransaction().commit();
				
		return SUCCESS;
	}

	public WeeklyDateBean getWd() {
		return wd;
	}

	public void setWd(WeeklyDateBean wd) {
		this.wd = wd;
	}

	public String getDateNow() {
		return dateNow;
	}

	public void setDateNow(String dateNow) {
		this.dateNow = dateNow;
	}

	public String getDocNum() {
		return docNum;
	}

	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}

	public int getDocSched() {
		return docSched;
	}

	public void setDocSched(int docSched) {
		this.docSched = docSched;
	}
}
