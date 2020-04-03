package org.adt.service;

import java.util.List;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;

public interface BoardService {
	
	//모든 게시판 글 가져오기
	public List<BoardVO> allBoardList(Criteria cri);
	
	//모든 게시판 글 갯수 구하기
	public int totalBoardCount(Criteria cri);

	//여행후기 게시판 글 가져오기
	public List<BoardVO> reviewList();
	
	//동행찾기 게시판 글 가져오기
	public List<BoardVO> companyList();
	
	//자유 게시판 글 가져오기
	public List<BoardVO> freeBoardList(); 
}
