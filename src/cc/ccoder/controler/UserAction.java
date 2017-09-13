package cc.ccoder.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cc.ccoder.model.entity.User;
import cc.ccoder.model.service.IUserService;
import cc.ccoder.utils.DateUtils;
import cc.ccoder.utils.MD5Util;
import cc.ccoder.utils.MailUtil;
import cc.ccoder.utils.UUIDUtils;

@Controller("userAction")
public class UserAction {

	@Autowired
	private IUserService iUserService;

	private User user;
	private String msg;

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	public String userLogin() {
		// 将输入的密码进行加密
		user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
		User resultUser = iUserService.userLogin(user);
		if (resultUser == null) {
			msg = "login_fail";
		} else {
			if(resultUser.getStatus() == 0){
				msg = "login_success";
			}else{
				msg = "login_fail_noActive";
			}
		}
		return "success";
	}

	/**
	 * 管理员登录
	 * 
	 * @return
	 */
	public String adminLogin() {
		// 密码加密
		user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
		User adminUser = iUserService.userLogin(user);
		if (adminUser == null || 1 == adminUser.getRole()) {
			return "admin_login_fail";
		}
		// TODO
		// 将管理员放入session
		return "admin_login_success";

	}

	/**
	 * 注册时候检查用户名是否存在
	 * 
	 * @return
	 */
	public String checkUsername() {
		User resuUser = iUserService.checkUsername(user.getUsername());
		if (resuUser == null) {
			msg = "username_no_exists";
		} else {
			msg = "username_is_exists";
		}
		return "success";
	}

	/**
	 * 注册时候检查用邮箱是否存在
	 * 
	 * @return
	 */
	public String checkUserEmail() {
		User resUser = iUserService.checkUserEmail(user.getEmail());
		if (resUser == null) {
			msg = "email_no_exists";
		} else {
			msg = "email_is_exists";
		}
		return "success";
	}

	public String register() {
		user.setRole(1); // 设置角色为普通用户
		user.setStatus(1); // 设置状态为未激活
		// 设置密码加密
		user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
		user.setActiveKey(UUIDUtils.getUUID()); // 设置激活码
		user.setCreateTime(DateUtils.getCurrentTime());
		System.out.println(user);
		if (iUserService.userRegister(user)) {
			// 注册成功，发送邮件
			new MailUtil(user.getEmail(), user.getUsername(),
					user.getActiveKey()).run();
			msg = "register_success";
		} else {
			msg = "register_fail";
		}
		return "success";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
