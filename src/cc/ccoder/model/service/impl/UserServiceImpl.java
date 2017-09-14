package cc.ccoder.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.ccoder.model.dao.IUserDao;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.service.IUserService;
import cc.ccoder.utils.MD5Util;

@Service("iUserService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao iUserDao;

	@Override
	public User userLogin(User user) {
		if (user == null) {
			return null;
		}
		return iUserDao.userLogin(user);
	}

	@Override
	public boolean userRegister(User user) {
		return iUserDao.userRegister(user);
	}

	@Override
	public User checkUsername(String username) {
		if (username == null) {
			return null;
		}
		return iUserDao.checkUsername(username);
	}

	@Override
	public User checkUserEmail(String email) {
		if (email == null) {
			return null;
		}
		return iUserDao.checkUserEmail(email);
	}

	@Override
	public User checkUserQuesionAndAnswer(String username, String question,
			String answer) {
		if (username == null || question == null || answer == null) {
			return null;
		}
		return iUserDao.checkUserQuesionAndAnswer(username, question, answer);
	}

	@Override
	public boolean updateUserPassword(String username, String password) {
		if(username == null || password == null){
			return false;
		}
		return iUserDao.updateUserPassword(username,password);
	}

}
