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
import MMC.model.login.UsersAccountBean;

public class CancelReserveAction extends ActionSupport{
	//public DocSchedBean dsb = new DocSchedBean();
	public WeeklyDateBean wd = new WeeklyDateBean();


	private int docSched;

	public String execute(){
		System.out.println(wd.getDateNow());
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
					("update DocScheduleTable as dsb set status = :stat"
							+ " , patientNum = :patientNum WHERE dsb.docSched= :docSched");
			
			
			
			query.setParameter("stat", "available");
			query.setParameter("patientNum", null);
			query.setParameter("docSched", docSched);
			query.executeUpdate();
			session.getTransaction().commit();
			return SUCCESS;
			
	}

/*	public DocSchedBean getDsb() {
		return dsb;
	}

	public void setDsb(DocSchedBean dsb) {
		this.dsb = dsb;
	}*/

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

}
