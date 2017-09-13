package cc.ccoder.model.service;


import cc.ccoder.model.entity.User;

public interface IUserService {

	User userLogin(User user);

	boolean userRegister(User user);

}
