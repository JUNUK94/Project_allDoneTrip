package org.adt.service;

import java.util.List;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;
import org.adt.domain.MemberVO;
import org.adt.domain.PlannerVO;

public interface MypageService {
	
	//내가 쓴 게시글 전체 가져오기(게시판별로)
	public List<BoardVO> getMyBoard(Criteria cri);
	
	//내가 쓴 게시글 보기
	public List<BoardVO> readMyBoard(Long bno);
	
	//플래너 전체 목록 가져오기
	public List<PlannerVO> getMyPlanner(Criteria cri);
	
	//내가 쓴 플래너 보기
	public List<PlannerVO> readMyPlanner(Long plan_No);
	
	//내가 스크랩한  플래너 가져오기
	public List<PlannerVO> getMyScrapPlanner(PlannerVO pvo);
	
	//내가 스크랩한 플래너보기
	public List<PlannerVO> scrapMyPlanner(Long plan_No);
	
	//내가 스크랩한 게시판 가져오기
	public List<BoardVO> getMyScrapBoard(BoardVO board);
	
	//내가 스크랩한 게시판보기
	public List<BoardVO> scrapMyBoard(Long bno);
	
	//회원 정보 수정
	public boolean memberInfoUpdate(MemberVO member);
	
	//회원탈퇴
	public int memberDelete(Long member_No);
	
	//회원정보 가지고오기
	public List<MemberVO> memberInfo(String email);
}
