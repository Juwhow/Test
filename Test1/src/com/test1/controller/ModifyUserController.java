package com.test1.controller;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.test1.beans.User;
import com.test1.others.CreateCode;
import com.test1.others.SendEmail;
import com.test1.service.UserService;

//@RestController //通过此就访问不了jsp
@Controller
public class ModifyUserController {
	@Resource
	private UserService userService;

	// 修改用户信息界面
	@RequestMapping("/modifyInformation")
	public String modifyInformation(HttpServletRequest request,
			HttpServletResponse response) {
		if (request.getSession().getAttribute("user") == null)
			return "index";
		request.setAttribute("user", request.getSession().getAttribute("user"));
		return "modifyInformation";

	}

	// 修改密码
	@RequestMapping("/modifyPassword")
	public void modifyPassword(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("/modifyPassword");
		int id = Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newPassword");

		User user = userService.findById(id);
		String str = "";
		if (user.getPassword().equals(password)) {
			user.setPassword(newPassword);
			userService.updateUser(user);
			str = "密码修改成功。";
		} else
			str = "密码修改失败。";

		try {
			response.setHeader("Content-Type", "application/json;charset=UTF-8");
			response.getWriter().write(str);
			response.getWriter().flush();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return "index";

	}

	// 修改驾驶证号
	@RequestMapping("/modifyLicenseNumber")
	public void modifyLicenseNumber(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("/modifyLicenseNumber");
		int id = Integer.parseInt(request.getParameter("id"));
		String licenseNumber = request.getParameter("licenseNumber");

		User user = userService.findById(id);
		String str = "";

		user.setLicenseNumber(licenseNumber);
		userService.updateUser(user);
		str = "驾驶证号修改成功。";

		try {
			response.setHeader("Content-Type", "application/json;charset=UTF-8");
			response.getWriter().write(str);
			response.getWriter().flush();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 用户修改手机号 发送验证码
	@RequestMapping("/modifyNumber")
	public void modifyNumber(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("/modifyNumber");
		int id = Integer.parseInt(request.getParameter("id"));
		String newNumber = request.getParameter("newNumber");

		String str = "";
		if (userService.findByNumber(newNumber).size() > 0) {
			str = "fail";
		} else {
			// 调用接口发送短信
			//
			//
			//
			String messageCode = CreateCode.createCode(6);
			// 调用接口发送短信
			//
			//

			// 先假设验证码为123456
			request.getSession().setAttribute("messageCode", "123456");
			str = "success";

		}
		try {
			response.setHeader("Content-Type", "application/json;charset=UTF-8");
			response.getWriter().write(str);
			response.getWriter().flush();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 用户提交短信后 修改手机号
	@RequestMapping("/submitMessageCode")
	public void submitMessageCode(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("/submitMessageCode");
		int id = Integer.parseInt(request.getParameter("id"));
		String newNumber = request.getParameter("newNumber");
		String messageCode = request.getParameter("messageCode");

		String str = "";
		if (request.getSession().getAttribute(messageCode).equals(messageCode)) {
			User user = userService.findById(id);
			user.setNumber(newNumber);
			userService.updateUser(user);
			str = "手机号修改成功。";
		} else {

			str = "手机验证码不正确！";
		}
		try {
			response.setHeader("Content-Type", "application/json;charset=UTF-8");
			response.getWriter().write(str);
			response.getWriter().flush();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 修改邮箱
	@RequestMapping("/modifyEmail")
	public void modifyEmail(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("/modifyEmail");
		int id = Integer.parseInt(request.getParameter("id"));
		String newEmail = request.getParameter("newEmail");

		String str = "";
		if (userService.findByEmail(newEmail).size() > 0) {
			str = "邮箱已存在，修改失败。";
		} else {
			// 发送验证邮件
			String key = CreateCode.createCode(15);
			request.getSession().setAttribute("emailKey", key);
			String content = "验证码为：" + key + "。";
			String mailSubject = "邮箱验证";
			SendEmail se = new SendEmail();
			try {
				se.send(newEmail, content, mailSubject);
				str = "邮件已发送";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		try {
			response.setHeader("Content-Type", "application/json;charset=UTF-8");
			response.getWriter().write(str);
			response.getWriter().flush();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 修改邮箱
	@RequestMapping("/submitEmailCode")
	public void submitEmailCode(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("/submitEmailCode");
		int id = Integer.parseInt(request.getParameter("id"));
		String EmailCode = request.getParameter("EmailCode");
		String newEmail = request.getParameter("newEmail");

		String str = "";
		if (request.getSession().getAttribute("emailKey").equals(EmailCode)) {

			User user = userService.findById(id);
			user.setEmail(newEmail);
			userService.updateUser(user);
			str = "邮箱修改成功。";
		} else {
			str = "邮箱验证码错误！";
		}

		try {
			response.setHeader("Content-Type", "application/json;charset=UTF-8");
			response.getWriter().write(str);
			response.getWriter().flush();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 修改用户头像和用户类型
	@RequestMapping("/modifyPhoto")
	public String modifyPhoto(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {
		System.out.println("modifyPhoto");
		String IDCard = request.getParameter("user_id");
		String userType = request.getParameter("job");
		String nickname = request.getParameter("username");

		// 获取用户
		User user = userService.findByIDCard(IDCard).get(0);

		String photo = "C:/avatar/" + user.getId() + ".jpg";
		user.setUserType(userType);
		user.setNickname(nickname);

		if (!file.isEmpty()) {
			// 保存头像到本地
			user.setPhoto(photo);
			File targetFile = new File(photo);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				file.transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		userService.updateUser(user);
		request.setAttribute("modifyInformation", "success");
		if (request.getSession().getAttribute("user") == null)
			return "index";
		request.setAttribute("user", user);
		return "modifyInformation";
	}

}
