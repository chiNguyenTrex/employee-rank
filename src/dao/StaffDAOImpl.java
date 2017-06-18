package dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entities.Staff;

@Service
public class StaffDAOImpl implements StaffDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Staff> getStaffList() {
		return sessionFactory.getCurrentSession().createQuery("FROM "+Staff.class.getName()).getResultList();
	}
	
	@Override
	@Transactional
	public void save(Staff staff) {
		sessionFactory.getCurrentSession().save(staff);
	}

	@Override
	@Transactional
	public void update(Staff staff) {
		sessionFactory.getCurrentSession().update(staff);
	}

	@Override
	@Transactional
	public void deleteStaff(String id) {
		String sql = "DELETE " + Staff.class.getName() + " s WHERE s.staffId=:id";
		Query q = sessionFactory.getCurrentSession().createQuery(sql);
		q.setParameter("id", id);
		q.executeUpdate();
	}

	@Override
	@Transactional
	public Staff getStaffById(String id) {
		String sql = "FROM " + Staff.class.getName() + " s WHERE s.staffId=:id";
		Query<Staff> q = sessionFactory.getCurrentSession().createQuery(sql);
		q.setParameter("id", id);
		return q.uniqueResult();
	}
}
