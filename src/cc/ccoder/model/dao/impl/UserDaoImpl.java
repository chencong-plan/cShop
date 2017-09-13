package cc.ccoder.model.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cc.ccoder.model.dao.IUserDao;
import cc.ccoder.model.entity.User;

@Transactional
@Repository("iUserDao")
public class UserDaoImpl implements IUserDao {

	@Autowired 
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean userRegister(User user) {

		return false;
	}

	@Override
	public User userLogin(User user) {
		Session session = (Session) this.sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from User where username=? and password = ?");
		query.setParameter(0, user.getUsername());
		query.setParameter(1, user.getPassword());
		List<User> userLists = query.list();
		return userLists.size() > 0 ? userLists.get(0) : null;
	}
	
}
