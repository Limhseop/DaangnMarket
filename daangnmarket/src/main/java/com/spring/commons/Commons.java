package com.spring.commons;
import java.util.HashMap;

import com.spring.service.BoardService;
import com.spring.service.ProductService;

public class Commons {

	//占쏙옙占쏙옙징 처占쏙옙 占쌨소듸옙 - startCount, endCount : HashMap map = commons.getPage(rpage, dao);
	public HashMap getPage(String rpage, Object obj, String name) {
		
		HashMap map = new HashMap<String, Integer>();

		//占쏙옙占쏙옙징 처占쏙옙 - startCount, endCount 占쏙옙占싹깍옙
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쌉시뱄옙 占쏙옙
		int reqPage = 1;	//占쏙옙청占쏙옙占쏙옙占쏙옙	
		int pageCount = 1;	//占쏙옙체 占쏙옙占쏙옙占쏙옙 占쏙옙
		int dbCount = 0;	//DB占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙체 占쏙옙占�
		
		if(name.equals("product")) {
			ProductService productService = (ProductService) obj;
			dbCount = productService.execTotalCount();
		}else if(name.equals("board")) {
			/*
			 * BoardService boardService = (BoardService)obj; dbCount =
			 * boardService.execTotalCount();
			 */
		}
		
		//占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占�
		if(dbCount % pageSize == 0){	
			pageCount = dbCount/pageSize;
		}else{							
			pageCount = dbCount/pageSize+1;
		}
		
		//占쏙옙청 占쏙옙占쏙옙占쏙옙 占쏙옙占�
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
		
		return map;
	}

}
