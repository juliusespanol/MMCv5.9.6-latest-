package MMC.action.login;


import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import MMC.model.login.DoctorBean;
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;
import MMC.model.login.VerCodeBean;

@SuppressWarnings("serial")
public class VerifyAction extends ActionSupport
		implements ModelDriven<VerCodeBean>{
	   Map<String, Object> s= ActionContext.getContext().getSession();
	   UsersAccountBean use=(UsersAccountBean)s.get("Account");
	private VerCodeBean vcb = new VerCodeBean();
	
	public String execute(){
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();	   
			Session session = sessionFactory.openSession();
		if(use.getUserType().equals("PATIENT")){
			PatientRegisterBean prb=(PatientRegisterBean)s.get("patient");

			session.beginTransaction();
			session.save(prb);
			session.save(use);
			session.getTransaction().commit();
			

		return SUCCESS;
		}
		else if(use.getUserType().equals("DOCTOR")||use.getUserType().equals("NURSE")){
			DoctorBean d =(DoctorBean)s.get("doctor");
			session.beginTransaction();
			session.save(d);
			session.save(use);
			session.getTransaction().commit();
			return SUCCESS;
			
		}		
		else
		
		return ERROR;
	}
	public void validate(){
		if(!vcb.getEnterVerCode().equals(use.getVercode())){
			addFieldError("enterVerCode", "Wrong Code");
		}
	//	System.out.println("this:"+use.getVercode()+vcb.getEnterVerCode());
		
	}

	public VerCodeBean getVcb() {
		return vcb;
	}

	public void setVcb(VerCodeBean vcb) {
		this.vcb = vcb;
	}



	public VerCodeBean getModel(){
		return vcb;
	}
	
}
