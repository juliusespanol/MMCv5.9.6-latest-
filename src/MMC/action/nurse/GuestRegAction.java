package MMC.action.nurse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import MMC.model.login.GuestList;
import MMC.model.login.PatientRegisterBean;

public class GuestRegAction extends ActionSupport implements ModelDriven<PatientRegisterBean>{
PatientRegisterBean pb=new PatientRegisterBean();

	public String execute(){
		GuestList g=new GuestList();
		g.setName(pb.getLname()+","+pb.getFname());
		System.out.println("lalala"+g.getId());
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();	   
			Session session = sessionFactory.openSession();


			String hql="FROM GuestList P WHERE P.id= :id";
			
			
			Query query = session.createQuery("from GuestList order by id DESC");
			query.setMaxResults(1);
			if(query.uniqueResult()==null){
				pb.setUsername("guest"+1);
			}else{
				int num=((GuestList)query.uniqueResult()).getId();
				pb.setUsername("guest"+(num+1));
			}

			session.beginTransaction();
			session.save(g);
			session.save(pb);

			session.getTransaction().commit();

		return SUCCESS;
	}

	public PatientRegisterBean getPb() {
		return pb;
	}

	public void setPb(PatientRegisterBean pb) {
		this.pb = pb;
	}

	public PatientRegisterBean getModel() {
		// TODO Auto-generated method stub
		return pb;
	}
}
