package com.spring.service;

import java.util.ArrayList;

import com.spring.vo.MemberVO;
import com.spring.vo.ProductVO;

public interface MypageService {
	MemberVO getMember(String id);
	void profileImageChange(String file,String name);
	void introUpdate(String introduce,String name);
	ArrayList<ProductVO> getProduct(String id);
}
