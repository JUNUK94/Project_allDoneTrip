package org.adt.mapper;

import java.util.List;

import org.adt.domain.ReplyVO;

public interface ReplyMapper {
	
	// 게시판 댓글 등록하기
	public void replyInsert(ReplyVO rvo);
	
	// 게시판 대댓글 등록하기
	public void reReplyInsert(ReplyVO rvo);
	
	// 게시판 댓글 가져오기
	public List<ReplyVO> getReplyList(Long rno);
	
	// 게시판 대댓글 가져오기
	public List<ReplyVO> getReReplyList(Long rno);
	
	// 게시판 댓글 전체 갯수 카운트
	public int totalReplyCnt(Long rno);
	
	// 게시판 댓글 삭제
	public void replyDelete(ReplyVO rvo);
	

}
