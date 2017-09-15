package cc.ccoder.controler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;

import cc.ccoder.common.ServerResponse;
import cc.ccoder.model.entity.Category;
import cc.ccoder.model.service.ICategoryService;

@Controller("categoryAction")
public class CategoryAction {

	private String result;
	private List<Category> cateList;

	@Autowired
	private ICategoryService iCategoryService;
	
	public String getCategories(){
		result = JSON.toJSONString(ServerResponse.createByErrorMessage("暂无数据"));
		return "success";
	}
	
	

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	


}
