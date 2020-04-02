package org.adt.mapper;

import java.util.List;

import org.adt.domain.Criteria;
import org.adt.domain.PlannerVO;

public interface PlannerMapper {

	// 플래너 리스트 가져오기
	public List<PlannerVO> getList(Criteria cri);

	// 플래너 전체 갯수 카운트
	public int totalCount(Criteria cri);

	// 플래너 정렬
	public List<PlannerVO> sorting(Criteria cri);

	// 조회수 추가
	public void addClickNum(Long plan_No);

	// 플래너 정보 가져오기
	public PlannerVO getContent(Long plan_No);

	// 플래너 저장
	public void insert(PlannerVO pvo);

	// 플래너 수정
	public void update(PlannerVO pvo);

	// 플래너 삭제
	public void delete(Long plan_No);
}