package MMC.action.doctor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.action.login.PatientRegisterAction;
import MMC.model.login.DoctorBean;
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;

public class ViewDoctorList extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	List<DoctorBean> dlist;

	List<DoctorBean> nlist;
	public String execute(){
		
		
		
		
		Map<String, Object> sess = ActionContext.getContext().getSession();
		
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
		Session session = sessionFactory.openSession();
		
		String hql="FROM DoctorBean where specialization<>:doctor";
		
		Query query=session.createQuery(hql);
		query.setParameter("doctor", "ADMIN");
		dlist =query.list();
		
		
		hql="FROM DoctorBean where specialization=:nurse";
		query=session.createQuery(hql);
		query.setParameter("nurse", "ADMIN");

		nlist =query.list();
		if(dlist == null){
			System.out.println("no doctors in database");
			return ERROR;
		}else{
			System.out.println(dlist.get(0).getUsername());
			return SUCCESS;
		}
			
			

		 
		 
	}

	public List<DoctorBean> getDlist() {
		return dlist;
	}

	public void setDlist(List<DoctorBean> dlist) {
		this.dlist = dlist;
	}
	
	public List<DoctorBean> getNlist() {
		return nlist;
	}

	public void setNlist(List<DoctorBean> nlist) {
		this.nlist = nlist;
	}
	
	

	
}
