package com.spring.service;

import com.spring.vo.MemberVO;
import com.spring.vo.SessionVO;

public interface MemberService {
	SessionVO loginCheck(String id, String pass);
	boolean idCheck(String id);
	boolean join_proc(MemberVO vo);
	String findIdCheck(MemberVO vo);
	boolean findPassCheck(MemberVO vo);
	boolean phone_num_ajax(MemberVO vo);
	boolean setNewPass(MemberVO vo);
}
