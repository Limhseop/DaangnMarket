package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.dao.MypageDAO;
import com.spring.vo.MemberVO;

public class MypageImpl implements Mypage{

	@Autowired
	private MypageDAO mypagedao;
	
	@Override
	public MemberVO getMember(String id) {
		return mypagedao.getMember(id);
	}

}
