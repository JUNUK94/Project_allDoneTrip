package org.adt.mapper;

import java.util.List;


import org.adt.domain.Criteria;

import org.adt.domain.PlannerVO;

public interface PlannerMapper {


	public List<PlannerVO> getList();

	// 플래너 리스트 가져오기
	public List<PlannerVO> getList(Criteria cri);

	// 플래너 전체 갯수 카운트
	public int totalCount(Criteria cri);

	// 조회수 추가
	public void addClickNum(Long plan_No);

	// 좋아요 사전 클릭한 유저인지 판별
	public int check_User(PlannerVO pvo);
	
	// 좋아요 체크한 유저 등록
	public void addLike_insertUser(PlannerVO pvo);
	
	// 좋아요 추가
	public void addLike(PlannerVO pvo);
	
	// 플래너 정보 가져오기
	public List<PlannerVO> getPlanner(Long plan_No);

	// 플래너 저장
	public void insert(PlannerVO pvo);

	// 플래너 수정
	public void update(PlannerVO pvo);

	// 플래너 삭제
	public void delete(Long plan_No);

}
