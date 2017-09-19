package cc.ccoder.model.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cc.ccoder.model.dao.IOrderItemDao;
import cc.ccoder.model.entity.OrderItem;

@Transactional
@Repository("iOrderItemDao")
public class OrderItemDaoImpl implements IOrderItemDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addOrderItem(OrderItem orderItem) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(orderItem);
	}
}
