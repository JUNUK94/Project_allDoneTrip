package org.adt.mapper;

import org.adt.domain.MemberVO;

public interface MemberMapper {
		//회원가입
		public void join(MemberVO member);
	   

		public String emailCheck(String email);
		public String nick_NameCheck(String nick_Name);
		public String phoneNumberCheck(String phone_num);
		public String loginCheck(MemberVO member);

		//회원탈퇴
		public int delete(Long member_No);
		
}
