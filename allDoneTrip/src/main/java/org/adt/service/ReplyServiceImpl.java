package org.adt.service;

import java.util.List;

import org.adt.domain.ReplyVO;
import org.adt.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;

	// 플래너 댓글 등록하기
	@Override
	public void replyWrite(ReplyVO bno) {
		replyMapper.replyWrite(bno);
	}

	// 플래너 대댓글 등록하기
	@Override
	public void reReplyWrite(ReplyVO bno) {
		replyMapper.reReplyWrite(bno);
	}

	// 플래너 댓글 가져오기
	@Override
	public List<ReplyVO> getReplyList(Long bno) {
		return replyMapper.getReplyList(bno);
	}

	// 플래너 대댓글 가져오기
	@Override
	public List<ReplyVO> getReReplyList(Long bno) {
		return replyMapper.getReReplyList(bno);
	}

	// 플래너 댓글 전체 갯수 카운트
	@Override
	public int totalReplyCnt(Long bno) {
		return replyMapper.totalReplyCnt(bno);
	}

	// 플래너 댓글 삭제
	@Override
	public boolean replyDelete(ReplyVO rvo) {
		try {
			replyMapper.replyDelete(rvo);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
