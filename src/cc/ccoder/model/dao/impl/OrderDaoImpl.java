package cc.ccoder.model.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cc.ccoder.model.dao.IOrderDao;
import cc.ccoder.model.entity.Order;

@Transactional
@Repository("iOrderDao")
public class OrderDaoImpl implements IOrderDao{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean insertOrderInfo(Order order) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			session.save(order);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
