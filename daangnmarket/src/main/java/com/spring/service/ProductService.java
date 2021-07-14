package com.spring.service;

public interface ProductService {
<<<<<<< Updated upstream
=======
	
	int execTotalCount();
	String getPsfile(String pid);
	boolean getDeleteResult(String pid);
	boolean getUpdateResultNofile(ProductVO vo);
	boolean getUpdateResult(ProductVO vo);
	void getUpdateHit(String pid);
	ProductVO getContent(String pid);
	ArrayList<ProductVO> getList(int start, int end);
	ArrayList<ProductVO> getList();
	boolean getInsertResult(ProductVO vo);
	/* void getFileInsert(ProductVO vo); */
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

}
