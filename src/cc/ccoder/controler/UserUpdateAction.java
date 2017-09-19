package cc.ccoder.controler;

import org.springframework.beans.factory.annotation.Autowired;

import cc.ccoder.common.Const;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.service.IUserService;

import org.springframework.stereotype.Controller;

@Controller("userUpdateAction")
public class UserUpdateAction {

	@Autowired
	private IUserService iUserService;

	private String username;
	private String email;
	private String activeKey;
	private String result;

	public String updateUserStatus() {
		if (username == null || email == null || activeKey == null) {
			result = "active_fail";
		}
		User user = iUserService.getUserByEmailUsername(username, email);
		if (user == null) {
			result = "active_fail";
		}
		if (user.getStatus() == 0) {
			result = "active_success";
		}else{
			if (user.getActiveKey().equals(activeKey)) {
				//开始激活
				user.setActiveKey(null);
				user.setStatus(0);
				if(iUserService.updateUserStatus(user)){
					result = "active_success";
				}
			}else{
				result = "active_fail";
			}
		}
		return result;

	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getActiveKey() {
		return activeKey;
	}

	public void setActiveKey(String activeKey) {
		this.activeKey = activeKey;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
