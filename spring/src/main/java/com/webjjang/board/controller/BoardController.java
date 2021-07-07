package com.webjjang.board.controller;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webjjang.board.service.BoardService;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.util.PageObject;

@Controller
@RequestMapping("/board")
public class BoardController {

	private final String MODULE_NAME = "board";

	@Autowired
	private BoardService service;

	// 게시판 리스트
	@GetMapping("/list.do")
	public String list(Model model, PageObject pageObject) {
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return MODULE_NAME + "/list";
	}

	// 게시판 글 상세보기
	@GetMapping("/view.do")
	public String view(Model model, int no, int inc) {
		model.addAttribute("vo", service.view(no, inc));
		return MODULE_NAME + "/view";
	}

	// 게시판 글쓰기폼 이동
	@GetMapping("/write.do")
	public String writeForm() {
		return MODULE_NAME + "/write";
	}

	// 게시판 글쓰기 - 제목,내용,작성자,비밀번호
	@PostMapping("/write.do")
	public String write(BoardVO vo) {
		service.write(vo);
		return "redirect:list.do";
	}

	// 게시판 글수정폼 이동
	@GetMapping("/update.do")
	public String updateForm(Model model, int no, int inc) {
		model.addAttribute("vo", service.view(no, inc));
		return MODULE_NAME + "/update";
	}

	// 게시판 글수정 - 글번호:확인용,제목,내용,작성자,비밀번호:확인용
	@PostMapping("/update.do")
	public String update(BoardVO vo, PageObject pageObject) throws Exception{
		int result = service.update(vo);
		
		// 검색어의한글처리 --> 검색어가 null이면 null이 아닌 ""로 만듬
		if (pageObject.getWord() == null) {
			pageObject.setWord("");
		}
		
		if(result == 1) {
			// 정상적인 글수정 처리 후 게시판 글보기로 자동 이동시킨다.
			return "redirect:view.do?no=" + vo.getNo() + "&inc=0" 
			+ "&page=" + pageObject.getPage() 
			+ "&parPageNum=" + pageObject.getPerGroupPageNum() 
			+ "&key=" + pageObject.getKey() 
			+ "&word=" + URLEncoder.encode(pageObject.getWord(), "utf-8")
			;
		}
		// 수정이 안된 경우 비밀번호가 틀린 경우이므로 입력정보 오류 페이지로 자동 이동시킨다.
		System.out.println("수정 실패");
		return "redirect:list.do";
		
		
		


	}

	// 게시판 글삭제 - 글번호, 비밀번호:확인용
	@PostMapping("/delete.do")
	public String delete(int no, String pw) throws Exception {
		service.delete(no, pw);
		return "redirect:list.do";
	}

}
