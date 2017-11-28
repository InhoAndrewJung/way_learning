package com.way.learning.controller.board.tech;


import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.board.tech.vo.TechBoard;
import com.way.learning.model.member.vo.Member;
import com.way.learning.service.board.tech.ListVO;
import com.way.learning.service.board.tech.TechBoardService;



@Controller
@RequestMapping("/board/tech/*")
public class TechBoardController {

	@Autowired
	TechBoardService techBoardService;

	@RequestMapping("write")
	public String write() {
		System.out.println("보드롸이트 컨트롤러 입성");
		return "board/tech/write";
	}
	
	@RequestMapping("insert")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response,
			HttpSession session,TechBoard bvo ) throws Exception{
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("컨트로러 mvo:"+mvo);
		
		if(mvo==null){ //로그인 상태가 아니다...글쓰기로 못간다..
			return new ModelAndView("redirect:/");			
		}
		//로그인 한 상태라면
		bvo.setMember(mvo); //bvo와 mvo의 Hasing 관계가 성립된다..

		

		techBoardService.write(bvo); //w_date .. 이때 디비에 저장된다..
		System.out.println("컨트롤러 bvo:"+bvo);
		return new ModelAndView("board/tech/show_content", "bvo",bvo);
	}

	

	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response,String pageNo ,@RequestParam(defaultValue="all" ) String search_option, 
			@RequestParam(defaultValue="")  String keyword,ModelAndView mav)
			throws Exception{
		int count=techBoardService.countArticle(search_option, keyword); 
		System.out.println("count:"+count);
		//System.out.println("list컨트롤러 search_option:"+search_option);
		//System.out.println("list컨트롤러 keyword:"+keyword);
		ListVO lvo=techBoardService.getBoardList(pageNo,search_option,keyword );
		System.out.println("lvo:"+lvo);
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("lvo", lvo);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		mav.setViewName("board/tech/list");
		mav.addObject("map", map);
		
		return mav;
	}

	@RequestMapping("showContent")
	public ModelAndView showContent(HttpServletRequest request, HttpServletResponse response,String boardNo,@RequestParam(defaultValue="all" ) String search_option, 
			@RequestParam(defaultValue="")  String keyword,ModelAndView mav)
			throws Exception{


		//로그인한 사람만 상세글 정보를 볼수있는 권한을 부여한다.
		/*MemberVO mvo = (MemberVO)request.getSession().getAttribute("mvo");

		if(mvo==null) { //로그인 하지 않았다.
			return new ModelAndView("redirect:/index.jsp");
		}*/
		//조회수 증가 로직을 추가
		
		System.out.println("showContent컨트롤러 search_option:"+search_option);
		System.out.println("showContent컨트롤러 keyword:"+keyword);
		System.out.println("show boardNo:"+boardNo);
		
		techBoardService.updateCount(boardNo);
		
		

		TechBoard bvo=techBoardService.showContent(boardNo);
		System.out.println("show 컨트롤러 bvo:"+bvo);
		mav.setViewName("board/tech/show_content");
		mav.addObject("bvo", bvo);
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		return mav;
	}

	@RequestMapping("delete")
	public ModelAndView delete(HttpSession session,String boardNo, String newfilename)
			throws Exception{
		//로그인한 사람만 상세글 정보를 볼수있는 권한을 부여한다.
		
	
		//실제 DB에서 삭제됨
		techBoardService.deleteBoard(boardNo);
		return new ModelAndView("redirect:/board/tech/list");
	}

	@RequestMapping("updateView")
	public ModelAndView updateView(String boardNo)
			throws Exception{
		TechBoard bvo=techBoardService.showContent(boardNo);
		return new ModelAndView("board/tech/update", "bvo",bvo);
	}



	@RequestMapping("updateBoard")
	public ModelAndView updateBoard(TechBoard pvo,HttpSession session)
			throws Exception{

				techBoardService.updateBoard(pvo); //디비에 데이타를 직접 수정

		return new ModelAndView("board/tech/show_content", "bvo",techBoardService.showContent(pvo.getBoardNo()+""));
	}
	
	
	
	
	
	//ck 에디터 사용!!!
		@RequestMapping("imageUpload")
		public void imageUpload(HttpServletRequest request, HttpSession session,
				HttpServletResponse response, 
				@RequestParam MultipartFile upload ,ModelAndView mav)
					throws Exception {
			//imageUload.do를 통해  MultipartFile upload매개변수에 파일이 들어옴
			//업로드는클라이언트가 서버에 요청하는것임
			//http header 설정
			System.out.println("이미지 업로드 컨트롤러!!");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset-utf-8");
			//http body 설정
			OutputStream out=null; //java.io  업로드...
			PrintWriter printWriter=null; //java.io
			//업로드한 파일 이름
			String fileName=upload.getOriginalFilename();
			Date today= new Date();
			SimpleDateFormat df = new SimpleDateFormat("YYYYMMddHHmmssSSS");
			String now=df.format(today);

			String newfilename = now+"_"+fileName;
			
			System.out.println("newfilename:"+newfilename);
			//바이트 배열로 변환
			byte[] bytes=upload.getBytes();
			//이미지를 업로드할 디렉토리(배포 경로로 설정)
			
			//String root = session.getServletContext().getRealPath("/");
			//String path = root+"\\WEB-INF\\views\\images\\"+fileName;
			
			
			String uploadPath = session.getServletContext().getRealPath("/")+"\\WEB-INF\\views\\images\\" + newfilename;
			
					/*"C:\\Tomcat 8.5\\wtpwebapps\\SpringMVC16_SpringSecurity_RegisterMember\\WEB-INF\\views\\images\\" + newfilename;*/
			
			

			out=new FileOutputStream(new File(uploadPath)); //java.io
			//서버에 저장됨
			out.write(bytes);
			//한게시물에 이미지 1개씩 여러개 올릴수 있음. 그때 필요한 변수가 CKEditorFuncNum
			//ckeditor에서 만든 변수라 철자 맞아야 함. CKEditorFuncNum
			String callback=request.getParameter("CKEditorFuncNum");
			System.out.println("callback:"+callback);
			printWriter=response.getWriter();
			String fileUrl
				=request.getContextPath()+"/images/"+newfilename; 
			System.out.println("fileUrl:"+fileUrl);
		/*	mav.addObject("callback", callback);
			mav.addObject("fileUrl", fileUrl);
			mav.setViewName(viewName);
			*/
			printWriter.println(
					//window.parent는 팝업창을 띄운 메인작성창을 말함
	"<script>window.parent.CKEDITOR.tools.callFunction("
	+ callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"
	+ "</script>");
			//스트림 닫기
			printWriter.flush();
			
			/*return mav;*/
		}
}
































