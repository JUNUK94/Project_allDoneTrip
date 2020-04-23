package org.adt.service;

import java.util.List;

import org.adt.domain.ReplyVO;

public interface ReplyService {

	// 게시판 댓글 등록하기
	public void replyWrite(ReplyVO rno);

	// 게시판 대댓글 등록하기
	public void reReplyWrite(ReplyVO rno);

	// 게시판 댓글 가져오기
	public List<ReplyVO> getReplyList(Long bno);

	// 게시판 대댓글 가져오기
	public List<ReplyVO> getReReplyList(Long bno);

	// 게시판 댓글 전체 갯수 카운트
	public int totalReplyCnt(Long bno);

	// 게시판 댓글 삭제
	public boolean replyDelete(ReplyVO bno);
}
