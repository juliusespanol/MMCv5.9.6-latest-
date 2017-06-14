package MMC.action.login;


import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;
import MMC.model.login.VerCodeBean;

@SuppressWarnings("serial")
public class VerifyAction2 extends ActionSupport
		implements ModelDriven<VerCodeBean>{
	   Map<String, Object> s= ActionContext.getContext().getSession();
	   UsersAccountBean use=(UsersAccountBean)s.get("Account");
	private VerCodeBean vcb = new VerCodeBean();
	
	public String execute(){

		return SUCCESS;
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
