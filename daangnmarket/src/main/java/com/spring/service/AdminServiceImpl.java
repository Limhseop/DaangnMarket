package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.AdminDAO;
import com.spring.vo.MemberVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public ArrayList<MemberVO> getMemberList() {
		
		ArrayList<MemberVO> list = adminDAO.getMemberList();
		return list;
	}

}
