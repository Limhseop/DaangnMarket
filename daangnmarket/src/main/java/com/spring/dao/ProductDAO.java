package com.spring.dao;

public class ProductDAO {
<<<<<<< Updated upstream
=======
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.product";
	
	//select : 행 수 얻어오기
	public int execTotalCount() {
		return sqlSession.selectOne(namespace+".count");
	}
	
	//select : 파일 이름 가져오기
	public String getPsfile(String pid) {
		return sqlSession.selectOne(namespace+".psfile", pid);
		
	}
	
	//delete : 삭제하기
	public boolean getDeleteResult(String pid) {
		boolean result = false;
		int value = sqlSession.delete(namespace+".delete", pid);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update : 수정하기(파일 미포함)
	public boolean getUpdateResultNofile(ProductVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace+".updateNofile", vo);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update : 수정하기 (파일 포함)
	public boolean getUpdateResult(ProductVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace+".update", vo);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update: 조회수 올리기
	public void getUpdateHit(String pid) {
		sqlSession.update(namespace+".phit", pid);
	}
	
	//select : 상세내용 가져오기
	public ProductVO getContent(String pid) {
		return sqlSession.selectOne(namespace+".content", pid);
	}
	
	//select: 리스트 가져오기
	public ArrayList<ProductVO> getList(int start, int end){
		Map<String, Object> param = new HashMap();
		param.put("start", start);
		param.put("end", end);
		
		List<ProductVO> list = sqlSession.selectList(namespace+".productlistpage", param);
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
		
		return (ArrayList<ProductVO>)list;
	}
	
	//select: 리스트 가져오기
	public ArrayList<ProductVO> getList(){
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
		
		List<ProductVO> list = sqlSession.selectList(namespace+".productlist");
=======
>>>>>>> Stashed changes
=======
		
		List<ProductVO> list = sqlSession.selectList(namespace+".productlist");
>>>>>>> Stashed changes
		
		return (ArrayList<ProductVO>)list;
	}
	
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
	//select: 리스트 가져오기
	public ArrayList<ProductVO> getList(){
		
		List<ProductVO> list = sqlSession.selectList(namespace+".productlist");
		
		return (ArrayList<ProductVO>)list;
	}
	
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
	
	//insert : 게시판 글 쓰기
	public boolean getInsertResult(ProductVO vo) {
		boolean result = false;
>>>>>>> Stashed changes
		
		List<ProductVO> list = sqlSession.selectList(namespace+".productlist");
		
		return (ArrayList<ProductVO>)list;
	}
	
	
>>>>>>> Stashed changes
	//insert : 게시판 글 쓰기
	public boolean getInsertResult(prdouctVO) {
		
	}
}
