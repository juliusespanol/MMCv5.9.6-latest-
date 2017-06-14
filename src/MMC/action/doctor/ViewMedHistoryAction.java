package MMC.action.doctor;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.jasypt.util.text.StrongTextEncryptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import MMC.model.doctor.MedHistBean;
import MMC.model.login.PatientRegisterBean;
import MMC.model.login.UsersAccountBean;

public class ViewMedHistoryAction  extends ActionSupport{
	Map<String, Object> sess = ActionContext.getContext().getSession();
	private int i;
	private List<MedHistBean> list;
	private String patient;
	public String execute(){


		Map<String, Object> sess = ActionContext.getContext().getSession();
		//sess.put("patient",patient);
		patient=(String)sess.get("patient");
		SessionFactory sessionFactory = new Configuration()
				.configure().buildSessionFactory();

		Session session = sessionFactory.openSession();





		String hql="";
		Query query;
		System.out.println("hello");
		//hql="FROM MedHistBean M WHERE M.physician= :doc AND M.patient= :patient  order by M.dtime desc";
		if(i<=0){
			hql="FROM MedHistBean M WHERE M.patient= :patient  order by M.dtime desc";
			query=session.createQuery(hql);
			query.setParameter("patient", patient);
		}else{
			hql="FROM MedHistBean M WHERE M.histID= :i  order by M.dtime desc";
			query=session.createQuery(hql);
			query.setParameter("i", i);
		}
		StrongTextEncryptor textEncryptor = new StrongTextEncryptor();
		textEncryptor.setPassword("l1o2o3p4l5a6b");

		//query.setParameter("doc", doctor.getUsername());


		list = (List<MedHistBean>) query.list();
		if(list == null){
			System.out.println("uts null");
		}


		for(int i=0;i<list.size();i++){
			list.get(i).setCondi(textEncryptor.decrypt(list.get(i).getCondi()));
			list.get(i).setHospital(textEncryptor.decrypt(list.get(i).getHospital()));
			list.get(i).setAllergies(textEncryptor.decrypt((list.get(i).getAllergies())));
			list.get(i).setDoc(textEncryptor.decrypt((list.get(i).getDoc())));
			//list.get(i).setDate(textEncryptor.decrypt((list.get(i).getDate())));

			list.get(i).setBp(textEncryptor.decrypt((list.get(i).getBp())));
			list.get(i).setHt(textEncryptor.decrypt((list.get(i).getHt())));
			list.get(i).setHr(textEncryptor.decrypt((list.get(i).getHr())));
			list.get(i).setWt(textEncryptor.decrypt((list.get(i).getWt())));
			list.get(i).setRr(textEncryptor.decrypt((list.get(i).getRr())));
			list.get(i).setBmi(textEncryptor.decrypt((list.get(i).getBmi())));

			list.get(i).setPrevhosp(textEncryptor.decrypt((list.get(i).getPrevhosp())));
			list.get(i).setPrevop(textEncryptor.decrypt((list.get(i).getPrevop())));
			System.out.println(list.get(i).getCondi());
			//System.out.println(textEncryptor.decrypt(list.get(i).getCondi()))
		}





		return SUCCESS;
	}
	public int getI() {
		return i;
	}
	public void setI(int i) {
		this.i = i;
	}
	public List<MedHistBean> getList() {
		return list;
	}
	public void setList(List<MedHistBean> list) {
		this.list = list;
	}

}
