package org.adt.service;

import java.util.List;

import org.adt.domain.PlannerReplyVO;

public interface plannerReplyService {

	// 플래너 댓글 등록하기
	public void replyWrite(PlannerReplyVO prvo);
	
	// 플래너 대댓글 등록하기
	public void reReplyWrite(PlannerReplyVO prvo);
	
	// 플래너 댓글 가져오기
	public List<PlannerReplyVO> getReplyList(Long plan_No);
	
	// 플래너 대댓글 가져오기
	public List<PlannerReplyVO> getReReplyList(Long plan_No);
	
	// 플래너 댓글 전체 갯수 카운트
	public int totalReplyCount(Long plan_No);
	
	// 플래너 댓글 삭제
	public boolean replyDelete(PlannerReplyVO prvo);
}
