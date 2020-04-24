package org.adt.domain;

public class MemberVO {
	
	public Long getMember_No() {
		return member_No;
	}
	public void setMember_No(Long member_No) {
		this.member_No = member_No;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick_Name() {
		return nick_Name;
	}
	public void setNick_Name(String nick_Name) {
		this.nick_Name = nick_Name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMobile_Co() {
		return mobile_Co;
	}
	public void setMobile_Co(String mobile_Co) {
		this.mobile_Co = mobile_Co;
	}
	public int getPhone_Num() {
		return phone_Num;
	}
	public void setPhone_Num(int phone_Num) {
		this.phone_Num = phone_Num;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getJoin_Date() {
		return join_Date;
	}
	public void setJoin_Date(String join_Date) {
		this.join_Date = join_Date;
	}
	public String getSignOut_Date() {
		return signOut_Date;
	}
	public void setSignOut_Date(String signOut_Date) {
		this.signOut_Date = signOut_Date;
	}
	public String getAgree_Date() {
		return agree_Date;
	}
	public void setAgree_Date(String agree_Date) {
		this.agree_Date = agree_Date;
	}
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
