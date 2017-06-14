package MMC.action.patient;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Date;




import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.doctor.DocSchedBean;
import MMC.model.doctor.WeeklyDateBean;





public class ProcessDateAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	//private List<DocSchedBean>[] weeksched = (ArrayList<DocSchedBean>[]) new ArrayList[7];
	public WeeklyDateBean wd = new WeeklyDateBean();

	DocSchedBean[][] schedContent = new DocSchedBean[18][7];
	private String dateNow;

	private String DocNum;
	private Date converted;
	private DocSchedBean dsb = new DocSchedBean();
	private String docSched;


	private String patientNum; //pk from patient table
	private Date date;
	private int time;
	private String status;

	//Map<String, Object> sess = ActionContext.getContext().getSession();
	List<DocSchedBean> plist;



	public String execute() throws ParseException{
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
	
		
	    try {
	    	today=df.parse(df.format(today));

			if(df.parse(wd.getDateNow()).before(today)&&!df.parse(wd.getDateNow()).equals(today)){
				return ERROR;
			}
	    
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//if(dsb.getDocSched()==(0)){
			


			converted = df.parse(wd.getDateNow());
	
			//		wd.setDateNow(dateNow);
			//		wd.setDocNum(DocNum);


			//		SessionFactory sessionFactory = new Configuration()
			//				.configure().buildSessionFactory();	   
			//			Session session = sessionFactory.openSession();
			//
			//			session.beginTransaction();
			//			session.save(wd);
			//			session.getTransaction().commit();


			//		if (wd.getDateNow().equals(null)) wd.setDateNow(new Date());
			processDates(converted.getDay(), converted);
			System.out.println(getDocNum());
			//wd.getDateNow().getDay(),wd.getDateNow());
			retrieveSched();
			return SUCCESS;
		/*}else {
			try{

				SessionFactory sessionFactory = new Configuration()
						.configure().buildSessionFactory();	   
				Session session = sessionFactory.openSession();

				session.beginTransaction();
				dsb.setStatus("request");
				//dsb.setDocSched(dsb.getDocSched()+dsb.getDate());
				session.save(dsb);
				session.getTransaction().commit();

				return SUCCESS;
			}

			catch(Exception e){
				System.out.println(e.toString());		
			}
		}	return SUCCESS;*/
	}


	@SuppressWarnings({ "null", "unchecked" })
	public void retrieveSched(){
		String ret = "";
		Map<String, Object> sess = ActionContext.getContext().getSession();

		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();

		Session session = sessionFactory.openSession();

		String hql="FROM DocScheduleTable WHERE docNum = :doc_num AND"
				+ " date between :start_date and :end_date "

			+ "order by time";

		Query query = session.createQuery(hql);


		query.setParameter("doc_num",wd.getDocNum()).setParameter("start_date",wd.getSun())
		.setParameter("end_date",wd.getSat());

		System.out.println(wd.getDocNum());
		System.out.println(wd.getSun());
		System.out.println(wd.getSat());
		plist =query.list();
		List<DocSchedBean>[] dum = (ArrayList<DocSchedBean>[]) new ArrayList[7];



		for(DocSchedBean ds: plist){
			schedContent[ds.getTime()][ds.getDate().getDay()]
					= ds;
			System.out.println(ds.getStatus());
		}
		//		for(int x=0; x<=17;x++){
		//		     for(int y=0; y<=6; y++){
		//		    	 if(schedContent.equals(null)){
		//		           schedContent[x][y].set
		//		    	 }
		//		     }
		//		}


		//	wd.setWeeksched(dum);
	}

	private void processDates(int daySpecified, Date dateNow){
		Date dumDate = dateNow;
		for(int dec = daySpecified; dec >= 0; dec--){
			switch(dec){
			case 0: //sunday
				//wd.setSun(new Date(dateNow.getTime()+(inc*24*60*60*1000)));
				wd.setSun(dumDate);
				break;
			case 1: //monday
				wd.setMon(dumDate);
				break;
			case 2: //tuesday
				wd.setTue(dumDate);
				break;
			case 3: //wednesday
				wd.setWed(dumDate);
				break;
			case 4: //thursday
				wd.setThu(dumDate);
				break;
			case 5: //friday
				wd.setFri(dumDate);
				break;
			case 6: //saturday
				wd.setSat(dumDate);
				break;
			}	
			dumDate=new Date(dumDate.getTime()-(24*60*60*1000));

		}
		dumDate = new Date(dateNow.getTime()+(24*60*60*1000));

		for(int dec = daySpecified+1; dec <= 6; dec++){
			switch(dec){
			case 0: //sunday
				//wd.setSun(new Date(dateNow.getTime()+(inc*24*60*60*1000)));
				wd.setSun(dumDate);
				break;
			case 1: //monday
				wd.setMon(dumDate);
				break;
			case 2: //tuesday
				wd.setTue(dumDate);

				break;
			case 3: //wednesday
				wd.setWed(dumDate);
				break;
			case 4: //thursday
				wd.setThu(dumDate);
				break;
			case 5: //friday
				wd.setFri(dumDate);
				break;
			case 6: //saturday
				wd.setSat(dumDate);

				break;
			}
			dumDate=new Date(dumDate.getTime()+(24*60*60*1000));
		}
		//	System.out.println(sun.toString());
		//	System.out.println(mon.toString());
		//	System.out.println(tue.toString());
		//	System.out.println(wed.toString());
		//	System.out.println(thu.toString());
		//	System.out.println(fri.toString());
		//	System.out.println(sat.toString());
	}



	public WeeklyDateBean getWd() {
		return wd;
	}

	public void setWd(WeeklyDateBean wd) {
		this.wd = wd;
	}

	public DocSchedBean[][] getSchedContent() {
		return schedContent;
	}

	public void setSchedContent(DocSchedBean[][] schedContent) {
		this.schedContent = schedContent;
	}

	public String getDateNow() {
		return dateNow;
	}

	public void setDateNow(String dateNow) {
		this.dateNow = dateNow;
	}

	public String getDocNum() {
		return DocNum;
	}

	public void setDocNum(String docNum) {
		DocNum = docNum;
		dsb.setDocNum(docNum);
	}

	public Date getConverted() {
		return converted;
	}

	public void setConverted(Date converted) {
		this.converted = converted;
	}

	public DocSchedBean getDsb() {
		return dsb;
	}

	public void setDsb(DocSchedBean dsb) {
		this.dsb = dsb;
	}

	public String getDocSched() {
		return docSched;
	}

	public void setDocSched(String docSched) {
		this.docSched = docSched;
		dsb.setDocSched(Integer.parseInt(docSched));
	}

	public String getPatientNum() {
		return patientNum;
	}

	public void setPatientNum(String patientNum) {
		this.patientNum = patientNum;
		dsb.setPatientNum(patientNum);

	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
		dsb.setDate(date);
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
		dsb.setTime(time);
	}



	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
		dsb.setStatus(status);
	}


}
