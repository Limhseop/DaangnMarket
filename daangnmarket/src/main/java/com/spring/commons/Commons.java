package com.spring.commons;
import java.util.HashMap;

import com.spring.service.BoardService;
import com.spring.service.ProductService;

public class Commons {

	//����¡ ó�� �޼ҵ� - startCount, endCount : HashMap map = commons.getPage(rpage, dao);
	public HashMap getPage(String rpage, Object obj, String name) {
		
		HashMap map = new HashMap<String, Integer>();

		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = 0;	//DB���� ������ ��ü ���
		
		if(name.equals("product")) {
			ProductService productService = (ProductService) obj;
			dbCount = productService.execTotalCount();
		}else if(name.equals("board")) {
			/*
			 * BoardService boardService = (BoardService)obj; dbCount =
			 * boardService.execTotalCount();
			 */
		}
		
		//�� ������ �� ���
		if(dbCount % pageSize == 0){	
			pageCount = dbCount/pageSize;
		}else{							
			pageCount = dbCount/pageSize+1;
		}
		
		//��û ������ ���
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 20;
		}
		
		map.put("start", startCount);
		map.put("end", endCount);
		map.put("dbCount", dbCount);
		map.put("pageSize", pageSize);
		map.put("rpage", reqPage);
		
		System.out.println(map);
		return map;
	}

}
