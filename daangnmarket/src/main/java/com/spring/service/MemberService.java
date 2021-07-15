package com.spring.service;

public interface MemberService {
	boolean loginCheck(String id, String pass);
	boolean idCheck(String id);
}
