package com.test1.controller;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.test1.beans.Order;
import com.test1.beans.User;
import com.test1.service.OrderService;
import com.test1.service.UserService;

//@RestController //通过此就访问不了jsp
@Controller
public class TestController {

	// 注册
	@RequestMapping("/testAJAX")
	public void testAJAX(HttpServletRequest request,
			HttpServletResponse response) {

		String str = request.getParameter("str");
		System.out.println("testAJAX:" + str);

		try {
			response.getWriter().write("Hello " + str);
			response.getWriter().flush();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return "index";

	}

	// 直接返回json
	@RequestMapping(value = "/json", method = RequestMethod.GET)
	@ResponseBody
	public User returnJson() {
		User user = new User();
		user.setEmail("2312313");
		user.setIDCard("231231231321");
		return user;
	}

	@RequestMapping("/AJAX")
	public String AJAX(HttpServletRequest request, HttpServletResponse response) {

		return "AJAX";

	}

	@RequestMapping("/test")
	public String test(HttpServletRequest request, HttpServletResponse response) {

		return "test";

	}

	@RequestMapping("/regist2")
	public String regist2(HttpServletRequest request,
			HttpServletResponse response) {

		return "regist2";

	}

	@RequestMapping("/file")
	public String file(HttpServletRequest request, HttpServletResponse response) {

		return "file";

	}

	@RequestMapping("/order1")
	public void order1(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("/order1");
		JSONArray jsonArray2 = new JSONArray();
		JSONObject jsonObject2 = new JSONObject();

		try {
			jsonObject2.put("status", "success");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		jsonArray2.put(jsonObject2);
		try {
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("Access-Control-Allow-Methods", "POST,GET");
			response.setHeader("Content-Type", "application/json;charset=UTF-8");
			response.getWriter().write(jsonArray2.toString());
			response.getWriter().flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping("/jsonTest")
	public void jsonTest(@RequestBody String str) {
		System.out.println("/jsonTest");
		System.out.println(str);

	}

	@RequestMapping("/postFile")
	public String postFile(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {

		System.out.println("开始");
		String path = "F:/";
		String fileName = new Date().getTime() + ".jpg";
		System.out.println(path);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}

		// 保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// model.addAttribute("fileUrl", request.getContextPath() + "/upload/"
		// + fileName);
		//
		return "index";
	}
}
