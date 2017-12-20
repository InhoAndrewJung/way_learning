package com.way.learning.util;

import java.awt.Desktop;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;



public class Compute {
	


	public String[] compile(String code, int questionNo, int tcNo) throws Exception, IOException, InterruptedException {
		
		String sourceCode = code;
		String error = "";
		String result = "";
		String qNo = questionNo+"";
		String answer = "";
		String[] data = new String[4];
		//String[] saveTC = new String[5];
		String tc0="";
	
	
	
	createFile(sourceCode);	
	runJavac();
	
	//File eFile = new File("C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\error.txt");
	//File rFile = new File("C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\result.txt");
	//File tcFile = new File("C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\TestCase\\Q"+qNo+"_TC"+tcNo+"_ANS.txt");
	//File tmpFile = new File("C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\tmp.txt");
	File eFile = new File("C:\\The Coder\\error.txt");
	File rFile = new File("C:\\The Coder\\result.txt");
	File tcFile = new File("C:\\The Coder\\TestCase\\Q"+qNo+"_TC"+tcNo+"_ANS.txt");
	File tmpFile = new File("C:\\The Coder\\tmp.txt");
	Thread.sleep(500);
	Scanner scanError = new Scanner(eFile);
	Scanner scanResult = new Scanner(rFile);
	Scanner expAnswer = new Scanner(tcFile);
	
	
	
	
	while(scanError.hasNext()) {
		error += scanError.nextLine()+"\r\n";
	}
	
	while(scanResult.hasNext()) {
		result += scanResult.nextLine()+"\r\n";
		
	} 
	
	while(expAnswer.hasNext()) {
		answer += expAnswer.nextLine()+"\r\n";
	}
	if(error.contains("error")) {
		result="";
	}
	
	System.out.println("scanResult : " + result);
	System.out.println("scanExpAnswer : " + answer);
	data[0] = error;
	System.out.println("data[1]: "+ result);
	data[1] = result;
	
	
	scanError.close();
	scanResult.close();
	//save TC0~4 answer
	/*for(int i = 0; i<5; i++) {
		if(tcNo == i ) {
			FileWriter t = new FileWriter(tmpFile);
			if(result.equals(answer) ) {
				saveTC[i] = "correct";
				t.write("correct");
				t.close();
				System.out.println("TC0tmp result writed");
				System.out.println("TC0:"+data[2]);
			}else {
				saveTC[i] = "wrong";
				t.write("wrong");
				t.close();
				System.out.println("TC0tmp result writed");
				System.out.println("TC0:"+data[2]);
			}
			}
	}*///for ended
	
	//save TC0 and TC1 answer
	checkTestcase(tcNo, result, answer, data, tmpFile);
	
	
	
	
	//eFile.delete();
	//rFile.delete();
	
	
	
	//TC0와 TC1비교하여 최종값 판단
	Scanner tmp = new Scanner (tmpFile);
	if(tcNo == 1) {
	while(tmp.hasNext()) {
		tc0 = tmp.nextLine();
	}
	
	if(tc0.equals("correct") && data[3].equals("correct")) {
		System.out.println("TC값 비교 : "+tc0+"ㄹㄹ"+data[3]);
		data[2] = "correct";
		
	}else {
		data[2] = "wrong";
		System.out.println("TC값 비교 : "+tc0+"ㄹㄹ"+data[3]);
	}
	tmpFile.delete();
	}
	
	System.out.println("에러메세지 : "+ error);
	System.out.println("결과 :" + result);
	System.out.println("채점결과" + data[2]);
	
	return data;
	}

	private void runJavac() throws IOException, InterruptedException {
		//String batchFile = "C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\run.bat";
		String batchFile = "C:\\The Coder\\run.bat";
		/*String[] commands = {"cmd.exe", "/c", "C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\run.bat"};
		Process proc = Runtime.getRuntime().exec(commands);*/
		
		/*Display display = new Display();
		Program.launch(batchFile);
		display.dispose();*/
		
		//File bfile = new File("C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\run.bat");
		File bfile = new File("C:\\The Coder\\run.bat");
		
		
		Desktop desk = Desktop.getDesktop();
		long start = System.currentTimeMillis(); //시작시각
		synchronized (desk) {
			desk.open(bfile);		
			Thread.sleep(2000);
		}
		//Add kill CMD process code after 2s
		Runtime rt = Runtime.getRuntime();
		rt.exec("taskkill " +"/IM CMD.EXE");
/*	
		long end = System.currentTimeMillis(); //끝나는 시각
		
		long gap = (int)((end-start)/1000);
		
		System.out.println(gap+"초");
		if(gap>3) System.exit(0);*/
		 //Desktop.getDesktop().open(bfile);
		 //Desktop.getDesktop().wait(2000);
		/*Runtime rt = Runtime.getRuntime();
		String batFile = "C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\run.bat";
		Process proc;
		
		try {
			proc = rt.exec(batFile);
			proc.waitFor();
		} catch(Exception e) {
			e.printStackTrace();
		}*/
		//Thread.sleep(1500);
	}

	private void createFile(String sourceCode) throws IOException {
		System.out.println("soruce In");
		
		//File file = new File("C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\code.java");
		//File userCode = new File("C:\\Users\\inhoj\\Desktop\\eclipse\\workspace\\The Coder\\userCode.txt");
		File file = new File("C:\\The Coder\\code.java");
		File userCode = new File("C:\\The Coder\\userCode.txt");
		
		
		System.out.println("created file");
		FileWriter uc = new FileWriter(userCode);
		uc.write(sourceCode);
		uc.close();
		FileWriter fw = new FileWriter(file);
		fw.write(sourceCode);
		fw.close();
		System.out.println("file writed");
	}

	private void checkTestcase(int tcNo, String result, String answer, String[] data, File tmpFile) throws IOException {
		if(tcNo ==0) {
			FileWriter t = new FileWriter(tmpFile);
			if(result.equals(answer) ) {
				data[2] = "correct";
				t.write("correct");
				t.close();
				System.out.println("TC0tmp result writed");
				System.out.println("TC0:"+data[2]);
			}else {
				data[2] = "wrong";
				t.write("wrong");
				t.close();
				System.out.println("TC0tmp result writed");
				System.out.println("TC0:"+data[2]);
			}
			}
		
		
		if(tcNo ==1) {
		if(result.equals(answer) ) {
			System.out.println("TC1 ANSWER:"+answer);
			data[3] = "correct";
			System.out.println("TC1:"+data[3]);
		}else {
			data[3] = "wrong";
			System.out.println("TC1:"+data[3]);
		}
		}
	}
}
