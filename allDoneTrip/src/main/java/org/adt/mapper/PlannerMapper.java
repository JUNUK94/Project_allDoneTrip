package org.adt.mapper;

import java.util.List;

import org.adt.domain.Criteria;
import org.adt.domain.PlannerVO;

public interface PlannerMapper {

	//플래너 리스트 가져오기
	public List<PlannerVO> getList(Criteria cri);
	
	//게시글 전체 갯수 카운트
	public int totalCount(Criteria cri);

	//게시글 전체 정렬
	public List<PlannerVO> sorting(Criteria cri);
	
}
