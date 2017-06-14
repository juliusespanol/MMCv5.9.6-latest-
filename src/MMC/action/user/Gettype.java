package MMC.action.user;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.login.UsersAccountBean;

public class Gettype extends ActionSupport{
	public String execute(){
		Map<String, Object> sess = ActionContext.getContext().getSession();
		UsersAccountBean use=(UsersAccountBean)sess.get("person");
		if(use.getUserType().equals("PATIENT")){
			sess.put("patientuser", use);
			return "patient";
			
		}	else if(use.getUserType().equals("DOCTOR")){
			sess.put("docuser", use);
			return "doctor";
			
		}	else if(use.getUserType().equals("NURSE")){
			sess.put("nurseuser", use);
			return "nurse";
			
		}
		return ERROR;
		}
}
