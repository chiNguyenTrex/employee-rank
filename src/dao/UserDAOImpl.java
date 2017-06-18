package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entities.User;


@Service
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	

	@Override
	@Transactional
	public List<User> getUserList() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM " + User.class.getName()).getResultList();
	}

	@Override
	@Transactional
	public void save(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	@Transactional
	public void delete(String username) {
		Query query = sessionFactory.getCurrentSession().createQuery("DELETE "+User.class.getName()+" u WHERE u.username =:n");
		query.setParameter("n", username);
		query.executeUpdate();
	}

	@Override
	@Transactional
	public User getUserByUsername(String username) {
		String hql = "FROM " + User.class.getName() + " u WHERE u.username = :u";
		Query<User> query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("u", username);
		return query.uniqueResult();
	}

	@Override
	@Transactional
	public User checkLogin(String username, String password) {
		String hql = "FROM " + User.class.getName() + " u WHERE u.username = :u AND u.password = :p";
		Query<User> query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("u", username);
		query.setParameter("p", password);
		return query.uniqueResult();
	}
}
