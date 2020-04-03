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

	@Override
	public List<BoardVO> allBoardList(Criteria cri) {
		return bMapper.getReviewList();
	}

	@Override
	public int totalBoardCount(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> reviewList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> companyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> freeBoardList() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
