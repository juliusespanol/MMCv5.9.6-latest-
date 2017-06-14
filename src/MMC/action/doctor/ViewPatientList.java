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

public class ViewPatientList extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Map<String, Object> sess = ActionContext.getContext().getSession();
	List<PatientRegisterBean> plist;

	public String execute(){
		
		
		
		
		Map<String, Object> sess = ActionContext.getContext().getSession();
		
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
		Session session = sessionFactory.openSession();
		
		String hql="FROM PatientRecord";
		
		
		Query query=session.createQuery(hql);

		

		plist =query.list();
		if(plist == null){
			System.out.println("no patients in database");
			return ERROR;
		}else{
			System.out.println(plist.get(0).getUsername());
			return SUCCESS;
		}
			
			

		 
		 
	}

	public List<PatientRegisterBean> getPlist() {
		return plist;
	}

	public void setPlist(List<PatientRegisterBean> plist) {
		this.plist = plist;
	}
	
	

	
}
