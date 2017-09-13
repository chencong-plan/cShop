package cc.ccoder.controler;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import cc.ccoder.model.entity.User;
import cc.ccoder.model.service.IUserService;
import cc.ccoder.utils.MD5Util;

@ParentPackage("struts-default")
@Namespace("/")
@ExceptionMappings({ @ExceptionMapping(exception = "java.lange.RuntimeException", result = "error") })
public class UserAction {

	@Autowired
	private IUserService iUserService;

	private User user;

	@Action(value = "userLogin", results = {
			@Result(name = "login_success", type = "redirect", location = "/welcome.jsp"),
			@Result(name = "login_fail", type = "redirect", location = "/admin/login.jsp") })
	public String userLogin() {
		// 将输入的密码进行加密
		user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
		if (iUserService.userLogin(user) == null) {
			return "login_fail";
		}
		return "login_success";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
