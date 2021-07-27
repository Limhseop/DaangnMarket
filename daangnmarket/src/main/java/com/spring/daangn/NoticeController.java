package com.spring.daangn;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	// 공지사항 작성 처리
	@RequestMapping(value="/notice_proc.do", method=RequestMethod.POST)
	public ModelAndView notice_write_proc(NoticeVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());	
		
		//3. DB 연동
		boolean result = noticeService.getInsertResult(vo);	
		
	
		if(result){				
			mv.setViewName("redirect:/admin.do");	
		}
		return mv;
	}
	
	/**
	 * notice.do  ---> 공지사항 리스트 출력
	 */
	
	@RequestMapping(value = "/notice.do", method = RequestMethod.GET)
	public String list(Model model, NoticeVO vo) throws Exception{
		model.addAttribute("list",noticeService.list());
		
		return "/notice/notice";
	}
	// 관리자 공지사항 화면 
		@RequestMapping(value = "/admin_notice.do", method = RequestMethod.GET)
		public String adminnoticelist(Model model, NoticeVO vo) throws Exception{
			model.addAttribute("list",noticeService.list());
			
			return "/admin/admin";
			
		}
	// 관리자 공지사항 수정화면
		@RequestMapping(value="/admin_noticeupdate.do", method=RequestMethod.GET)
		public ModelAndView notice_update(String bno) {
			ModelAndView mv = new ModelAndView();
			
			NoticeVO vo = (NoticeVO)noticeService.getContent(bno);	
			
			
			mv.setViewName("admin/admin_update");
			mv.addObject("vo", vo);
			mv.addObject("bno", bno);
			
			return mv;
		}
	
	
	/**
	 *	notice_content.do  ---> 게시판 상세내용 화면
	 */
	@RequestMapping(value="/notice_content.do", method=RequestMethod.GET)
	public ModelAndView notice_content(String bno) {
		ModelAndView mv = new ModelAndView();
		
		NoticeVO vo = (NoticeVO)noticeService.getContent(bno);	
		
		
		mv.setViewName("notice/notice_content");
		mv.addObject("vo", vo);
		mv.addObject("bno", bno);
		
		return mv;
	}
	
	// 공지사항 수정
	@RequestMapping(value="/notice_updateproc.do", method=RequestMethod.POST)
	public ModelAndView notice_update_proc(NoticeVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		boolean result = noticeService.getUpdateResult(vo);
				
		if(result) {
			
			mv.setViewName("redirect:/admin.do");	
		}
			
		return mv;
	}
	// 공지사항 삭제처리
	@RequestMapping(value="/admin_noticedelete_proc.do", method=RequestMethod.GET)
	public ModelAndView notice_delete_proc(NoticeVO vo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = noticeService.getDeleteResult(vo);
		
		if(result) {
			mv.setViewName("redirect:/admin.do");
			}
		return mv;
	}
	
}