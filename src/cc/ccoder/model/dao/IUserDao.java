package cc.ccoder.model.dao;


import cc.ccoder.model.entity.User;


public interface IUserDao {

	User userLogin(User user);

	boolean userRegister(User user);
	
	User checkUsername(String username);
	
	User checkUserEmail(String email);
	
	User checkUserQuesionAndAnswer(String username,String question,String answer);

	boolean updateUserPassword(String username, String password);

	User getUserByEmailUsername(String username, String email);

	boolean updateUserStatus(User user);

}
