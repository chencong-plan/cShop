package cc.ccoder.controler;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cc.ccoder.common.Const;
import cc.ccoder.common.ResponseCode;
import cc.ccoder.common.ServerResponse;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.service.IUserService;
import cc.ccoder.utils.DateUtils;
import cc.ccoder.utils.MD5Util;
import cc.ccoder.utils.MailUtil;
import cc.ccoder.utils.UUIDUtils;

import com.alibaba.fastjson.JSON;

@Controller("userAction")
public class UserAction {

	@Autowired
	private IUserService iUserService;

	private User user;
	private String msg;
	private String result;

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
			if (resultUser.getStatus() == Const.Role.ROLE_USTOMER) {
				msg = "login_success";
				//登录成功后，将用户信息放入session当中
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute(Const.CURRENT_USER, resultUser);
			} else {
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
		if (adminUser == null || adminUser.getRole()==Const.Role.ROLE_ADMIN) {
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
		String question = null;
		if (resuUser == null) {
			msg = "username_no_exists";
		} else {
			msg = "username_is_exists";
			question = resuUser.getQuestion();
		}
		result = JSON.toJSONString(ServerResponse
				.createBySuccess(msg, question));
		System.out.println(result);
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

	/**
	 * 注册
	 * @return
	 */
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
	
	/**
	 * 匹配问题答案
	 * @return
	 */
	public String checkUserQuestionAndAnswer(){
		System.out.println("用户问题："+user.getQuestion());
		User resuUser = iUserService.checkUserQuesionAndAnswer(user.getUsername(), user.getQuestion(), user.getAnswer());
		if (resuUser == null) {
			msg = "check_fail";
		}else{
			msg = "check_success";
		}
		return "success";
	}
	
	/**
	 * 更新密码
	 * @return
	 */
	public String updateUserPassword(){
		System.out.println("用户密码："+user.getPassword());
		//加密密码
		user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
		boolean flag = iUserService.updateUserPassword(user.getUsername(),user.getPassword());
		if(flag){
			msg = "update_success";
		}else{
			msg = "update_fail";
		}
		return "success";
	}
	
	/*
	 * 判断用户是否登陆
	 */
	public String checkLogin(){
		//登录成功后，将用户信息放入session当中
		HttpSession session = ServletActionContext.getRequest().getSession();
		User resultUser = (User) session.getAttribute(Const.CURRENT_USER);
		if(resultUser == null){
			result = JSON.toJSONString(ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc()));
		}else{
			result = JSON.toJSONString(ServerResponse.createBySuccess("登录成功", resultUser));
		}
		System.out.println(result);
		return "success";
	}
	
	public String userLogout(){
		//从session当中拿到当前登录对象
		HttpSession session = ServletActionContext.getRequest().getSession();
		User resuUser = (User) session.getAttribute(Const.CURRENT_USER);
		if(resuUser == null){
			result = JSON.toJSONString(ServerResponse.createBySuccessMessage("暂未登录"));
		}else{
			session.setAttribute(Const.CURRENT_USER, null);
			result = JSON.toJSONString(ServerResponse.createBySuccessMessage("退出登录"));
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

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
