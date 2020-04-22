package org.adt.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;

public interface BoardService {
	
	//게시판전체목록
	public List<BoardVO> getList(Criteria cri);
	
	//특정 게시글 조회
	public BoardVO get(Long bno);
	
	// 쿠키 체크 후 조회수 추가
	public void checkCookie(HttpServletResponse response, HttpServletRequest request, Long bno);
	
	public void addclick(long bno);
	
	//게시판 전체 갯수
	public int getTotal(Criteria cri);
	
	//게시판글작성
	public int Insert(BoardVO board);

	//글삭제
	public boolean delete(Long bno);
	
	//글수정
	public boolean update(BoardVO board);

}