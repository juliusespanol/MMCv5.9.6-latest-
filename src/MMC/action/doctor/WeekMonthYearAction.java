package MMC.action.doctor;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
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
import MMC.utility.GetWeekList;

public class WeekMonthYearAction  extends ActionSupport{
	
	String year,month,time,week[],end;
	Map<String, Object> sess = ActionContext.getContext().getSession();
	UsersAccountBean doc=(UsersAccountBean) sess.get("docuser");
	SessionFactory sessionFactory = new Configuration()
			.configure().buildSessionFactory();	   
	Session session = sessionFactory.openSession();
	
	public String execute() throws ParseException{
		Date date = new Date();
		LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		if(Integer.parseInt(month)<localDate.getMonthValue()&&Integer.parseInt(year)==localDate.getYear()||
				Integer.parseInt(year)<localDate.getYear()){
			return ERROR;
		}
		
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		int timestart=Integer.parseInt(time);
		int timeend=Integer.parseInt(end);

	    YearMonth y = YearMonth.parse(year+" "+month,DateTimeFormatter.ofPattern("yyyy MM"));
	    for(int i=0;i<week.length;i++){
	    	List<LocalDate> weekday=getWeek(y,Integer.parseInt(week[i]));
	    	for(int j=0;j<weekday.size();j++)
	    	{
	    		for(int h=timestart;h<timeend;h++){
	    			addDB(h,df.parse(weekday.get(j).toString()));
	    		}
	    		
	    	}
	    }
	
		
		return SUCCESS;
	}
	public List<LocalDate> getWeek(YearMonth y, int week){
		 GetWeekList gl=new GetWeekList();
		   return gl.weeksInCalendar(y, week);
	}
	public void validate(){
		if(week.length==0){
			addFieldError("week", "Pick a day of the week");
		}
		if(Integer.parseInt(time)>=Integer.parseInt(end)){
			addFieldError("time", "Time end must be later than time start");
		}
		
	}
	public void addDB(int time, Date day){
		DocSchedBean dsb = new DocSchedBean();
		
		dsb.setTimeString(checkTime(time));
		dsb.setPatientNum(null);
		dsb.setDocNum(doc.getUsername());

		dsb.setDate(day);
		dsb.setTime(time);
		dsb.setStatus("available");
		
		String hql="FROM DocScheduleTable P WHERE P.docNum= :doc and P.date=:date and P.time=:time";

		Query query=session.createQuery(hql);
		query.setParameter("doc", doc.getUsername());
		query.setParameter("date", day);
		query.setParameter("time", time);
		if(query.list().size()==0){
			String hql2;
			System.out.println("k"+day);

			hql2="FROM DoctorBean P WHERE P.username= :username";
			query=session.createQuery(hql2);
			query.setParameter("username", doc.getUsername());
			DoctorBean d=(DoctorBean)query.uniqueResult();
			dsb.setDocName(d.getFname()+" "+d.getLname());
			session.beginTransaction();
			session.save(dsb);
			session.getTransaction().commit();
		}
	}
	public String checkTime(int time){
		if(time==0){
			return "9:00 AM";
		}
		else if(time==1){
			return "9:30 AM";
		}
		else if(time==2){
			return "10:00 AM";
		}
		else if(time==3){
			return "10:30  AM";
		}
		else if(time==4){
			return "11:00 AM";
		}
		else if(time==5){
			return "11:30  AM";
		}
		else if(time==6){
			return "12:00 PM";
		}
		else if(time==7){
			return "12:30  PM";
		}
		else if(time==8){
			return "1:00 PM";
		}
		else if(time==9){
			return "1:30  PM";
		}
		else if(time==10){
			return "2:00 PM";
		}
		else if(time==11){
			return "2:30  PM";
		}
		else if(time==12){
			return "3:00 PM";
		}
		else if(time==13){
			return "3:30  PM";
		}
		else if(time==14){
			return "4:00 PM";
		}
		else if(time==15){
			return "4:30  PM";
		}
		else if(time==16){
			return "5:00 PM";
		}
		else if(time==17){
			return "5:30  PM";
		}
		return "";

	}

	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

	public String[] getWeek() {
		return week;
	}
	public void setWeek(String[] week) {
		this.week = week;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
}
