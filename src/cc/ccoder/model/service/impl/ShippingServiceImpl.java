package cc.ccoder.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.ccoder.model.dao.IShippingDao;
import cc.ccoder.model.entity.Shipping;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.service.IShippingService;

@Service("iShippingService")
public class ShippingServiceImpl implements IShippingService {

	@Autowired
	private IShippingDao iShippingDao;

	@Override
	public boolean addShipping(Shipping shipping) {
		if (shipping == null) {
			return false;
		}
		return iShippingDao.addShipping(shipping);
	}

	@Override
	public List<Shipping> getShippingByUserId(Integer userId, Integer pageNum,Integer pageSize) {
		if (userId == null || pageNum == null || pageSize == null) {
			return null;
		}
		return iShippingDao.getShippingByUserId(userId,pageNum,pageSize);
	}

	@Override
	public boolean deleteShippingById(Integer shippingId, Integer userId) {
		if (shippingId == null || userId == null) {
			return false;
		}
		return iShippingDao.deleteShippingById(shippingId,userId);
	}

	@Override
	public Shipping getShippingById(Integer shippingId) {
		if (shippingId == null) {
			return null;
		}
		return iShippingDao.getShippingById(shippingId);
	}
}
