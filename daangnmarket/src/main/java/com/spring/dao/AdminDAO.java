package com.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.vo.MemberVO;

public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.admin";
	
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		List<MemberVO> al = new ArrayList<MemberVO>();
		al = sqlSession.selectList(namespace+".getmemberlist");
		
		list = (ArrayList<MemberVO>)al;
		
		return list;
	}
}
