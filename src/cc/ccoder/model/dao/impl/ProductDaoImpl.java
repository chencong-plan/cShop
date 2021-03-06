package cc.ccoder.model.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cc.ccoder.model.dao.IProductDao;
import cc.ccoder.model.entity.Cart;
import cc.ccoder.model.entity.Product;
import cc.ccoder.model.entity.User;

@Transactional
@Repository("iProductDao")
public class ProductDaoImpl implements IProductDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Product> getProductsByCategoryId(Integer categoryId,
			Integer pageNum, Integer pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Product where categoryId = ?");
		query.setParameter(0, categoryId);
		query.setFirstResult(pageNum);
		query.setMaxResults(pageSize);
		List<Product> products = query.list();
		return products;
	}

	@Override
	public List<Product> getProductsByKeyword(String keyword, Integer pageNum,
			Integer pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Product where name like ?");
		query.setParameter(0, "%" + keyword + "%");
		query.setFirstResult(pageNum);
		query.setMaxResults(pageSize);
		List<Product> products = query.list();
		return products;
	}

	@Override
	public Product getProductById(Integer productId) {
		Session session = this.sessionFactory.getCurrentSession();
		Product product = (Product) session.get(Product.class, productId);
		return product;
	}

	@Override
	public boolean addCart(Cart cart) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			session.saveOrUpdate(cart);
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Cart getCartById(Integer userId, Integer productId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from Cart where userId = ? and productId = ?");
		query.setParameter(0, userId);
		query.setParameter(1, productId);
		List<Cart> carts = query.list();
		return carts.size() > 0 ? carts.get(0) : null;
	}

}
