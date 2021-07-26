package com.spring.daangn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	// boardlist-게시판
	@RequestMapping(value = "/boardlist.do", method = RequestMethod.GET)
	public String boardlist() {
		return "/board/boardlist";
	}

	// board_add-게시글 추가
	@RequestMapping(value = "/board_add.do", method = RequestMethod.GET)
	public String boardAdd() {
		return "/board/board_add";
	}

	// board_post-게시글
	@RequestMapping(value = "/board_post.do", method = RequestMethod.GET)
	public String boardPost() {
		return "/board/board_post";
	}
	
	// board_update-게시글 수정
	@RequestMapping(value = "/board_update.do", method = RequestMethod.GET)
	public String boardUpdate() {
		return "/board/board_update";
	}
}
