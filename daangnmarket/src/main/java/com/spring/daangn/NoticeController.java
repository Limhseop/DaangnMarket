package com.spring.daangn;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.NoticeService;
import com.spring.vo.NoticeVO;


@Controller

public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	// 공지사항 글 작성 화면
	@RequestMapping(value="/notice_write.do", method=RequestMethod.GET)
	public String notice_wirte() {
		return "/notice/notice_write";
	}
	
	// 공지사항 리스트 화면
	@RequestMapping(value="/notice.do", method=RequestMethod.GET)
	public String notice() {
		return "/notice/notice";
	}
	
	
	// 공지사항 작성 처리
	@RequestMapping(value="/notice_proc.do", method=RequestMethod.POST)
	public ModelAndView notice_write_proc(NoticeVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());	
		
		//3. DB 연동
		boolean result = noticeService.getInsertResult(vo);	
		
	
		if(result){				
			mv.setViewName("redirect:/board_list.do");	
		}
		return mv;
	}
	
}