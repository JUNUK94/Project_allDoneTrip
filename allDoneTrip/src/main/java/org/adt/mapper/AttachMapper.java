package org.adt.mapper;

import java.util.List;

import org.adt.domain.AttachVO;

public interface AttachMapper {
	  
	  //게시판첨부파일 추가
      public void boardInsert(AttachVO vo);
      
      
      //게시글번호로 첨부파일 찾기
      public List<AttachVO> findByBno(Long bno);
      
      //회원정보첨부파일 추가
      public void memberInsert(AttachVO vo);
      
      
      //회원번호로 첨부파일 찾기
      public List<AttachVO> fineByMember_No(Long member_No);
      
    //게시판,회원프로필 첨부파일 삭제
      public void Delete(String uuid); //uuid가 pk라서 따로 구분 안함.
      
}
