package com.test1.controller;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test1.beans.User;
import com.test1.others.CreateCode;
import com.test1.others.SendEmail;
import com.test1.service.UserService;

//@RestController //通过此就访问不了jsp
@Controller
public class UserController {
	@Resource
	private UserService userService;

	// 生成验证码
	@RequestMapping("/createCode")
	public void createCode(HttpServletRequest request,
			HttpServletResponse response) {

		BufferedImage bi = new BufferedImage(120, 50,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = bi.getGraphics();

		Color c = new Color(200, 150, 255);
		g.setColor(c);
		// g.fillRect(0, 0, 68, 22);
		g.fillRect(0, 0, 120, 50);
		char[] ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
		Random r = new Random();
		int len = ch.length, index;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 4; i++) {
			index = r.nextInt(len);
			g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt(255)));
			// g.drawString(ch[index] + "", (i * 15) + 3, 18);
			g.drawString(ch[index] + "", (i * 25) + 20, 30);
			sb.append(ch[index]);
		}
		request.getSession().setAttribute("piccode", sb.toString());
		try {
			ImageIO.write(bi, "JPG", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 检查登陆信息是否有误
	@RequestMapping("/checkUser")
	public String checkUserByNumber(HttpServletRequest request,
			HttpServletResponse response) {

		// String piccode = (String)
		// request.getSession().getAttribute("piccode");
		// String checkcode = request.getParameter("checkcode");
		// checkcode = checkcode.toUpperCase();
		// if (!checkcode.equals(piccode)) {
		// System.out.println("验证码错误");
		// request.setAttribute("login", "wrongCode");
		// return "login";
		// }

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(email + ":" + password);

		List<User> users = userService.findByEmail(email);
		if (users.size() > 0) {

			if (users.get(0).getStatus() == 0) {
				System.out.println("邮箱未激活");
				request.setAttribute("login", "noActivateMail");
				return "login";
			}

			String password2 = users.get(0).getPassword();

			if (password2.equals(password)) {
				System.out.println("登录成功");
				request.setAttribute("login", "success");
				request.getSession().setAttribute("user", users.get(0));

				request.setAttribute("user", users.get(0));

				return "loginIndex";
			} else {
				System.out.println("密码错误");
				request.setAttribute("login", "wrongPassword");
				return "login";
			}
		} else {
			System.out.println("用户不存在");
			request.setAttribute("login", "noUser");
			return "login";
		}

	}

	// 登录界面
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response) {

		return "login";

	}

	// 登录后主界面
	@RequestMapping("/loginIndex")
	public String loginIndex(HttpServletRequest request,
			HttpServletResponse response) {
		request.setAttribute("user", request.getSession().getAttribute("user"));
		return "loginIndex";

	}

	// 主界面
	@RequestMapping("/*")
	public String index(HttpServletRequest request, HttpServletResponse response) {

		return "index";

	}

	// 注册界面
	@RequestMapping("/register")
	public String register(HttpServletRequest request,
			HttpServletResponse response) {

		return "register";

	}

	// 注册
	@RequestMapping("/createUser")
	public String createUser(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("createUser");
		String name = request.getParameter("username");
		String sex = request.getParameter("sex");
		String userType = request.getParameter("job");
		String iDCard = request.getParameter("user_id");
		String iDCardEndTime = request.getParameter("user_id_day");
		String number = request.getParameter("phone");
		String phone_check_code = request.getParameter("phone_check_code");
		String email = request.getParameter("email");
		String licenseNumber = request.getParameter("driving_num");
		String licenseEndTime = request.getParameter("driving_day");
		String pic_check_code = request.getParameter("pic_check_code");

		System.out.println(name);
		System.out.println(sex);
		System.out.println(name);
		System.out.println(userType);
		System.out.println(iDCard);
		System.out.println(iDCardEndTime);
		System.out.println(number);
		System.out.println(phone_check_code);
		System.out.println(email);
		System.out.println(licenseNumber);
		System.out.println(licenseEndTime);
		System.out.println(pic_check_code);

		// 验证验证码
		String piccode = (String) request.getSession().getAttribute("piccode");
		pic_check_code = pic_check_code.toUpperCase();
		if (!pic_check_code.equals(piccode)) {
			System.out.println("验证码错误");
			request.setAttribute("register", "wrongCode");
			return "register";
		}

		// // 身份验证 姓名与身份证匹配
		// if () {
		// request.setAttribute("register", "usernameWrong");
		// return "register";
		// }

		// 验证手机是否已存在
		if (userService.findByNumber(number).size() > 0) {
			request.setAttribute("register", "phone");
			return "register";
		}

		// 验证邮箱是否已存在
		if (userService.findByEmail(email).size() > 0) {
			request.setAttribute("register", "email");
			return "register";
		}

		// 手机验证码验证
		if (!phone_check_code.equals("123456")) {
			request.setAttribute("register", "phoneCheckCodeWrong");
			return "register";
		}

		String password = CreateCode.createCode(10);
		// 发送验证邮件
		String key = CreateCode.createCode(15);
		String content = "您的初始密码为：" + password + "，激活邮箱后请您及时修改密码。";
		content += "复制以下网址到浏览器里直接打开：http://localhost:8080/Test1/activateMail?email="
				+ email + "&key=" + key;
		String mailSubject = "邮箱验证";
		SendEmail se = new SendEmail();
		try {
			se.send(email, content, mailSubject);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 设置默认值
		String photo = "C:/avatar/default.jpg";
		int status = 0;// 邮箱未激活
		String nickname = "";
		User user = new User(iDCard, name, password, sex, number, email,
				licenseNumber, photo, userType, status, nickname,
				iDCardEndTime, licenseEndTime, key);

		userService.saveUser(user);

		return "login";

	}

	// 激活邮箱
	@RequestMapping("/activateMail")
	public String activateMail(HttpServletRequest request,
			HttpServletResponse response) {

		String email = request.getParameter("email");
		String key = request.getParameter("key");
		List<User> users = userService.findByEmail(email);

		if (users.size() > 0) {
			User user = users.get(0);
			if (user.getEmailKey().equals(key)) {
				// key值匹配 修改用户状态 激活用户 可以登录
				user.setStatus(1);
				userService.updateUser(user);
				return "login";
			}
		}

		return "index";

	}

}
