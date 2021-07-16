package com.spring.service;

import com.spring.vo.MemberVO;

public interface MypageService {
	MemberVO getMember(String id);
	void profileImageChange(String file,String name);
	void introUpdate(String introduce,String name);
}
