package org.adt.service;

import java.util.HashMap;

import org.adt.domain.MemberVO;

public interface MemberService {
	
	public void join(MemberVO member);
	
	public String getAccessToken (String authorize_code);
	public HashMap<String, Object> getUserInfo (String access_Token);
	public void kakaoLogout(String access_Token);
	public boolean emailCheck(String email);
	public boolean nick_NameCheck(String nick_name);
	public boolean loginCheck(MemberVO member);

}
