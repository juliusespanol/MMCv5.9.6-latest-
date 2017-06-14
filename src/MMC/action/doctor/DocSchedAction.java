package MMC.action.doctor;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.hibernate.Query;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.doctor.DocSchedBean;
import MMC.model.login.DoctorBean;
import MMC.model.login.UsersAccountBean;


public class DocSchedAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private DocSchedBean dsb = new DocSchedBean();
	private String login;	
	private String docSched;
	private UsersAccountBean U;
	private String docNum; //pk from doc table
	private String patientNum; //pk from patient table
	private String date;
	private String time;
	private int convTime;
	private Date converted;
	private String dateNow;
	private int convDocSched;
	private String ret;
	public String getDateNow() {
		return dateNow;
	}


	public void setDateNow(String dateNow) {
		this.dateNow = dateNow;
	}


	public String execute() throws ParseException{
	
		System.out.println("dateeee"+dateNow);
		Map<String, Object> sess = ActionContext.getContext().getSession();
		UsersAccountBean doc=(UsersAccountBean) sess.get("docuser");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat df2 = new SimpleDateFormat("MM/dd/yy");
		Date today = new Date();

		try{
			converted = df.parse(dateNow);
			ret="success";
			}catch(Exception e){
			converted = df2.parse(dateNow);
			ret="success2";
			}
		try {
			today=df.parse(df.format(today));

			if(converted.before(today)&&!converted.equals(today)){
				return ERROR;
			}

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//if(login=="true"){
		System.out.println(getTime());
		convTime = Integer.parseInt(getTime());

	
		//convDocSched= Integer.parseInt(docSched);


		//dsb.setDocSched(convDocSched);
		dsb.setDocNum(doc.getUsername());

		dsb.setPatientNum(patientNum);
		dsb.setDate(converted);
		checkTime();
		dsb.setTime(convTime);
		dsb.setStatus("available");
		
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();	   
		Session session = sessionFactory.openSession();
		String hql="FROM DocScheduleTable P WHERE P.docNum= :doc and P.date=:date and P.time=:time";
		Query query=session.createQuery(hql);
		query.setParameter("doc", doc.getUsername());
		query.setParameter("date", converted);
		query.setParameter("time", Integer.parseInt(time));
		if(query.list().size()==0){
			hql="FROM DoctorBean P WHERE P.username= :username";
			query=session.createQuery(hql);
			query.setParameter("username", doc.getUsername());
			DoctorBean d=(DoctorBean)query.uniqueResult();
			dsb.setDocName(d.getFname()+" "+d.getLname());
			session.beginTransaction();
			session.save(dsb);
			session.getTransaction().commit();
			return ret;
		}
		else 
			return ERROR;


		
		//		}
		//		else{
		//			return LOGIN;
		//		}
	}
	
	public void checkTime(){
		if(time.equals("0")){
			dsb.setTimeString("9:00 AM");
		}
		else if(time.equals("1")){
			dsb.setTimeString("9:30 AM");
		}
		else if(time.equals("2")){
			dsb.setTimeString("10:00 AM");
		}
		else if(time.equals("3")){
			dsb.setTimeString("10:30  AM");
		}
		else if(time.equals("4")){
			dsb.setTimeString("11:00 AM");
		}
		else if(time.equals("5")){
			dsb.setTimeString("11:30  AM");
		}
		else if(time.equals("6")){
			dsb.setTimeString("12:00 PM");
		}
		else if(time.equals("7")){
			dsb.setTimeString("12:30  PM");
		}
		else if(time.equals("8")){
			dsb.setTimeString("1:00 PM");
		}
		else if(time.equals("9")){
			dsb.setTimeString("1:30  PM");
		}
		else if(time.equals("10")){
			dsb.setTimeString("2:00 PM");
		}
		else if(time.equals("11")){
			dsb.setTimeString("2:30  PM");
		}
		else if(time.equals("12")){
			dsb.setTimeString("3:00 PM");
		}
		else if(time.equals("13")){
			dsb.setTimeString("3:30  PM");
		}
		else if(time.equals("14")){
			dsb.setTimeString("4:00 PM");
		}
		else if(time.equals("15")){
			dsb.setTimeString("4:30  PM");
		}
		else if(time.equals("16")){
			dsb.setTimeString("5:00 PM");
		}
		else if(time.equals("17")){
			dsb.setTimeString("5:30  PM");
		}

	}



	public String getDocSched() {
		return docSched;
	}


	public void setDocSched(String docSched) {
		this.docSched = docSched;
	}


	public String getDocNum() {
		return docNum;
	}


	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}


	public String getPatientNum() {
		return patientNum;
	}


	public DocSchedBean getDsb() {
		return dsb;
	}


	public void setDsb(DocSchedBean dsb) {
		this.dsb = dsb;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public void setPatientNum(String patientNum) {
		this.patientNum = patientNum;
	}


	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}


	public UsersAccountBean getU() {
		return U;
	}


	public void setU(UsersAccountBean u) {
		U = u;
	}


	public String getLogin() {
		return login;
	}


	public void setLogin(String login) {
		this.login = login;
	}



}
