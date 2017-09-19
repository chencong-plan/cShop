package cc.ccoder.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.ccoder.model.dao.IOrderItemDao;
import cc.ccoder.model.service.IOrderItemService;

@Service("iOrderItemService")
public class OrderItemServiceImpl implements IOrderItemService {

	@Autowired
	private IOrderItemDao iOrderItemDao;
}
