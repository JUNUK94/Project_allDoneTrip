package org.adt.service;

import java.util.List;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;
import org.adt.domain.MemberVO;
import org.adt.domain.PlannerVO;
import org.adt.mapper.MypageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageMapper mypageM;

	@Override
	public boolean memberInfoUpdate(MemberVO member) {
		// TODO Auto-generated method stub
		return mypageM.memberInfoUpdate(member) == 1;
	}

	@Override
	public List<BoardVO> getMyBoard(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> readMyBoard(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlannerVO> getMyPlanner(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlannerVO> readMyPlanner(Long plan_No) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int memberDelete(Long member_No) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberVO> memberInfo(String email) {
		// TODO Auto-generated method stub
		
		
		return mypageM.memberInfo(email);
	}

	@Override
	public List<PlannerVO> getMyScrapPlanner(PlannerVO pvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlannerVO> scrapMyPlanner(Long plan_No) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> getMyScrapBoard(BoardVO board) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> scrapMyBoard(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
