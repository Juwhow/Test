package com.test1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test1.beans.Order;
import com.test1.beans.User;
import com.test1.dao.BaseDAO;
import com.test1.service.OrderService;
import com.test1.service.UserService;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {

	@Resource
	private BaseDAO<Order> baseDAO;

	@Override
	public void saveOrder(Order order) {
		baseDAO.save(order);
	}

	@Override
	public void deleteOrder(Order order) {
		baseDAO.delete(order);
	}

	@Override
	public void updateOrder(Order order) {
		baseDAO.update(order);

	}

	@Override
	public List<Order> findByUser(int userId) {
		String hql = "from com.test1.beans.Order where userId =" + userId;
		return baseDAO.find(hql);
	}

}
