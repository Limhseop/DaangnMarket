package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.MypageDAO;
import com.spring.vo.MemberVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypagedao;
	
	@Override
	public MemberVO getMember(String id) {
		return mypagedao.getMember(id);
	}

	@Override
	public void profileImageChange(String file,String name) {
		mypagedao.profileImageChangge(file,name);
	}

	@Override
	public void introUpdate(String introduce, String name) {
		mypagedao.introUpdate(introduce,name);
	}

}
