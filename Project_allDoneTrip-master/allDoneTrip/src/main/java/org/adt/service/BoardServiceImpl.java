package org.adt.service;

import java.util.List;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;
import org.adt.domain.PageDTO;
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

	//게시판전체목록 가져오기
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return bMapper.getBoardList(cri);
	}
	
	//특정 게시글 조회
	@Override
	public BoardVO get(Long bno) {
		return bMapper.read(bno);
	}
		
	//게시판 전체 갯수
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return bMapper.getTotalCount(cri);
	}

	//게시판글작성
	@Override
	public int Insert(BoardVO board) {
		// TODO Auto-generated method stub
		return bMapper.reviewInsert(board);
	}
		
	//글수정
	@Override
	public boolean update(BoardVO board) {
		return false;
	}
		
	//글삭제
	@Override
	public boolean delete(Long bno) {
		return false;
	}
}