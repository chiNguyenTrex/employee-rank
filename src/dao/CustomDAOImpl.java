package dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CustomDAOImpl implements CustomDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Object[]> getCustomRecordList() {
		String sql = "Select s.staffId ,s.name, SUM(CASE WHEN r.type = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN r.type = 0 THEN 1 ELSE 0 END) FROM Record r inner join r.staff s GROUP BY s.staffId)";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Object[]> getCustomRecordSort() {
		String sql = "Select s.staffId, d.name ,s.name, SUM(CASE WHEN r.type = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN r.type = 0 THEN 1 ELSE 0 END), s.photo FROM "
				+ "Record r inner join r.staff s inner join s.depart d GROUP BY s.staffId ORDER BY (SUM(CASE WHEN r.type = 1 THEN 1 ELSE 0 END) - SUM(CASE WHEN r.type = 0 THEN 1 ELSE 0 END)) desc )";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setFirstResult(0);
		query.setMaxResults(10);
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Object[]> getCustomRecordByDepart() {
		String sql = "Select d.name, SUM(CASE WHEN r.type = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN r.type = 0 THEN 1 ELSE 0 END) FROM "
				+ "Record r inner join r.staff s inner join s.depart d GROUP BY d.name ORDER BY (SUM(CASE WHEN r.type = 1 THEN 1 ELSE 0 END) - SUM(CASE WHEN r.type = 0 THEN 1 ELSE 0 END)) desc )";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.getResultList();
	}

}
