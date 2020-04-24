package org.adt.mapper;

import org.adt.domain.MemberVO;
import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
		//회원가입
		public void join(MemberVO member);
	   
		public String idSearch(@Param("name") String name,@Param("phone_Num") int phone_Num);
		public String pwSearch(@Param("email") String email,@Param("phone_Num") int phone_Num);
		public String emailCheck(String email);
		public String nick_NameCheck(String nick_Name);
		public String phoneNumberCheck(String phone_num);
		public String loginCheck(MemberVO member);
		public String nick(String email);
		public String profile(String email);
		//회원탈퇴
		public int delete(Long member_No);
		
}
