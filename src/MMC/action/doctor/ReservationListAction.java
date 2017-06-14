package MMC.action.doctor;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.login.UsersAccountBean;
import MMC.model.doctor.DocSchedBean;
public class ReservationListAction extends ActionSupport{
	String today;
	List<DocSchedBean> que;
	Date d;
	public String execute() throws ParseException{
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		Map<String, Object> sess = ActionContext.getContext().getSession();
		UsersAccountBean doc=(UsersAccountBean) sess.get("docuser");
		
	
		if(today==null){
			d = new Date();
			
		}else{
			d = df.parse(today);
		}
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();	   
		Session session = sessionFactory.openSession();
		System.out.println("date"+ df.parse(df.format(d)));
		System.out.println("doc"+doc.getUsername());
		System.out.println();

		String hql="FROM DocScheduleTable P WHERE P.docNum= :doc and P.date=:date and P.status=:av order by P.time";
		Query query=session.createQuery(hql);
		query.setParameter("doc", doc.getUsername());
		query.setParameter("date",  df.parse(df.format(d)));
		query.setParameter("av", "reserved");

		que=(List<DocSchedBean>)query.list();
	
		
		return SUCCESS;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public List<DocSchedBean> getQue() {
		return que;
	}
	public void setQue(List<DocSchedBean> que) {
		this.que = que;
	}
	public Date getD() {
		return d;
	}
	public void setD(Date d) {
		this.d = d;
	}
	

}
