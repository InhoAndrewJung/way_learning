package com.way.learning.util;

import java.io.File;

public class Preprocess {

	
	public String process(String code, int questionNo, int tcNo) {
		
		
		
		
		//File input = new File("C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\TestCase\\Q"+qNo+"_"+"TC"+i+".txt");
		//Set TestCase file path
		
		if(code.contains("Scanner") && tcNo == 0) {
			//String TCpath = "\"C:\\\\\\\\\\Users\\\\\\\\\\inhoj\\\\\\\\\\Desktop\\\\\\\\\\eclipse\\\\\\\\\\workspace\\\\\\\\\\The Coder\\\\\\\\\\TestCase\\\\\\\\\\Q"+questionNo+"_"+"TC"+tcNo+".txt\"";
			String TCpath = "\"C:\\\\\\\\\\The Coder\\\\\\\\\\TestCase\\\\\\\\\\Q"+questionNo+"_"+"TC"+tcNo+".txt\"";
			code=code.replace("throws", ",");
			code=code.replace("args)", "args) throws FileNotFoundException");
			code=code.replaceFirst("Scanner", "File input = new File("+TCpath+"); Scanner");
			
		}else if(tcNo >= 1) {
			code=code.replace("TC"+(tcNo-1),"TC"+tcNo );
		}
		
		//Change to compatible unicode for iphone, ipad
		if(code.contains("“")) {
			code = code.replaceAll("“", "\"");
		}
		if(code.contains("”")) {
			code = code.replaceAll("”", "\"");
		}
		
		//Set Change System.in to input file
		code=code.replaceFirst("System.in", "input");
		
		
		
		
		
		
		
		
		return code;
	}
}
