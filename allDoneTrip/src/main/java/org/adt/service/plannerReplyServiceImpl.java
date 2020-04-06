package org.adt.service;

import java.util.List;

import org.adt.domain.PlannerReplyVO;
import org.adt.mapper.PlannerMapper;
import org.adt.mapper.PlannerReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class plannerReplyServiceImpl implements plannerReplyService{

	@Autowired
	private PlannerReplyMapper replyMapper;
	
	// 플래너 댓글 등록하기	
	@Override
	public void replyWrite(PlannerReplyVO prvo) {
		replyMapper.replyWrite(prvo);
	}

	// 플래너 대댓글 등록하기
	@Override
	public void reReplyWrite(PlannerReplyVO prvo) {
		replyMapper.reReplyWrite(prvo);
	}

	// 플래너 댓글 가져오기
	@Override
	public List<PlannerReplyVO> getReplyList(Long plan_No) {
		return replyMapper.getReplyList(plan_No);
	}
	
	// 플래너 대댓글 가져오기
	@Override
	public List<PlannerReplyVO> getReReplyList(Long plan_No){
		return replyMapper.getReReplyList(plan_No);
	}

	// 플래너 댓글 전체 갯수 카운트
	@Override
	public int totalReplyCount(Long plan_No) {
		return replyMapper.totalReplyCount(plan_No);
	}

	// 플래너 댓글 삭제
	@Override
	public boolean replyDelete(PlannerReplyVO prvo) {
		try {
			replyMapper.replyDelete(prvo);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	
	
}
