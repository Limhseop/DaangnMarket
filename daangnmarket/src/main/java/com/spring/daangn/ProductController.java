package com.spring.daangn;

<<<<<<< Updated upstream
=======
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> Stashed changes
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	
	
	/***
<<<<<<< Updated upstream
	 *  product_more >>> �� ���� ��ǰ ����  
	 */
	@RequestMapping(value = "/product_more.do", method = RequestMethod.GET)
	public String product_more(){
		return "product/product_more";
	}
	
	/***
=======
>>>>>>> Stashed changes
	 *  product_report >>>  �Ű��ϱ�
	 */
	@RequestMapping(value = "/product_report.do", method = RequestMethod.GET)
	public String product_report(){
		return "product/product_report";
	}
	
	/***
	 *  product_price >>>  ��������
	 */
	@RequestMapping(value = "/product_price.do", method = RequestMethod.GET)
	public String product_price(){
		return "product/product_price";
	}
	
	/***
	 *  product_update >>>  ��ǰ ����
	 */
	@RequestMapping(value = "/product_update.do", method = RequestMethod.GET)
	public String product_update(){
		return "product/product_update";
	}
	
	/***
<<<<<<< Updated upstream
=======
	 *  product_update_proc >>>  ��ǰ ����
	 */
	@RequestMapping(value = "/product_update_proc.do", method = RequestMethod.GET)
	public ModelAndView product_update_proc(String pid, String rno){
		ModelAndView mv = new ModelAndView();
		
		ProductVO vo = productService.getContent(pid);
		String content = vo.getPcontent().replace("<br>", "\r\n");
		
		mv.setViewName("redirect:/product.do");
		mv.addObject("vo", vo);
		mv.addObject("content", content);
		mv.addObject("pid", pid);
		mv.addObject("rno", rno);
		
		return mv;
	}
	
	/***
	 *  product_register_proc >>>  ��ǰ ��� ���μ���
	 */
	@RequestMapping(value = "/product_register_proc.do", method = RequestMethod.POST)
	public ModelAndView product_register_proc(ProductVO vo, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String root_path = "", attach_path = "";
		
		if(vo.getPfile1().getSize() != 0) {
			//1.�������� ��ġ
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path = "\\resources\\pro_upload\\";
		
			//2.�����̸� ---> vo�� ����
			UUID uuid = UUID.randomUUID();
			vo.setPfile(vo.getPfile1().getOriginalFilename());
			vo.setPsfile(uuid + "_" +vo.getPfile1().getOriginalFilename());
			System.out.println("pfile---->" + vo.getPfile());
			System.out.println("psfile---->" + vo.getPsfile());
			
			/* productService.getFileInsert(vo); */
		}
		
		//3.DB����
		boolean result = productService.getInsertResult(vo);
		
		if(result){
			//����Ʈ �������� ������ �̵�
			/* mv.setViewName("redirect:/product.do"); */
			mv.setViewName("product/product_list_search");

			if(vo.getPfile1().getSize() != 0) {	
			//4.DB ���� ���� ---> upload ������ ����
			File file = new File(root_path+attach_path+vo.getPsfile());
			vo.getPfile1().transferTo(file);
			}
			
		}
		
		return mv;
	}
	
	/***
>>>>>>> Stashed changes
	 *  product_register >>>  ��ǰ ���
	 */
	@RequestMapping(value = "/product_register.do", method = RequestMethod.GET)
	public String product_register(){
		return "product/product_register";
	}
	
	/***
	 *  product_delete >>>  ��ǰ ���� ������
	 */
	@RequestMapping(value = "/product_delete.do", method = RequestMethod.GET)
	public String product_delete(){
		return "product/product_delete";
	}
	
	/***
	 *  product_content >>>  ��ǰ �󼼳���
	 */
	@RequestMapping(value = "/product_content.do", method = RequestMethod.GET)
<<<<<<< Updated upstream
	public String product_content(){
		return "product/product_content";
=======
	public ModelAndView product_content(String pid, String rno){
		ModelAndView mv = new ModelAndView();
		
		ProductVO vo = productService.getContent(pid);
		ArrayList<ProductVO> = productService.getList(1, 6);
		
		if(vo != null) productService.getUpdateHit(pid);
		String content = vo.getPcontent().replace("\r\n", "<br>");
		
		mv.setViewName("product/product_content");
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		mv.addObject("content", content);
		mv.addObject("bid", pid);
		mv.addObject("rno", rno);
		
		return mv;
>>>>>>> Stashed changes
	}
	
	/***
	 *  product_list_search >>>  ��ǰ �˻� ����Ʈ(���ȭ��)
	 */
	@RequestMapping(value = "/product_search.do", method = RequestMethod.GET)
<<<<<<< Updated upstream
	public String product_list_search(){
		return "product/product_list_search";
=======
	public ModelAndView product_list_search_total(){
		
		ModelAndView mvo = new ModelAndView();
		
		ArrayList<ProductVO> list = productService.getList();
		
		mvo.setViewName("product/product_list_search");
		mvo.addObject("list", list);
		
		return mvo;
>>>>>>> Stashed changes
	}
	
	/***
	 *  product_list_search >>>  ��ǰ �˻� ����Ʈ(�⺻ ��üȭ��(�ð���))
	 */
	/*
	 * @RequestMapping(value = "/product_search.do", method = RequestMethod.GET)
	 * public ModelAndView product_list_search_total(String rpage){
	 * 
	 * ModelAndView mvo = new ModelAndView();
	 * 
	 * Commons commons = new Commons();
	 * 
	 * HashMap map = commons.getPage(rpage, productService, "product");
	 * 
	 * int start = (Integer)map.get("start"); int end = (Integer)map.get("end");
	 * 
	 * ArrayList<ProductVO> list = productService.getList(start, end);
	 * 
	 * mvo.setViewName("product/product_list_search"); mvo.addObject("list", list);
	 * mvo.addObject("dbcount", map.get("dbCount")); mvo.addObject("rpage",
	 * map.get("rpage")); mvo.addObject("pagesize", map.get("pageSize"));
	 * 
	 * 
	 * 
	 * return mvo; }
	 */
	
	/***
	 *  product_list >>>  ��ǰ �˻� ȭ��
	 */
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public String product_list(){
		return "product/product_list";
	}
	
}

