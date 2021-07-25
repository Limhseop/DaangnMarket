package com.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;
import com.spring.vo.SessionVO;

@Repository
public class MemberDAO extends DBConn {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private static String namespace = "mapper.loginjoin";
	
	
	//로그인 체크
	public SessionVO loginCheck(String id, String pass) {
		if(!id.equals("admin")) {	//일반 계정일 경우
			String spass = sqlSession.selectOne(namespace+".loginGetPass", id);	//암호화된 비밀번호 비교를 위한 받아오기
			if(passwordEncoder.matches(pass,spass)) {	//비밀번호 일치할 때
				Map param = new HashMap<String, String>();
				param.put("id", id);
				param.put("pass",spass);
				return sqlSession.selectOne(namespace+".login", param);
			}else {	//비밀번호 일치하지 않음
				return null;
			}
		}else {	//관리자 계정일 경우
			Map param = new HashMap<String, String>();
			param.put("id", id);
			param.put("pass",pass);
			return sqlSession.selectOne(namespace+".login", param);
		}
	}
	
	//아이디 중복 체크
	public boolean idCheck(String id) {
		boolean result=false;
		int sessionresult = sqlSession.selectOne(namespace+".idcheck", id);
		if(sessionresult!=0) result=true;
		return result;
	}
	
	//회원가입 진행
	public boolean join_proc(MemberVO vo) {
		boolean result = false;
		vo.setAddr_enter(vo.getAddr_jibun());
		int sessionresult = sqlSession.insert(namespace+".join_proc", vo);
		if(sessionresult!=0) result=true;
		return result;
	}
	
	//아이디 찾기
	public String findIdCheck(MemberVO vo) {
		String sessionresult = sqlSession.selectOne(namespace+".findidcheck", vo);
		if(sessionresult==null) sessionresult="";
		return sessionresult;
	}
	
	//비밀번호 찾기 - 아이디 있나 확인
	public boolean findPassCheck(MemberVO vo) {
		boolean result=false;
		int sessionresult = sqlSession.selectOne(namespace+".findpasscheck",vo);
		if(sessionresult!=0) result = true;
		return result;
	}
	
	//비밀번호 찾기 - 핸드폰 번호 일치하나 확인
	public boolean phone_num_ajax(MemberVO vo) {
		boolean result=false;
		int sessionresult = sqlSession.selectOne(namespace+".phone_num_ajax", vo);
		if(sessionresult!=0) result = true;
		return result;
	}
	
	//비밀번호 찾기 - 비밀번호 재설정
	public boolean setNewPass(MemberVO vo) {
		boolean result = false;
		int sessionresult = sqlSession.update(namespace+".setNewPass", vo);
		if(sessionresult!=0) result = true;
		return result;
	}
}