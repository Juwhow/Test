package com.test1.service;

import java.util.List;

import com.test1.beans.Order;
import com.test1.beans.User;

public interface OrderService {

	public void saveOrder(Order order);

	public void deleteOrder(Order order);

	public void updateOrder(Order order);

	public List<Order> findByUser(int userId);

}
