package org.adt.mapper;

import java.util.List;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;
import org.adt.domain.PlannerVO;

public interface BoardMapper {
	
	//게시판전체목록 가져오기
	public List<BoardVO> getList(Criteria cri);
	
	//전체게시판 페이징 처리
	public int boardPaging(Criteria cri);

	//후기게시판 페이징처리
	public int reviewWithPaging(Criteria cri);
	
	//동행찾기 페이징처리
	public int friendWithPaging(Criteria cri);
	
	//자유게시판 페이징처리
	public int freeWithPaging(Criteria cri);
	
	// 조회수 추가
	public void addBclickNum(Long bno);
	
	// 좋아요 추가
	public void addLike(Long bno);
	
	
	//게시판글작성
	public void reviewInsert(BoardVO board);
	
	public void reviewInsertSelectKey(BoardVO board);
	
	
	
	//글검색
	public BoardVO read(Long bno);
	
	//글삭제
	public int delete(Long bno);
	
	//글수정
	public int update(BoardVO board);
	

}
