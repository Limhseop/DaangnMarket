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
	
	
	// �������� �� �ۼ� ȭ��
	@RequestMapping(value="/notice_write.do", method=RequestMethod.GET)
	public String notice_wirte() {
		return "/notice/notice_write";
	}
	
	
	// �������� �ۼ� ó��
	@RequestMapping(value="/notice_proc.do", method=RequestMethod.POST)
	public ModelAndView notice_write_proc(NoticeVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());	
		
		//3. DB ����
		boolean result = noticeService.getInsertResult(vo);	
		
	
		if(result){				
			mv.setViewName("redirect:/admin.do");	
		}
		return mv;
	}
	
	/**
	 * notice.do  ---> �������� ����Ʈ ���
	 */
	
	@RequestMapping(value = "/notice.do", method = RequestMethod.GET)
	public String list(Model model, NoticeVO vo) throws Exception{
		model.addAttribute("list",noticeService.list());
		
		return "/notice/notice";
	}
	// ������ �������� ȭ�� 
		@RequestMapping(value = "/admin_notice.do", method = RequestMethod.GET)
		public String adminnoticelist(Model model, NoticeVO vo) throws Exception{
			model.addAttribute("list",noticeService.list());
			
			return "/admin/admin";
			
		}
	// ������ �������� ����ȭ��
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
	 *	notice_content.do  ---> �Խ��� �󼼳��� ȭ��
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
	
	// �������� ����
	@RequestMapping(value="/notice_updateproc.do", method=RequestMethod.POST)
	public ModelAndView notice_update_proc(NoticeVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		boolean result = noticeService.getUpdateResult(vo);
				
		if(result) {
			
			mv.setViewName("redirect:/admin.do");	
		}
			
		return mv;
	}
	// �������� ����ó��
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