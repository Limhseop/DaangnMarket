package com.spring.dao;

public class ProductDAO {
<<<<<<< Updated upstream
=======
	
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
		int value = sqlSession.delete(namespace+".delete", pid);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update : �����ϱ�(���� ������)
	public boolean getUpdateResultNofile(ProductVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace+".updateNofile", vo);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update : �����ϱ� (���� ����)
	public boolean getUpdateResult(ProductVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace+".update", vo);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update: ��ȸ�� �ø���
	public void getUpdateHit(String pid) {
		sqlSession.update(namespace+".phit", pid);
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
	
	
>>>>>>> Stashed changes
	//insert : �Խ��� �� ����
	public boolean getInsertResult(prdouctVO) {
		
	}
}
