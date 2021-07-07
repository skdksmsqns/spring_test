package com.webjjang.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webjjang.board.mapper.BoardMapper;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.util.PageObject;

@Service
public class BoardService {

	@Inject
	private BoardMapper mapper;

	// 검색 게시판 리스트
	public List<BoardVO> list(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getCount(pageObject));
		System.out.println("BoardService:list:TotalRow="+mapper.getCount(pageObject));
		System.out.println("BoardService:list:pageObject="+pageObject);
		return mapper.list(pageObject);
	}

	// 검색 게시판 글보기
	public BoardVO view(int no, int inc) {
		if (inc == 1) {
			mapper.increas(no);
		}
		return mapper.view(no);
	}

	// 글쓰기
	public int write(BoardVO vo) {
		return mapper.write(vo);
	}

	// 글수정
	public int update(BoardVO vo) throws Exception {
		return mapper.update(vo);
	}

	// 글삭제
	public int delete(int no, String pw) throws Exception {
		return mapper.delete(no,pw);
	}

}
