package cc.ccoder.model.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cc.ccoder.model.dao.ICartDao;
import cc.ccoder.model.entity.Cart;
import cc.ccoder.model.entity.User;

/**
 * 购物车dao层接口实现方法
 * @author chencong
 *
 */
@Repository("iCartDao")
@Transactional
public class CartDaoImpl implements ICartDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Cart> getCartsByUserId(User user, Integer pageNum,
			Integer pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Cart where userId = ?");
		query.setParameter(0, user.getId());
		query.setFirstResult(pageNum);
		query.setMaxResults(pageSize);
		return query.list();
	}

}
