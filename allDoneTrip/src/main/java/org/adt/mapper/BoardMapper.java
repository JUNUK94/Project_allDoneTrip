package org.adt.mapper;

import java.util.List;

import org.adt.domain.BoardVO;

public interface BoardMapper {
	
	//후기전체목록 가져오기
	public List<BoardVO> getReviewList();
	
	//후기작성
	public void reviewInsert(BoardVO board);
	
	public void reviewInsertSelectKey(BoardVO board);
	
	//후기검색
	public BoardVO reviewRead(Long bno);
	
	//후기삭제
	public int reviewDelete(Long bno);
	
	//후기수정
	public int reviewUpdate(BoardVO board);
	

}
