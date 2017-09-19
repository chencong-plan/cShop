package cc.ccoder.controler;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.Result;

import cc.ccoder.common.Const;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.service.IOrderService;

@Controller("orderAction")
public class OrderAction {

	@Autowired
	private IOrderService iOrderService;

	private Integer shippingId;
	
	private String result;

	public String addOrder() {
		HttpSession sesssion = ServletActionContext.getRequest().getSession();
		String cartIdArray = (String) sesssion.getAttribute("cartIdArray");
		String[] cartIds = cartIdArray.split(",");
		// 生成订单，以及往订单详情表里面插入数据
		User user = (User) sesssion.getAttribute(Const.CURRENT_USER);
		double totalPrice = (double) sesssion.getAttribute("confirm_totalPrice");
		if (iOrderService.addOrder(cartIds,shippingId,user,totalPrice)) {
			result = "add_order_success";
		}
		return "success";

	}

	public Integer getShippingId() {
		return shippingId;
	}

	public void setShippingId(Integer shippingId) {
		this.shippingId = shippingId;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
