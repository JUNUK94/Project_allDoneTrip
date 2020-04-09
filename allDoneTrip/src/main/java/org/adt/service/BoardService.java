package org.adt.service;

import java.util.List;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;

public interface BoardService {
	
	//게시판전체목록 가져오기
	public List<BoardVO> getList(Criteria cri);
	
	//특정 게시글 조회
	public BoardVO get(Long bno);
	
	//게시판 전체 갯수
	public int getTotal(Criteria cri);
	
	
	//게시판글작성
	public void Insert(BoardVO board);

	//글삭제
	public int delete(Long bno);
	
	//글수정
	public int update(BoardVO board);
}