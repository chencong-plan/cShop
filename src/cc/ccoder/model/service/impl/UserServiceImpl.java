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
		return false;
	}

}
