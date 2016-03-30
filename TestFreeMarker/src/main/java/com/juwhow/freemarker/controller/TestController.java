package com.juwhow.freemarker.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show() {
		System.out.println("show");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		mav.addObject("name", "Juwhow");
		return mav;

	}
}
