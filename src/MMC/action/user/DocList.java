package MMC.action.user;

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

public class DocList extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Map<String, Object> sess = ActionContext.getContext().getSession();
	List<DoctorBean> dlist;

	public String execute(){
		
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
		Session session = sessionFactory.openSession();
		
		String hql="FROM DoctorBean";
		
		
		Query query=session.createQuery(hql);

		

		dlist =query.list();
		if(dlist == null){
			System.out.println("no doctors");
			return ERROR;
		}else{
			return SUCCESS;
		}
			
			

		 
		 
	}

	public List<DoctorBean> getDlist() {
		return dlist;
	}

	public void setDlist(List<DoctorBean> dlist) {
		this.dlist = dlist;
	}



	

	
}
