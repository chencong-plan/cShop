package cc.ccoder.controler;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.Result;

import cc.ccoder.common.Const;
import cc.ccoder.common.ServerResponse;
import cc.ccoder.model.entity.Shipping;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.service.IShippingService;
import cc.ccoder.utils.DateUtils;

@Controller("shippingAction")
public class ShippingAction {

	@Autowired
	private IShippingService iShippingService;

	private Shipping shipping = new Shipping();

	private String result;
	private Integer pageNum;
	private Integer pageSize;
	
	private Integer shippingId;

	/**
	 * 添加地址进入数据库
	 * 
	 * @return
	 */
	public String addShipping() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if (user == null) {
			result = "no_login_shipping";
		}
		//开始组装shipping对象当中其他属性
		shipping.setUserId(user.getId());
		shipping.setCreateTime(DateUtils.getCurrentTime());
		if (iShippingService.addShipping(shipping)) {
			//插入数据成功
			result = "add_shipping_success";
		}
		addShippingToSession(user.getId(), pageNum, pageSize);
		return "success";
	}
	
	/**
	 * 添加收货地进入session
	 * @param userId
	 * @param pageNum
	 * @param pageSize
	 */
	public void addShippingToSession(Integer userId,Integer pageNum,Integer pageSize){
		if (pageNum == null || pageSize == null) {
			pageNum = 0;
			pageSize = 5;
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<Shipping> shippingLists = iShippingService.getShippingByUserId(userId,pageNum,pageSize); 
		session.setAttribute("shippingLists", shippingLists);
	}
	
	/**
	 * 根据id删除收货地址
	 * @return
	 */
	public String deleteShippingById(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if (iShippingService.deleteShippingById(shippingId,user.getId())) {
			addShippingToSession(user.getId(), pageNum, pageSize);
		}
		return "success";
	}
	
	/**
	 * 通过收货地址id获取到当前收货地址信息
	 * @return
	 */
	public String getShippingById(){
		Shipping shipping = iShippingService.getShippingById(shippingId);
		result = JSON.toJSONString(ServerResponse.createBySuccess(shipping));
		return "success";
	}

	public Shipping getShipping() {
		return shipping;
	}

	public void setShipping(Shipping shipping) {
		this.shipping = shipping;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Integer getShippingId() {
		return shippingId;
	}

	public void setShippingId(Integer shippingId) {
		this.shippingId = shippingId;
	}
	
	

}
