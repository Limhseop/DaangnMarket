package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO dao;
	
	public boolean loginCheck(String id, String pass) {
		return dao.loginCheck(id, pass);
	}
	
	public boolean idCheck(String id) {
		return dao.idCheck(id);
	}
}
