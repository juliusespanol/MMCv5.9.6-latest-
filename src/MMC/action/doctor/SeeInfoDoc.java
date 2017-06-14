package MMC.action.doctor;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.doctor.DocSchedBean;
import MMC.model.login.DoctorBean;
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;

public class SeeInfoDoc extends ActionSupport{
	Map<String, Object> sess = ActionContext.getContext().getSession();
	private DoctorBean doc;
	private List<DocSchedBean> ap;
	public String execute(){
		
		
		UsersAccountBean doctor=(UsersAccountBean)sess.get("person");
		Map<String, Object> sess = ActionContext.getContext().getSession();
		
	
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
		Session session = sessionFactory.openSession();
		

		String hql="FROM DoctorBean P WHERE P.username= :username";
		
		
		Query query=session.createQuery(hql);
		query.setParameter("username", doctor.getUsername());

		
		doc =(DoctorBean) query.uniqueResult();
		System.out.println(doc.getLname());
		if(query.uniqueResult() == null){
			System.out.println("doctor does not exist");
			return ERROR;
		}
	return SUCCESS;
	}

	public DoctorBean getDoc() {
		return doc;
	}

	public void setDoc(DoctorBean doc) {
		this.doc = doc;
	}


}
