package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.MypageDAO;
import com.spring.vo.MemberVO;
import com.spring.vo.ProductVO;

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

	@Override
	public ArrayList<ProductVO> getProduct(String id) {
		return mypagedao.getProduct(id);
		
	}

}
