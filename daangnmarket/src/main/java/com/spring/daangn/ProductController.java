package com.spring.daangn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	/***
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
	public String product_content(){
		return "product/product_content";
	}
	
	/***
	 *  product_list >>>  ��ǰ ����Ʈ
	 */
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public String product_list(){
		return "product/product_list";
	}
	
}

