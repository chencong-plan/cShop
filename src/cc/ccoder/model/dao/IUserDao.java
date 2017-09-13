package cc.ccoder.model.dao;


import cc.ccoder.model.entity.User;


public interface IUserDao {

	User userLogin(User user);

	boolean userRegister(User user);

}
