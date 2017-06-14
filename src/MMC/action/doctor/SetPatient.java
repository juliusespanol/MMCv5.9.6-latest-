package MMC.action.doctor;

import java.util.Map;

import javax.management.loading.PrivateClassLoader;

import org.omg.CORBA.PRIVATE_MEMBER;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.login.UsersAccountBean;

public class SetPatient extends ActionSupport {
	private String patient;
	public String execute(){
		Map<String, Object> sess = ActionContext.getContext().getSession();
		sess.put("patient",patient);
		return SUCCESS;
		}
	public String getPatient() {
		return patient;
	}
	public void setPatient(String patient) {
		this.patient = patient;
	}
	
}
