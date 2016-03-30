package com.test1.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test1.beans.Order;
import com.test1.beans.User;
import com.test1.service.OrderService;
import com.test1.service.UserService;

//@RestController //通过此就访问不了jsp
@Controller
public class OrderController {
	@Resource
	private OrderService orderService;
	@Resource
	private UserService userService;

	// 未登录请求订单页面
	@RequestMapping("/order")
	public String order(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("login", "noLogin");
		return "login";
	}

	// 未登录请求订单页面
	@RequestMapping("/myOrder")
	public String myOrder(HttpServletRequest request,
			HttpServletResponse response) {
		int userId = Integer.parseInt(request.getParameter("userId"));
		List<Order> orders = orderService.findByUser(userId);
		User user = userService.findById(userId);
		request.setAttribute("username", user.getNickname());
		request.setAttribute("orders", orders);
		return "order";
	}

	// 返回所有订单
	@RequestMapping("/allOrder")
	public void allOrder(HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");

		List<Order> orders = orderService.findByUser(user.getId());
		request.setAttribute("orders", orders);
	}

	// 添加订单
	@RequestMapping("/addOrder")
	public String addOrder(HttpServletRequest request,
			HttpServletResponse response) {
		String name = request.getParameter("object_name");
		int number = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price"));
		System.out.println("addOrder" + ":" + name + number);

		User user = (User) request.getSession().getAttribute("user");

		double total = number * price;

		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp orderTime = Timestamp.valueOf(formatter.format(currentTime));

		Order order = new Order(user, name, number, price, total, orderTime);
		orderService.saveOrder(order);

		List<Order> orders = orderService.findByUser(user.getId());
		request.setAttribute("username", user.getNickname());
		request.setAttribute("orders", orders);
		return "order";
	}

}
