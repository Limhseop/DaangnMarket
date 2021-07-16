package com.spring.daangn;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.MypageService;
import com.spring.vo.MemberVO;
import com.spring.vo.SessionVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
//	@RequestMapping(value="/memberUpdate.do", method = RequestMethod.GET)
//	public ModelAndView memberUpdate() {
//		
//	}
	@RequestMapping(value="/memberUpdate.do" , method = RequestMethod.POST)
	public ModelAndView memberUpdate(@RequestParam Map<String,String> member) {
		ModelAndView mav = new ModelAndView();
		MemberVO vo = new MemberVO();
		
		String id = member.get("id");
		String phone = member.get("phone");
		
		System.out.println(id + phone);
		
		return mav;
	}
	
	
	@RequestMapping(value="/introUpdate.do" , method = RequestMethod.POST)
	public ModelAndView introUpdate(@RequestParam Map<String,String> intro, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		String name = svo.getId();
		String introduce = intro.get("intro");
		
		mypageService.introUpdate(introduce,name);
		
		mav.setViewName("redirect:/mypage.do?id="+ svo.getId());
		
		return mav;
	}
	
	@RequestMapping(value="/mypage.do" , method = RequestMethod.GET)
	public ModelAndView mypage(String id) {
		ModelAndView mav = new ModelAndView();
		
		MemberVO vo = mypageService.getMember(id);
		
		mav.setViewName("/mypage/mypage");
		mav.addObject("vo",vo);
		
		return mav;
	}
	
	@RequestMapping(value="/profileImageChange.do" , method = RequestMethod.POST)
	public ModelAndView profileImageChange(MultipartHttpServletRequest request,HttpSession session) throws Exception{
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		ModelAndView mav = new ModelAndView();
		
		MultipartFile fileName = request.getFile("file");
		
		String file="";
		String root_path="";
		String attach_path="";
		String name=svo.getId();
		
		
		if(fileName.getSize() != 0) {
			
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path = "\\resources\\profileimage\\";
			
			UUID uuid = UUID.randomUUID();
			file = uuid + fileName.getOriginalFilename();
			
			File file1 = new File(root_path + attach_path + uuid + fileName.getOriginalFilename());
			fileName.transferTo(file1);
		}
		
		mypageService.profileImageChange(file,name);
		mav.setViewName("redirect:/mypage.do?id="+svo.getId());
		
		return mav;
	}
}
