package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;
import com.spring.vo.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.product";
	
	//������ ����Ʈ���� ���� ����
	public int getSelectDelete(String[] stArray) {
		return sqlSession.delete(namespace+".select_delete", stArray);
	}
	
	//select : ȸ���� ���ƿ� �ߴ��� ���� ��������
	public String getLike(String memberid) {
		return sqlSession.selectOne(namespace+".getlike", memberid);
	}
	
	//update : ä�� ī��Ʈ �ø���
	public int getChatCount(String pid) {
		return sqlSession.update(namespace+".updatechat", pid);
	}
	//update : ���ã�� �Ű��ϱ�
	public int getReportResult(String pid) {
		return sqlSession.update(namespace+".updatereport", pid);
	}
	//update : ���ã�� ����
	public int getLikeResult(String pid) {
		return sqlSession.update(namespace+".updatelike", pid);
	}
	//update : ���ã�� ����
	public int getDislikeResult(String pid) {
		return sqlSession.update(namespace+".updatedislike", pid);
	}
	
	//select: ���� ���� ��������
	public MemberVO getMember(String id) {
		return sqlSession.selectOne(namespace+".member", id);
	}
	
	
	//select : ���� ��ġ �˾ƿ���
	public String getLocation(String id) {
		return sqlSession.selectOne(namespace+".location", id);
	}
	
	//select : ���� �̸� �˾ƿ���
	public String getUserName(String id) {
		return sqlSession.selectOne(namespace+".username", id);
	}
	
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
	
	//update: �ǸŻ��� �ٲٱ�
	public int getSaleResult(String pid) {
		return sqlSession.update(namespace+".updateSale", pid);
	}
	
	//update: ��ȸ�� �ø���
	public void getUpdateHit(String pid) {
		sqlSession.update(namespace+".updateHit", pid);
	}
	//insert: ���ƿ� ����ϱ�
	public void likeInsert(String memberid, String pid) {
		Map<String, String> param = new HashMap();
		param.put("memberid", memberid);
		param.put("pid", pid);
		sqlSession.update(namespace+".likeinsert", pid);
	}
	//delete: ���ƿ� �����ϱ�
	public void likeDelete(String memberid, String pid) {
		Map<String, String> param = new HashMap();
		param.put("memberid", memberid);
		param.put("pid", pid);
		sqlSession.update(namespace+".likedelete", pid);
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
	//select: �˻� ����Ʈ ��������
	public ArrayList<ProductVO> getList(String category, String search){
		Map<String, String> param = new HashMap<String, String>();
		param.put("category", category); 
		param.put("sname", search);
		List<ProductVO> list = sqlSession.selectList(namespace+".productsearch", param);
		
		return (ArrayList<ProductVO>)list;
	}
	
	//select: �ش� �Ǹ��� id�������� 
	public ArrayList<ProductVO> getList(String id){
		List<ProductVO> list = sqlSession.selectList(namespace+".productlistuser", id);
		return (ArrayList<ProductVO>)list;
	}
	
	//select: �ش� �Ǹ��� id�������� 
	public ArrayList<ProductVO> getMoreList(String id){
		List<ProductVO> list = sqlSession.selectList(namespace+".productlistmore", id);
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
