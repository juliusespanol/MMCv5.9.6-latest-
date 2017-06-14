package MMC.action.login;

import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.login.UsersAccountBean;

public class EmailAction extends ActionSupport{
	private String from;
	private String password;
	private String to;
	private String subject;
	private String body;
	
	 static Properties properties = new Properties();
	   static
	   {
	      properties.put("mail.smtp.host", "smtp.gmail.com");
	      properties.put("mail.smtp.socketFactory.port", "465");
	      properties.put("mail.smtp.socketFactory.class",
	                     "javax.net.ssl.SSLSocketFactory");
	      properties.put("mail.smtp.auth", "true");
	      properties.put("mail.smtp.port", "465");
	   }
	   
	   
	public String execute(){
		String ret = SUCCESS;
		try{
			setFrom("maginhawamedicalclinic@gmail.com");
			setPassword("2017@mmc");
			Session session = 
					Session.getDefaultInstance(properties,
					new javax.mail.Authenticator(){
					protected PasswordAuthentication
					getPasswordAuthentication(){
					return new PasswordAuthentication(getFrom(),
							getPassword()); 
				
					}});
			setSubject("Maginhawa Medical Clinic Registration Verification Code");
			setBody("Your code is: ");
			Message message = new MimeMessage(session);
			
			Map<String, Object> sessi = ActionContext.getContext().getSession();
			UsersAccountBean acc=(UsersAccountBean) sessi.get("Account");
			to=acc.getUsername();
			message.setFrom(new InternetAddress("maginhawamedicalclinic@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, 
					InternetAddress.parse(to));
			message.setSubject(getSubject());
			message.setText(getBody() + acc.getVercode());
			Transport.send(message);
		}catch(Exception e){
			ret = SUCCESS;
			//e.printStackTrace();
		}
		return ret;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	 

	public static void setProperties(Properties properties){
		EmailAction.properties = properties;
	} 
}
