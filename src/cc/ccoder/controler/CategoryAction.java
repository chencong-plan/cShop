package cc.ccoder.controler;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;

import cc.ccoder.common.ServerResponse;
import cc.ccoder.model.entity.Category;
import cc.ccoder.model.service.ICategoryService;

@Controller("categoryAction")
public class CategoryAction {

	private String result;
	private Integer categoryId;
	private List<Integer> categoryListId;

	@Autowired
	private ICategoryService iCategoryService;

	public String getCategoriesById() {
		//判断是否传入进来categoryId
		if (categoryId  == null) {
			categoryId =1; //如果没有传值进来 默认显示顶级一级菜单，那么顶级菜单就是1
		}
		List<Category> categories = iCategoryService
				.selectCategoryChildrenByParentId(categoryId);
		result = JSON.toJSONString(ServerResponse.createBySuccess(categories));
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("categories", categories);
		return "success";
	}
	
	public String getCategories(){
		if (categoryId == null) {
			categoryId =1;
		}
		Map<Category, List<Category>> categoryMap = iCategoryService.getCategories(categoryId);
		//将商品信息放入session当中
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("categoryMap", categoryMap);
		System.out.println(categoryMap);
		return "success";
	}
	
	public String getCategoryAndChildreById(){
		return "success";
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public List<Integer> getCategoryListId() {
		return categoryListId;
	}

	public void setCategoryListId(List<Integer> categoryListId) {
		this.categoryListId = categoryListId;
	}
	
	
	
}
