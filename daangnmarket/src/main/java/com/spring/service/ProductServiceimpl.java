package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.ProductDAO;
import com.spring.vo.MemberVO;
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
	public void Updatelike(String pid, String uid) {
		productDAO.Updatelike(pid, uid);
	}
	@Override
	public void Updatedislike(String pid, String uid) {
		productDAO.Updatedislike(pid, uid);
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
	public ArrayList<ProductVO> getList(){
		return productDAO.getList();
	}
	@Override
	public ArrayList<ProductVO> getList(String id){
		return productDAO.getList(id);
	}
	@Override
	public ArrayList<ProductVO> getList(String category, String search){
		return productDAO.getList(category, search);
	}
	@Override
	public ArrayList<ProductVO> getMoreList(String id){
		return productDAO.getList(id);
	}
	@Override
	public boolean getInsertResult(ProductVO vo) {
		return productDAO.getInsertResult(vo);
	}
	@Override
	public String getUserName(String id) {
		return productDAO.getUserName(id);
	}
	@Override
	public String getLocation(String id) {
		return productDAO.getLocation(id);
	}
	@Override
	public MemberVO getMember(String id) {
		return productDAO.getMember(id);
	}
	@Override
	public int getLikeResult(String pid) {
		return productDAO.getLikeResult(pid);
	}
	@Override
	public int getDislikeResult(String pid) {
		return productDAO.getDislikeResult(pid);
	}
	@Override
	public int getReportResult(String pid) {
		return productDAO.getReportResult(pid);
	}
	@Override
	public int getSaleResult(String pid) {
		return productDAO.getSaleResult(pid);
	}
	@Override
	public int getDeleteImage(String pid) {
		return productDAO.getDeleteImage(pid);
	}
	@Override
	public int getChatCount(String pid) {
		return productDAO.getChatCount(pid);
	}
	@Override
	public int getSelectDelete(String[] stArray) {
		return productDAO.getSelectDelete(stArray);
	}
	@Override
	public boolean getlikeResult(String pid, String uid) {
		return productDAO.getlikeResult(pid, uid);
	}
	
	
}
