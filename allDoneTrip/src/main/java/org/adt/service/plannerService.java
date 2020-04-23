package org.adt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adt.domain.PlannerVO;
import org.adt.domain.ScrapVO;
import org.adt.domain.Criteria;

public interface plannerService {

	// 플래너 리스트 가져오기
	public List<PlannerVO> getList(Criteria cri);

	// 플래너 전체 갯수 카운트
	public int totalCount(Criteria cri);

	// 쿠키 체크 후 조회수 추가
	public void checkCookie(HttpServletResponse response, HttpServletRequest request, Long plan_No);

	// 좋아요 사전 체크여부 판별 후 좋아요 추가
	public boolean addLike_afterCheck(PlannerVO pvo);

	// 좋아요 사전 클릭한 유저인지 판별
	public boolean check_User(PlannerVO pvo);
	
	// 플래너 정보 가져오기
	public List<PlannerVO> getPlanner(Long plan_No);

	// 플래너 저장
	public long save(PlannerVO pvo);

	// 플래너 수정
	public void update(PlannerVO pvo);
	
	// 플래너 삭제
	public void delete(Long plan_No);
	
	// 로그인한 유저의 플래너 리스트 가져오기
	public List<PlannerVO> getUsersPlanner(String email);
	
	// 추천순으로  플래너 리스트 가져오기
	public List<PlannerVO> get_Popular_PlannerList();
	
	// 플래너 스크랩 상태 여부 카운트
	public boolean checkScrap(ScrapVO scvo);
	
	// 플래너 스크랩 삽입
	public void insertScrap(ScrapVO scvo);

	// 플래너 스크랩 삭제
	public void deleteScrap(ScrapVO scvo);

}
