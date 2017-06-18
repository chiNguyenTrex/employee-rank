package dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entities.Depart;

@Service
public class DepartDAOImpl implements DepartDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Depart> getDepartList() {
		return sessionFactory.getCurrentSession().createQuery("FROM "+Depart.class.getName()).getResultList();
	}

	@Override
	@Transactional
	public void addDepart(Depart depart) {
		sessionFactory.getCurrentSession().save(depart);
	}

	@Override
	@Transactional
	public void deleteDepart(String id) {
		Query query = sessionFactory.getCurrentSession().createQuery("DELETE "+Depart.class.getName()+" d WHERE d.departId = :id");
		query.setParameter("id", id);
		query.executeUpdate();
	}

	@Override
	@Transactional
	public void updateDepart(Depart depart) {
		sessionFactory.getCurrentSession().update(depart);
	}

	@Override
	@Transactional
	public Depart getDepartById(String id) {
		String hql = "FROM " + Depart.class.getName() + " d WHERE d.departId = :id";
		Query<Depart> query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		return query.uniqueResult();
	}

}
