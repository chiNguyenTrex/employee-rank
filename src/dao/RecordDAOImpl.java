package dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entities.Record;

@Service
public class RecordDAOImpl implements RecordDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Record> getRecordList() {
		return sessionFactory.getCurrentSession().createQuery("FROM " + Record.class.getName()).getResultList();
	}

	@Override
	@Transactional
	public List<Record> getRecordByStaff(String id) {
		String hql = "FROM " + Record.class.getName() + " r WHERE r.staff.staffId = :staffid";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("staffid", id);
		return query.getResultList();
	}

	@Override
	@Transactional
	public void addRecord(Record record) {
		sessionFactory.getCurrentSession().save(record);
	}

	@Override
	@Transactional
	public void deleteRecord(String id) {
		// TODO Auto-generated method stub

	}

}
