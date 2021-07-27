package com.spring.daangn;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.ProductService;
import com.spring.vo.MemberVO;
import com.spring.vo.ProductVO;
import com.spring.vo.SessionVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	

	/***
	 * notice/notice_select_delete_proc.do -----> ������ > �������� ����Ʈ ���û��� ó��
	 */
	@RequestMapping(value = "/adminproduct_select_delete_proc.do", method = RequestMethod.GET)
	public ModelAndView adminproduct_select_delete_proc(String chkList) {
		ModelAndView mv = new ModelAndView();

		StringTokenizer st = new StringTokenizer(chkList, ",");
		// String ��ü �ȿ� �ִ� , �� �������� �߶��ִ� ��ü!
		String[] stArray = new String[st.countTokens()];

		for (int i = 0; i < stArray.length; i++) {
			stArray[i] = st.nextToken();
			// String ���� ��������
		}

		int result = productService.getSelectDelete(stArray);

		if (result != 0) {
			mv.setViewName("redirect:/adminProduct.do");
		}

		return mv;
	}

	/**
	 * product_search_proc.do >> �˻�
	 */
	@RequestMapping(value = "/adminproduct_search_proc.do", method = RequestMethod.POST)
	public ModelAndView adminproduct_search_proc(String category, String search) {
		ModelAndView mv = new ModelAndView();

		ArrayList<ProductVO> list = productService.getList(category, search);
		ArrayList<ProductVO> totalList = productService.getList();
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("totalList", totalList);
		mv.setViewName("product/adminProduct_search");

		return mv;
	}

	/**
	 * adminProduct.do
	 */
	@RequestMapping(value = "/adminProduct.do", method = RequestMethod.GET)
	public ModelAndView adminProduct() {
		ModelAndView mv = new ModelAndView();

		ArrayList<ProductVO> list = productService.getList();

		mv.addObject("list", list);
		mv.setViewName("product/adminProduct");

		return mv;
	}

	/**
	 * UpdateSale.do
	 */
	@ResponseBody
	@RequestMapping(value = "/chatCountUpdate.do", method = RequestMethod.GET)
	public String chatCountUpdate(String pid) {
		int value = productService.getChatCount(pid);
		return String.valueOf(value);

	}

	/**
	 * UpdateSale.do
	 */
	@ResponseBody
	@RequestMapping(value = "/UpdateSale.do", method = RequestMethod.GET)
	public String UpdateSale(String pid) {
		int value = productService.getSaleResult(pid);
		return String.valueOf(value);

	}

	/**
	 * ReportUpdate.do
	 */
	@ResponseBody
	@RequestMapping(value = "/ReportUpdate.do", method = RequestMethod.GET)
	public String ReportUpdate(String pid) {
		int value = productService.getReportResult(pid);
		return String.valueOf(value);

	}

	/**
	 * likeUpdateProces.do
	 */
	@ResponseBody
	@RequestMapping(value = "/likeUpdateProcess.do", method = RequestMethod.GET)
	public String likeUpdateProcess(String pid, String uid) {
		
		int value = productService.getLikeResult(pid);
		productService.Updatelike(pid,uid);
		
		return String.valueOf(value);

	}

	/**
	 * dislikeUpdateProces.do
	 */
	@ResponseBody
	@RequestMapping(value = "/likeCancleProcess.do", method = RequestMethod.GET)
	public String likeCancleProcess(String pid, String uid) {

		int value = productService.getDislikeResult(pid);
		productService.Updatedislike(pid, uid);

		return String.valueOf(value);

	}
	/**
	 * likeUpdateProces.do
	 */
	/*@ResponseBody
	@RequestMapping(value = "/likeUpdateProcess.do", method = RequestMethod.GET)
	public String likeUpdateProcess(String pid, String uid) {
		
		int value = productService.getLikeResult(pid);
		productService.Updatelike(pid,uid);
		
		return String.valueOf(value);
		
	}*/
	
	/**
	 * dislikeUpdateProces.do
	 */
	/*@ResponseBody
	@RequestMapping(value = "/likeCancleProcess.do", method = RequestMethod.GET)
	public String likeCancleProcess(String pid, String uid) {
		
		int value = productService.getDislikeResult(pid);
		productService.Updatedislike(pid, uid);
		
		return String.valueOf(value);
		
	}*/

	/**
	 * product_search_proc.do >> �˻�
	 */
	@RequestMapping(value = "/product_search_proc.do", method = RequestMethod.POST)
	public ModelAndView product_search_proc(String category, String search) {
		ModelAndView mv = new ModelAndView();

		ArrayList<ProductVO> list = productService.getList(category, search);
		ArrayList<ProductVO> totalList = productService.getList();
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("totalList", totalList);
		mv.setViewName("product/product_list_search");

		return mv;
	}

	/**
	 * product_userpage >>���� ������ Ȯ���ϱ�
	 */
	@RequestMapping(value = "/product_userpage.do", method = RequestMethod.GET)
	public ModelAndView product_userpage(String id) {
		ModelAndView mv = new ModelAndView();

		MemberVO vo = productService.getMember(id);

		mv.setViewName("product/product_userpage");
		mv.addObject("vo", vo);

		return mv;
	}

	/***
	 * product_more >>> �� ���� ��ǰ ����
	 */
	@RequestMapping(value = "/product_more.do", method = RequestMethod.GET)
	public ModelAndView product_more(String id, String pid, String rno) {
		ModelAndView mv = new ModelAndView();

		// id�̿��ؼ� name ��������
		String name = productService.getUserName(id);

		// �ش� �Ǹ����� ����Ʈ ��������
		ArrayList<ProductVO> ulist = productService.getMoreList(id);

		mv.setViewName("product/product_more");
		mv.addObject("ulist", ulist);
		mv.addObject("name", name);
		mv.addObject("id", id);
		mv.addObject("pid", pid);
		mv.addObject("rno", rno);

		return mv;
	}

	/***
	 * product_more_sale >>> �Ǹ����� ��ǰ
	 */
	@RequestMapping(value = "/product_more_sale.do", method = RequestMethod.GET)
	public ModelAndView product_more_sale(String id, String pid, String rno) {
		ModelAndView mv = new ModelAndView();

		// id�̿��ؼ� name ��������
		String name = productService.getUserName(id);

		// �ش� �Ǹ����� ����Ʈ ��������
		ArrayList<ProductVO> ulist = productService.getMoreList(id);

		mv.setViewName("product/product_more_sale");
		mv.addObject("ulist", ulist);
		mv.addObject("name", name);
		mv.addObject("id", id);
		mv.addObject("pid", pid);
		mv.addObject("rno", rno);

		return mv;
	}

	/***
	 * product_more_saled >>> �Ǹŵ� ��ǰ
	 */
	@RequestMapping(value = "/product_more_saled.do", method = RequestMethod.GET)
	public ModelAndView product_more_saled(String id, String pid, String rno) {
		ModelAndView mv = new ModelAndView();

		// id�̿��ؼ� name ��������
		String name = productService.getUserName(id);

		// �ش� �Ǹ����� ����Ʈ ��������
		ArrayList<ProductVO> ulist = productService.getMoreList(id);

		mv.setViewName("product/product_more_saled");
		mv.addObject("ulist", ulist);
		mv.addObject("name", name);
		mv.addObject("id", id);
		mv.addObject("pid", pid);
		mv.addObject("rno", rno);

		return mv;
	}

	/***
	 * product_report >>> �Ű��ϱ�
	 */
	@RequestMapping(value = "/product_report.do", method = RequestMethod.GET)
	public String product_report() {
		return "product/product_report";
	}

	/***
	 * product_price >>> ��������
	 */
	@RequestMapping(value = "/product_price.do", method = RequestMethod.GET)
	public String product_price() {
		return "product/product_price";
	}

	/***
	 * product_update >>> ��ǰ ����
	 */
	@RequestMapping(value = "/product_update.do", method = RequestMethod.GET)
	public ModelAndView product_update(String pid, String rno) {

		ModelAndView mv = new ModelAndView();

		ProductVO vo = productService.getContent(pid);
		String content = vo.getPcontent().replace("<br>", "\r\n");
		String id = vo.getId();
		String location = productService.getLocation(id);

		mv.setViewName("product/product_update");
		mv.addObject("vo", vo);
		mv.addObject("content", content);
		mv.addObject("pid", pid);
		mv.addObject("rno", rno);
		mv.addObject("location", location);

		return mv;

	}
	
	/**
	 * deleteImage >> ������ ����
	 */
	@RequestMapping(value = "/deleteImage.do", method = RequestMethod.GET)
	public String deleteImage(String pid, HttpServletRequest request) {
		
		int value = productService.getDeleteImage(pid);
		
		String old_psfile = productService.getPsfile(pid);
		boolean result = productService.getDeleteResult(pid);

		if (result) {
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "\\resources\\pro_upload\\";

			File old_file = new File(root_path + attach_path + old_psfile);
			if (old_file.exists()) {
				old_file.delete();
			}
		}

		return String.valueOf(value);
	}
	
	

	/***
	 * product_update_proc >>> ��ǰ ����
	 */
	@RequestMapping(value = "/product_update_proc.do", method = RequestMethod.POST)
	public ModelAndView product_update_proc(ProductVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		if (vo.getPfile1().getSize() != 0) {
			// 1.�������� ��ġ
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "\\resources\\pro_upload\\";

			// 2.�����̸� ---> vo�� ����
			UUID uuid = UUID.randomUUID();
			vo.setPfile(vo.getPfile1().getOriginalFilename());
			vo.setPsfile(uuid + "_" + vo.getPfile1().getOriginalFilename());

			// 3.DB����
			String old_psfile = productService.getPsfile(vo.getPid());
			boolean result = productService.getUpdateResult(vo);

			if (result) {
				// 4.DB ���� ���� ---> upload ������ ����
				File file = new File(root_path + attach_path + vo.getPsfile());
				vo.getPfile1().transferTo(file);

				File old_file = new File(root_path + attach_path + old_psfile);

				if (old_file.exists()) {
					old_file.delete();
				}

			}

		} else {
			boolean result = productService.getUpdateResultNofile(vo);
		}

		mv.setViewName("product/product_list");
		/*
		 * mv.setViewName("redirect:/product_content.do?pid="+vo.getPid()+"&rno="+vo.
		 * getRno());
		 */

		return mv;

	}

	/***
	 * product_register_proc >>> ��ǰ ��� ���μ���
	 */
	@RequestMapping(value = "/product_register_proc.do", method = RequestMethod.POST)
	public ModelAndView product_register_proc(ProductVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		String root_path = "", attach_path = "";

		if (vo.getPfile1().getSize() != 0) {
			// 1.�������� ��ġ
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path = "\\resources\\pro_upload\\";

			// 2.�����̸� ---> vo�� ����
			UUID uuid = UUID.randomUUID();
			vo.setPfile(vo.getPfile1().getOriginalFilename());
			vo.setPsfile(uuid + "_" + vo.getPfile1().getOriginalFilename());

		}

		// 3.DB����
		boolean result = productService.getInsertResult(vo);

		if (result) {
			// ����Ʈ �������� ������ �̵�
			mv.setViewName("product/product_list");

			if (vo.getPfile1().getSize() != 0) {
				// 4.DB ���� ���� ---> upload ������ ����
				File file = new File(root_path + attach_path + vo.getPsfile());
				vo.getPfile1().transferTo(file);
			}

		}

		return mv;
	}
	
	

	/***
	 * product_register >>> ��ǰ ���
	 */
	@RequestMapping(value = "/product_register.do", method = RequestMethod.GET)
	public ModelAndView product_register(String id) {

		// �ּ� ���� ������ �� �ֵ��� ó��
		ModelAndView mv = new ModelAndView();

		String location = productService.getLocation(id);

		mv.setViewName("product/product_register");
		mv.addObject("location", location);

		return mv;

	}

	/***
	 * product_delete_proc >>> ��ǰ ���� ���μ���
	 */
	@RequestMapping(value = "/product_delete_proc.do", method = RequestMethod.GET)
	public ModelAndView product_delete_proc(String pid, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();

		String old_psfile = productService.getPsfile(pid);
		boolean result = productService.getDeleteResult(pid);
		
		System.out.println(result);
		
		if (result) {
			// ����Ʈ �������� ������ �̵�
			mv.setViewName("product/product_list");

			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "\\resources\\pro_upload\\";

			File old_file = new File(root_path + attach_path + old_psfile);
			if (old_file.exists()) {
				old_file.delete();
			}
		}

		return mv;
	}

	/***
	 * product_delete >>> ��ǰ ���� ������
	 */
	@RequestMapping(value = "/product_delete.do", method = RequestMethod.GET)
	public ModelAndView product_delete(String pid, String rno) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/product_delete");
		mv.addObject("rno", rno);
		mv.addObject("pid", pid);

		return mv;
	}

	/***
	 * product_content >>> ��ǰ �󼼳���
	 */
	@RequestMapping(value = "/product_content.do", method = RequestMethod.GET)
	public ModelAndView product_content(String pid, String rno, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		// ���� ��������
		ProductVO vo = productService.getContent(pid);
		String id = vo.getId();

		// id�̿��ؼ� name ��������
		String name = productService.getUserName(id);

		// ��ü ����Ʈ ��������
		ArrayList<ProductVO> list = productService.getList(1, 3);

		// �ش� �Ǹ����� ����Ʈ ��������
		ArrayList<ProductVO> ulist = productService.getList(id);

		// ��ȸ�� �ø���
		if (vo != null)
			productService.getUpdateHit(pid);
		String content = vo.getPcontent().replace("\r\n", "<br>");

		// ���ƿ� ���� ����Ʈ ��������
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		String uid = svo.getId();
		boolean like = productService.getlikeResult(pid, uid);

		// ��¥ ���� �߰��ϱ�
		mv.setViewName("product/product_content");
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		mv.addObject("ulist", ulist);
		mv.addObject("content", content);
		mv.addObject("pid", pid);
		mv.addObject("rno", rno);
		mv.addObject("name", name);
		mv.addObject("id", id);
		mv.addObject("like", like);

		return mv;
	}

	/***
	 * product_list_search >>> ��ǰ �˻� ����Ʈ(�⺻ ��ü ����Ʈ)
	 */
	/*
	 * @RequestMapping(value = "/product_search.do", method = RequestMethod.GET)
	 * public ModelAndView product_list_search_total() {
	 * 
	 * ModelAndView mvo = new ModelAndView();
	 * 
	 * ArrayList<ProductVO> list = productService.getList();
	 * 
	 * mvo.setViewName("product/product_list_search"); mvo.addObject("list", list);
	 * 
	 * return mvo; }
	 */

	/***
	 * product_list_search >>> ��ǰ �˻� ����Ʈ(�˻����)
	 */

	/*
	 * @RequestMapping(value = "/product_search.do", method = RequestMethod.GET)
	 * public ModelAndView product_list_search_total(String rpage){
	 * 
	 * ModelAndView mvo = new ModelAndView();
	 * 
	 * Commons commons = new Commons();
	 * 
	 * HashMap map = commons.getPage(rpage, productService, "product");
	 * 
	 * int start = (Integer)map.get("start"); int end = (Integer)map.get("end");
	 * 
	 * ArrayList<ProductVO> list = productService.getList(start, end);
	 * 
	 * mvo.setViewName("product/product_list_search"); mvo.addObject("list", list);
	 * mvo.addObject("dbcount", map.get("dbCount")); mvo.addObject("rpage",
	 * map.get("rpage")); mvo.addObject("pagesize", map.get("pageSize"));
	 * 
	 * 
	 * 
	 * return mvo; }
	 */

	/***
	 * product_list >>> ��ǰ �˻� ȭ��
	 */
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public String product_list() {
		return "product/product_list";
	}

}
