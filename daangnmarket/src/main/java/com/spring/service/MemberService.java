package com.spring.service;

import com.spring.vo.SessionVO;

public interface MemberService {
	SessionVO loginCheck(String id, String pass);
	boolean idCheck(String id);
}
