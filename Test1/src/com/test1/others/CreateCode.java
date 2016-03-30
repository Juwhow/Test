package com.test1.others;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

public class CreateCode {
	// 随机产生6位验证码
	public static String createCode(int n) {

		char[] ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
		Random r = new Random();
		int len = ch.length, index;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < n; i++) {
			index = r.nextInt(len);
			sb.append(ch[index]);
		}
		return sb.toString();
	}

}
