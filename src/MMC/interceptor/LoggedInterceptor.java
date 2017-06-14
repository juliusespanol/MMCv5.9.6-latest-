package MMC.interceptor;

import java.util.Map;
import com.opensymphony.xwork2.Action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoggedInterceptor implements Interceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void init() {
		// TODO Auto-generated method stub
		
	}

	public String intercept(ActionInvocation act) throws Exception {
		Map<String, Object> sess = ActionContext.getContext().getSession();
		

		if(sess.get("person")==null||(Boolean)sess.get("login")==false||sess.isEmpty()||sess==null){
			 return Action.LOGIN;
		}
		return act.invoke();
	}

}
