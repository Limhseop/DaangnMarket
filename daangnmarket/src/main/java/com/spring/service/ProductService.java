package com.spring.service;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.spring.vo.MemberVO;
import com.spring.vo.ProductVO;

public interface ProductService {
	
	int execTotalCount();
	String getPsfile(String pid);
	boolean getDeleteResult(String pid);
	boolean getUpdateResultNofile(ProductVO vo);
	boolean getUpdateResult(ProductVO vo);
	void getUpdateHit(String pid);
	ProductVO getContent(String pid);
	ArrayList<ProductVO> getList(int start, int end);
	ArrayList<ProductVO> getList();
	ArrayList<ProductVO> getList(String id);
	ArrayList<ProductVO> getMoreList(String id);
	boolean getInsertResult(ProductVO vo);
	/* void getFileInsert(ProductVO vo); */
	String getUserName(String id);
	String getLocation(String id);
	//ȸ�� ���� ��������
	MemberVO getMember(String id);
	//�˻� ����Ʈ �������� 
	ArrayList<ProductVO> getList(String category, String search);
	//���ã�� Ŭ��
	int getLikeResult(String pid);
	int getDislikeResult(String pid);
	int getReportResult(String pid);
	int getSaleResult(String pid);
	int getSelectDelete(Array stArray);

}
