package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.ProductDAO;
import com.spring.vo.ProductVO;

@Service("productService")
public class ProductServiceimpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public int execTotalCount() {
		return productDAO.execTotalCount();
	}
	@Override
	public String getPsfile(String pid) {
		return productDAO.getPsfile(pid);
	}
	@Override
	public boolean getDeleteResult(String pid) {
		return productDAO.getDeleteResult(pid);
	}
	@Override
	public boolean getUpdateResultNofile(ProductVO vo) {
		return productDAO.getUpdateResultNofile(vo);
	}
	@Override
	public boolean getUpdateResult(ProductVO vo) {
		return productDAO.getUpdateResult(vo);
	}
	@Override
	public void getUpdateHit(String pid) {
		productDAO.getUpdateHit(pid);
	}
	@Override
	public ProductVO getContent(String pid) {
		return productDAO.getContent(pid);
	}
	@Override
	public ArrayList<ProductVO> getList(int start, int end){
		return productDAO.getList(start, end);
	}
	@Override
	public boolean getInsertResult(ProductVO vo) {
		return productDAO.getInsertResult(vo);
	}
}
