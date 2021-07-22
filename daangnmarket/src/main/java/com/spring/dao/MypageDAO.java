package com.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;

@Repository
public class MypageDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.member";
	
	//회원 정보 가져오기(name,joindate,sale,purchase,introduce)
	public MemberVO getMember(String id) {
		return sqlSession.selectOne(namespace+".getmember",id);
	}
	
	public void profileImageChangge(String file,String name) {
		Map<String,String> profile = new HashMap<String,String>();
		profile.put("fileName",file);
		profile.put("name", name);
		sqlSession.update(namespace+".profileimageupdate",profile);
	}
	
	public void introUpdate(String introduce,String name) {
		Map<String,String> param = new HashMap<String,String>();
		param.put("introduce",introduce);
		param.put("name", name);
		sqlSession.update(namespace+".introupdate",param);
	}
}
