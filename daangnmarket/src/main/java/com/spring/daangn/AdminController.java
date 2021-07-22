package com.spring.daangn;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.AdminService;
import com.spring.vo.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/admin.do" , method = RequestMethod.GET)
	public ModelAndView admin() {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<MemberVO> list = adminService.getMemberList();
		
		for(MemberVO vo : list) {
			System.out.println(vo.getId());
		}
		
		mav.setViewName("admin/admin");
		return mav;
	}
}
