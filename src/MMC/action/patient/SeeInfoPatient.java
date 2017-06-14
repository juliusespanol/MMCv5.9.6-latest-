package MMC.action.patient;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.jasypt.util.text.StrongTextEncryptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.doctor.DocSchedBean;
import MMC.model.doctor.MedHistBean;
import MMC.model.login.DoctorBean;
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;

public class SeeInfoPatient extends ActionSupport{
	Map<String, Object> sess = ActionContext.getContext().getSession();
	private PatientRegisterBean p;
	private List<DocSchedBean> ap;
	private List<MedHistBean> list;
	public String execute(){
		
		
		UsersAccountBean user=(UsersAccountBean)sess.get("patientuser");
		Map<String, Object> sess = ActionContext.getContext().getSession();
		
	
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();
				
		Session session = sessionFactory.openSession();
		

		String hql="FROM PatientRecord P WHERE P.username= :username";
		
		
		Query query=session.createQuery(hql);
		query.setParameter("username", user.getUsername());

		
		
		p =(PatientRegisterBean) query.uniqueResult();
		System.out.println(p.getLname());
		if(query.uniqueResult() == null){
			System.out.println("patient does not exist");
			return ERROR;
		}
		hql="FROM MedHistBean P WHERE P.patient= :username";
		
		
		query=session.createQuery(hql);
		query.setParameter("username", user.getUsername());
		
		list = (List<MedHistBean>) query.list();
		if(list == null){
			System.out.println("uts null");
		}
		StrongTextEncryptor textEncryptor = new StrongTextEncryptor();
		textEncryptor.setPassword("l1o2o3p4l5a6b");
		for(int i=0;i<list.size();i++){
			list.get(i).setCondi(textEncryptor.decrypt(list.get(i).getCondi()));
			list.get(i).setHospital(textEncryptor.decrypt(list.get(i).getHospital()));
			list.get(i).setAllergies(textEncryptor.decrypt((list.get(i).getAllergies())));
			list.get(i).setDoc(textEncryptor.decrypt((list.get(i).getDoc())));
			//list.get(i).setDate(textEncryptor.decrypt((list.get(i).getDate())));
			System.out.println(list.get(i).getCondi());
			//System.out.println(textEncryptor.decrypt(list.get(i).getCondi()))
		}
		 query=session.createQuery("FROM DocScheduleTable P WHERE P.patientNum= :username   order by P.date,P.time");
		 query.setParameter("username", user.getUsername());
		 ap=(List<DocSchedBean>)query.list();
	
	return SUCCESS;
	}

	public PatientRegisterBean getP() {
		return p;
	}

	public void setP(PatientRegisterBean p) {
		this.p = p;
	}

	public List<MedHistBean> getList() {
		return list;
	}

	public void setList(List<MedHistBean> list) {
		this.list = list;
	}
	public List<DocSchedBean> getAp() {
		return ap;
	}

	public void setAp(List<DocSchedBean> ap) {
		this.ap = ap;
	}



}
