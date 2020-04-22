package org.adt.domain;

import lombok.Data;

@Data
public class MemberVO {
	
	private Long member_No;
	private String email;
	private String nick_Name;
	private String name;
	private String pw;
	private int birth;
	private String gender;
	private String  mobile_Co; //통신사
	private int phone_Num;
	
	private String profile;		//프로필사진 경로
	private String introduce;	//자기소개
	
	private String join_Date; //가입일
	private String signOut_Date; //탈퇴일
	private String agree_Date; //약간동의일자
	
}
