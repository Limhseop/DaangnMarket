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
	
	
	//�α��� üũ
	public SessionVO loginCheck(String id, String pass) {
		if(!id.equals("admin")) {	//�Ϲ� ������ ���
			String spass = sqlSession.selectOne(namespace+".loginGetPass", id);	//��ȣȭ�� ��й�ȣ �񱳸� ���� �޾ƿ���
			if(passwordEncoder.matches(pass,spass)) {	//��й�ȣ ��ġ�� ��
				Map param = new HashMap<String, String>();
				param.put("id", id);
				param.put("pass",spass);
				return sqlSession.selectOne(namespace+".login", param);
			}else {	//��й�ȣ ��ġ���� ����
				return null;
			}
		}else {	//������ ������ ���
			Map param = new HashMap<String, String>();
			param.put("id", id);
			param.put("pass",pass);
			return sqlSession.selectOne(namespace+".login", param);
		}
	}
	
	//���̵� �ߺ� üũ
	public boolean idCheck(String id) {
		boolean result=false;
		int sessionresult = sqlSession.selectOne(namespace+".idcheck", id);
		if(sessionresult!=0) result=true;
		return result;
	}
	
	//ȸ������ ����
	public boolean join_proc(MemberVO vo) {
		boolean result = false;
		vo.setAddr_enter(vo.getAddr_jibun());
		int sessionresult = sqlSession.insert(namespace+".join_proc", vo);
		if(sessionresult!=0) result=true;
		return result;
	}
	
	//���̵� ã��
	public String findIdCheck(MemberVO vo) {
		String sessionresult = sqlSession.selectOne(namespace+".findidcheck", vo);
		if(sessionresult==null) sessionresult="";
		return sessionresult;
	}
	
	//��й�ȣ ã�� - ���̵� �ֳ� Ȯ��
	public boolean findPassCheck(MemberVO vo) {
		boolean result=false;
		int sessionresult = sqlSession.selectOne(namespace+".findpasscheck",vo);
		if(sessionresult!=0) result = true;
		return result;
	}
	
	//��й�ȣ ã�� - �ڵ��� ��ȣ ��ġ�ϳ� Ȯ��
	public boolean phone_num_ajax(MemberVO vo) {
		boolean result=false;
		int sessionresult = sqlSession.selectOne(namespace+".phone_num_ajax", vo);
		if(sessionresult!=0) result = true;
		return result;
	}
	
	//��й�ȣ ã�� - ��й�ȣ �缳��
	public boolean setNewPass(MemberVO vo) {
		boolean result = false;
		int sessionresult = sqlSession.update(namespace+".setNewPass", vo);
		if(sessionresult!=0) result = true;
		return result;
	}
}