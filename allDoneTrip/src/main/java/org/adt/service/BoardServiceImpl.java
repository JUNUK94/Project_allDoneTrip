package org.adt.service;

import java.util.List;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;
import org.adt.domain.PlannerVO;
import org.adt.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper bMapper;

	//게시판 전체 리스트 출
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return bMapper.getList(cri);
	}
	
	//게시판 전체 페이징 처
	@Override
	public int boardPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return bMapper.boardPaging(cri);
	}

	//리뷰게시판 페이징
	@Override
	public int reviewWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return bMapper.reviewWithPaging(cri);
	}

	//동행게시판 페이징
	@Override
	public int friendWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return bMapper.friendWithPaging(cri);
	}

	//자유게시판 페이징
	@Override
	public int freeWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return bMapper.freeWithPaging(cri);
	}

	@Override
	public void reviewInsert(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reviewInsertSelectKey(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO read(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Long bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BoardVO board) {
		// TODO Auto-generated method stub
		return 0;
	}



	
}
