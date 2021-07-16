package com.spring.daangn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	
	
	/***
	 *  product_more >>> 더 많은 상품 보기  
	 */
	@RequestMapping(value = "/product_more.do", method = RequestMethod.GET)
	public String product_more(){
		return "product/product_more";
	}
	
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
	 *  product_register >>>  상품 등록
	 */
	@RequestMapping(value = "/product_register.do", method = RequestMethod.GET)
	public String product_register(){
		return "product/product_register";
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
	public String product_content(){
		return "product/product_content";
	}
	
	/***
	 *  product_list_search >>>  상품 검색 리스트(결과화면)
	 */
	@RequestMapping(value = "/product_search.do", method = RequestMethod.GET)
	public String product_list_search(){
		return "product/product_list_search";
	}
	
	/***
	 *  product_list >>>  상품 검색 화면
	 */
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public String product_list(){
		return "product/product_list";
	}
	
}

