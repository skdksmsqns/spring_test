package com.webjjang.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.webjjang.board.vo.BoardVO;
import com.webjjang.util.PageObject;

public interface BoardMapper {
	
	// 게시판 리스트
	public List<BoardVO> list(PageObject pageObject);

	// 전체 데이터를 가져오는 메서도
	public int getCount(PageObject pageObject);
	
	//게시판 글 상세보기
	public BoardVO view(int no);

	//조회수 1 증가
	public void increas(int no);
	
	//게시판 글쓰기
	public int write(BoardVO vo);
	
	//게시판 글수정
	public int update(BoardVO vo);
	
	//게시판 글삭제
	public int delete(@Param("no") int no, @Param("pw") String pw);


	
	
}
