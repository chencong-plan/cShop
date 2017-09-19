package cc.ccoder.model.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
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

	@Override
	public boolean userRegister(User user) {
		Session session = (Session) this.sessionFactory.getCurrentSession();
		try {
			session.save(user);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
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

	@Override
	public User checkUsername(String username) {
		Session session = (Session) this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where username = ?");
		query.setParameter(0, username);
		List<User> userlList = query.list();
		return userlList.size() > 0 ? userlList.get(0) : null;
	}

	@Override
	public User checkUserEmail(String email) {
		Session session = (Session) this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where email = ?");
		query.setParameter(0, email);
		List<User> userlList = query.list();
		return userlList.size() > 0 ? userlList.get(0) : null;
	}

	@Override
	public User checkUserQuesionAndAnswer(String username, String question,
			String answer) {
		Session session = (Session) this.sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from User where username = ? and question = ? and answer = ? ");
		query.setParameter(0, username);
		query.setParameter(1, question);
		query.setParameter(2, answer);
		List<User> userList = query.list();
		return userList.size() > 0 ? userList.get(0) : null;
	}

	@Override
	public boolean updateUserPassword(String username, String password) {
		Session session = (Session) this.sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("update User set password = ? where username = ?");
		query.setParameter(0, password);
		query.setParameter(1, username);
		int row = query.executeUpdate();
		return row > 0 ? true : false;
	}

	@Override
	public User getUserByEmailUsername(String username, String email) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from User where username = ? and email = ?");
		query.setParameter(0, username);
		query.setParameter(1, email);
		List<User> userList = query.list();
		return userList.size() > 0 ? userList.get(0) : null;
	}

	@Override
	public boolean updateUserStatus(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			session.update(user);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}

}
