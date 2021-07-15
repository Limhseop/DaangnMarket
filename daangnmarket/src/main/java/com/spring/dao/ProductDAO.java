package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vo.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.product";
	
	//select : �� �� ������
	public int execTotalCount() {
		return sqlSession.selectOne(namespace+".count");
	}
	
	//select : ���� �̸� ��������
	public String getPsfile(String pid) {
		return sqlSession.selectOne(namespace+".psfile", pid);
		
	}
	
	//delete : �����ϱ�
	public boolean getDeleteResult(String pid) {
		boolean result = false;
		int value = sqlSession.delete(namespace+".pro_delete", pid);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update : �����ϱ�(���� ������)
	public boolean getUpdateResultNofile(ProductVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace+".pro_updateNofile", vo);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update : �����ϱ� (���� ����)
	public boolean getUpdateResult(ProductVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace+".pro_update", vo);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update: ��ȸ�� �ø���
	public void getUpdateHit(String pid) {
		sqlSession.update(namespace+".updateHit", pid);
	}
	
	//select : �󼼳��� ��������
	public ProductVO getContent(String pid) {
		return sqlSession.selectOne(namespace+".content", pid);
	}
	
	//select: ����Ʈ ��������
	public ArrayList<ProductVO> getList(int start, int end){
		Map<String, Object> param = new HashMap();
		param.put("start", start);
		param.put("end", end);
		
		List<ProductVO> list = sqlSession.selectList(namespace+".productlistpage", param);
		
		return (ArrayList<ProductVO>)list;
	}
	
	//select: ����Ʈ ��������
	public ArrayList<ProductVO> getList(){
		List<ProductVO> list = sqlSession.selectList(namespace+".productlist");
		return (ArrayList<ProductVO>)list;
	}
	
	//select: �ش� �Ǹ��� id�������� 
	public ArrayList<ProductVO> getList(String id){
		List<ProductVO> list = sqlSession.selectList(namespace+".productlistuser", id);
		return (ArrayList<ProductVO>)list;
	}

	public boolean getInsertResult(ProductVO vo) {
		// TODO Auto-generated method stub
		boolean result = true;
		
		int value = sqlSession.insert(namespace+".insert", vo);
		
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
}
