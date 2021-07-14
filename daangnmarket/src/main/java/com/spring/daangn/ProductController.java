package com.spring.daangn;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.commons.Commons;
import com.spring.service.ProductService;
import com.spring.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	
	/***
	 *  product_more >>> 더 많은 상품 보기  
	 */
	/*
	 * @RequestMapping(value = "/product_more.do", method = RequestMethod.GET)
	 * public String product_more(){
	 * 
	 * ModelAndView mvo = new ModelAndView(); ArrayList<ProductVO> list =
	 * productService.getList();
	 * 
	 * mvo.setViewName("product/product_more"); mvo.addObject("list", list);
	 * 
	 * return mvo ; }
	 */
	
	/***
	 *  product_report >>>  신고하기
	 */
	@RequestMapping(value = "/product_report.do", method = RequestMethod.GET)
	public String product_report(){
		return "product/product_report";
	}
	
	/***
	 *  product_price >>>  가격제안
	 */
	@RequestMapping(value = "/product_price.do", method = RequestMethod.GET)
	public String product_price(){
		return "product/product_price";
	}
	
	/***
	 *  product_update >>>  상품 수정
	 */
	@RequestMapping(value = "/product_update.do", method = RequestMethod.GET)
	public String product_update(){
		return "product/product_update";
	}
	
	/***
	 *  product_update_proc >>>  상품 수정
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
	 *  product_register_proc >>>  상품 등록 프로세스
	 */
	@RequestMapping(value = "/product_register_proc.do", method = RequestMethod.POST)
	public ModelAndView product_register_proc(ProductVO vo, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String root_path = "", attach_path = "";
		
		if(vo.getPfile1().getSize() != 0) {
			//1.파일저장 위치
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path = "\\resources\\pro_upload\\";
		
			//2.파일이름 ---> vo에 저장
			UUID uuid = UUID.randomUUID();
			vo.setPfile(vo.getPfile1().getOriginalFilename());
			vo.setPsfile(uuid + "_" +vo.getPfile1().getOriginalFilename());
			System.out.println("bfile---->" + vo.getPfile());
			System.out.println("bsfile---->" + vo.getPsfile());
		}
		
		//3.DB연동
		//BoardDAO dao = new BoardDAO();
		boolean result = productService.getInsertResult(vo);
		
		if(result){
			//리스트 페이지로 페이지 이동
			mv.setViewName("redirect:/board.do");

			if(vo.getPfile1().getSize() != 0) {	
			//4.DB 연동 성공 ---> upload 폴더에 저장
			File file = new File(root_path+attach_path+vo.getPsfile());
			vo.getPfile1().transferTo(file);
			}
		}	
		
		
		return mv;
	}
	
	/***
	 *  product_register >>>  상품 등록
	 */
	@RequestMapping(value = "/product_register.do", method = RequestMethod.GET)
	public String product_register(){
		return "product/product_register";
	}
	
	/***
	 *  product_delete_proc >>>  상품 삭제 프로세스
	 */
	@RequestMapping(value = "/product_delete_proc.do", method = RequestMethod.POST)
	public ModelAndView product_delete_proc(String pid, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String  old_psfile = productService.getPsfile(pid);
		boolean result = productService.getDeleteResult(pid);
		
		if(result) {
			
			//리스트 페이지로 이동
			//전체 리스트로 이동할 수 있도록 수정하기 
			mv.setViewName("redirect:/product.do");
			
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "\\resources\\pro_upload\\";
			
			File old_file = new File(root_path+attach_path+old_psfile);
			if(old_file.exists()) {
				old_file.delete();
			}
			
		}
		
		return mv;
	}
	
	/***
	 *  product_delete >>>  상품 삭제 페이지
	 */
	@RequestMapping(value = "/product_delete.do", method = RequestMethod.GET)
	public String product_delete(){
		return "product/product_delete";
	}
	
	/***
	 *  product_content >>>  상품 상세내용
	 */
	@RequestMapping(value = "/product_content.do", method = RequestMethod.GET)
	public ModelAndView product_content(String pid, String rno){
		ModelAndView mv = new ModelAndView();
		
		ProductVO vo = productService.getContent(pid);
		
		if(vo != null) productService.getUpdateHit(pid);
		String content = vo.getPcontent().replace("\r\n", "<br>");
		
		mv.setViewName("product/product_content");
		mv.addObject("vo", vo);
		mv.addObject("content", content);
		mv.addObject("bid", pid);
		mv.addObject("rno", rno);
		
		return mv;
	}
	
	/***
	 *  product_list_search >>>  상품 검색 리스트(결과화면)
	 */
	/*
	 * @RequestMapping(value = "/product_search.do", method = RequestMethod.GET)
	 * public ModelAndView product_list_search(String rpage){
	 * 
	 * }
	 */
	
	/***
	 *  product_list_search >>>  상품 검색 리스트(기본 전체화면(시간순))
	 */
	@RequestMapping(value = "/product_search.do", method = RequestMethod.GET)
	public ModelAndView product_list_search_total(String rpage){
		
		ModelAndView mvo = new ModelAndView();
		
		Commons commons = new Commons();
		
		HashMap map = commons.getPage(rpage, productService, "product");
		
		int start = (Integer)map.get("start");
		int end = (Integer)map.get("end");
		
		ArrayList<ProductVO> list = productService.getList(start, end);
		
		mvo.setViewName("product/product_list_search");
		mvo.addObject("list", list);
		mvo.addObject("dbcount", map.get("dbCount"));
		mvo.addObject("rpage", map.get("rpage"));
		mvo.addObject("pagesize", map.get("pageSize"));
		
		
		
		return mvo;
	}
	
	/***
	 *  product_list >>>  상품 검색 화면
	 */
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public ModelAndView product_list(String rpage){
		
		ModelAndView mvo = new ModelAndView();
		mvo.setViewName("product/product_list");
		
		return mvo;
	}
	
}

