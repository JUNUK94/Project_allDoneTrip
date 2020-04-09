package org.adt.mapper;

import org.adt.domain.MemberVO;

public interface MemberMapper {
	//회원가입
	   public void join(MemberVO member);
	   
	   
	//회원탈퇴
	   public int delete(Long member_No);
}
