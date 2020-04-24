package org.adt.service;

import org.adt.domain.MemberVO;

public interface MemberService {
	
	public void join(MemberVO member);
	
	public String idSearch(String name, int phone_Num);
	public String pwSearch(String email, int phone_Num);
	public boolean emailCheck(String email);
	public boolean nick_NameCheck(String nick_name);
	public boolean loginCheck(MemberVO member);
	public String nick(String email);
	public String profile(String email);

}
