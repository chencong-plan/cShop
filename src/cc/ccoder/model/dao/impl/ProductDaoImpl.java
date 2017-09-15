package cc.ccoder.model.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cc.ccoder.model.dao.IProductDao;
import cc.ccoder.model.entity.Product;

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
		query.setParameter(0, "%"+keyword+"%");
		query.setFirstResult(pageNum);
		query.setMaxResults(pageSize);
		List<Product> products = query.list();
		return products;
	}

}
