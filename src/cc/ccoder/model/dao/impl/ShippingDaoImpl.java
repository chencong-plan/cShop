package cc.ccoder.model.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cc.ccoder.model.dao.IShippingDao;
import cc.ccoder.model.entity.Shipping;
import cc.ccoder.model.entity.User;

/**
 * 地址实体 添加地址dao层方法
 * 
 * @author chencong
 *
 */
@Transactional
@Repository("iShippingDao")
public class ShippingDaoImpl implements IShippingDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean addShipping(Shipping shipping) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(shipping);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Shipping> getShippingByUserId(Integer userId, Integer pageNum,
			Integer pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Shipping where userId = ?");
		query.setParameter(0, userId);
		query.setFirstResult(pageNum);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public boolean deleteShippingById(Integer shippingId, Integer userId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete from Shipping where userId = ? and id = ?");
		query.setParameter(0, userId);
		query.setParameter(1, shippingId);
		int row = query.executeUpdate();
		if (row == 1) {
			return true;
		}
		return false;
	}

	@Override
	public Shipping getShippingById(Integer shippingId) {
		Session session = this.sessionFactory.getCurrentSession();
		Shipping shipping = (Shipping) session.get(Shipping.class, shippingId);
		return shipping;
	}
}
