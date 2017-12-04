package com.way.learning.util;

import java.io.File;

public class TestCase {

	public String process(String code) {
		File input = new File("C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\TestCase\\1.txt");
		code.replace("main(String[] args) {", "main(String[] args) { File input = new File(\"C:\\\\Users\\\\inhoj\\\\Desktop\\\\eclipse\\\\workspace\\\\The Coder\\\\TestCase\\\\1.txt\");");
		code.replace("System.in", "C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\TestCase\\1.txt");
		
		return code;
	}
}
