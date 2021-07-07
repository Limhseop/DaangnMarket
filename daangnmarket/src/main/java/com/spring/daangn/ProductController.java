package com.spring.daangn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	/***
	 *  product_update >>>  ��ǰ ����
	 */
	@RequestMapping(value = "/product_update.do", method = RequestMethod.GET)
	public String product_update(){
		return "product/product_update";
	}
	
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
	 *  product_list_search >>>  ��ǰ �˻� ����Ʈ(���ȭ��)
	 */
	@RequestMapping(value = "/product_search.do", method = RequestMethod.GET)
	public String product_list_search(){
		return "product/product_list_search";
	}
	
	/***
	 *  product_list >>>  ��ǰ �˻� ȭ��
	 */
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public String product_list(){
		return "product/product_list";
	}
	
}

