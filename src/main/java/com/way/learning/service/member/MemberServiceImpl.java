package com.way.learning.service.member;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.way.learning.model.member.dao.AuthoritiesDAO;
import com.way.learning.model.member.dao.MemberDAO;
import com.way.learning.model.member.vo.Authority;
import com.way.learning.model.member.vo.Member;
import com.way.learning.model.question.vo.AnswerResult;
import com.way.learning.util.Constants;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private AuthoritiesDAO authoritiesDAO;
	/*
	 * 비밀번호 암호화를 위한 객체를 주입받는다
	 */
	@Autowired
	private PasswordEncoder passwordEncoder;

	// 20171129 김보경 로직 3개 추가
	@Override
	public String findIdByEmail(String email) {
		 return memberDAO.findIdByEmail(email);
	}

	@Override
	public int updatefindPass(String  password,String userId) {
		return memberDAO.updatefindPass(password, userId);
	}
	public Member findMemberById(String id) {
		return memberDAO.findMemberById(id);
	}

	@Override
	public Member login(Member memberVO) {
		return memberDAO.login(memberVO);
	}

	@Transactional
	@Override
	public void updateMember(Member vo, HttpServletRequest request) throws Exception {

		System.out.println("1. MemberVO  :: " + vo);

		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		Member pvo = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		System.out.println("2. Spring Security 세션 수정 전 회원정보:" + pvo);

		// 비밀번호 변경
		String encodePassword = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encodePassword);

		// 파일 업로드 로직을 추가
		HttpSession session = request.getSession();
		MultipartFile mFile = vo.getUploadFile();

		if (mFile.isEmpty() == false) { // 파일 업로드를 했다면
			System.out.println(mFile.getSize() + "============" + mFile.isEmpty());

			String fileName = mFile.getOriginalFilename();

			Date today = new Date();
			SimpleDateFormat df = new SimpleDateFormat("YYYYMMddHHmmssSSS");
			String now = df.format(today);

			String newfilename = now + "_" + fileName;
			vo.setImgProfile(newfilename); // vo의 완벽한 세팅이 완료

			String root = session.getServletContext().getRealPath("/");
			String path = root + "\\resources\\upload\\";

			File copyFile = new File(path + newfilename);
			mFile.transferTo(copyFile); // upload 폴더에 newfilename이 저장

		} else {// 프로필 사진을 새로 첨부 안했으면 기존꺼 그대로 사용!

			vo.setImgProfile(pvo.getImgProfile());

		}

		memberDAO.updateMember(vo, request);

		System.out.println("**********************************************");

		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
		pvo.setPassword(encodePassword);
		pvo.setEmail(vo.getEmail());
		pvo.setImgProfile(vo.getImgProfile());
		System.out.println("3. Spring Security 세션 수정 후 회원정보:" + pvo);

	}

	@Transactional
	@Override
	public void registerMember(Member vo, HttpServletRequest request) throws Exception {
		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encodedPassword);
		System.out.println("멤버서비스 vo:" + vo);

		// 파일 업로드 로직을 추가
		HttpSession session = request.getSession();
		MultipartFile mFile = vo.getUploadFile();
		System.out.println(mFile.getSize() + "============" + mFile.isEmpty());
		if (mFile.isEmpty() == false) { // 파일 업로드를 했다면

			String fileName = mFile.getOriginalFilename();

			Date today = new Date();
			SimpleDateFormat df = new SimpleDateFormat("YYYYMMddHHmmssSSS");
			String now = df.format(today);

			String newfilename = now + "_" + fileName;
			vo.setImgProfile(newfilename); // vo의 완벽한 세팅이 완료

			String root = session.getServletContext().getRealPath("/");
			String path = root + "\\resources\\upload\\";

			File copyFile = new File(path + newfilename);
			mFile.transferTo(copyFile); // upload 폴더에 newfilename이 저장

		} else {
			String defaultImg = "defaultUser.svg";
			vo.setImgProfile(defaultImg);

		}

		memberDAO.registerMember(vo);

		// 권한등록
		/*
		 * AuthorityVO authority=new AuthorityVO(vo.getId(),"ROLE_MEMBER");
		 * memberDAO.registerRole(authority);
		 */
		authoritiesDAO.insertAuthority(new Authority(vo.getUserId(), Constants.ROLE_MEMBER));

	}

	@Override
	public String idcheck(String id) {
		int count = memberDAO.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public List<Authority> selectAuthorityByUsername(String username) {

		return authoritiesDAO.selectAuthorityByUserName(username);
	}
	
	
	@Override
	public List<String> selectRightNo(String userId) {
		return memberDAO.selectRightNo(userId);		
	}
	@Override
	public List<String> selectWrongNo(String userId) {
		return memberDAO.selectWrongNo(userId);		
	}
	
	@Override
	public AnswerResult selectMyRecord(String userId) {
		return memberDAO.selectMyRecord(userId);	
	}
	
	@Override
	public int selectMyRanking(String userId) {
		return memberDAO.selectMyRanking(userId);				
	}
	
	@Override
	public List<AnswerResult> selectAllRanking(String sorting) {
		return memberDAO.selectAllRanking(sorting);			
	}

	@Override
	public int emailcheck(String email) {
		int emailResult = memberDAO.emailcheck(email);
		return emailResult;
	}
	
	@Override
	public List selectBoardFavorite() {
		System.out.println("selectBoardFavorite service ");
		
		return memberDAO.selectBoardFavorite();	
	}
	
	@Override
	public List selectReplyFavorite() {
		System.out.println("selectReplyFavorite service ");
		
		return memberDAO.selectReplyFavorite();	
	}



}
