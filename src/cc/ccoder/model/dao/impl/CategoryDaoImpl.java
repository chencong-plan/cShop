package cc.ccoder.model.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cc.ccoder.model.dao.ICategoryDao;
import cc.ccoder.model.entity.Category;

@Transactional
@Repository("iCategoryDao")
public class CategoryDaoImpl implements ICategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Category selectById(Integer id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Category category = (Category) session.get(Category.class, id);
			return category;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Category> selectCategoryChildrenByParentId(Integer parentId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from Category where parentId = ? ");
		query.setParameter(0, parentId);
		List<Category> categories = query.list();
		return categories;
	}

	@Override
	public List<Category> selectCategories() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Category");
		List<Category> categories = query.list();
		return categories;
	}

	@Override
	public List<Integer> selectCategoryIdByParentId(Integer parentId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Category where parentId = ?");
		query.setParameter(0, parentId);
		List<Integer> categoryIdLists = query.list();
		return categoryIdLists;
	}

}
