package org.adt.service;

import java.util.HashMap;

import org.adt.domain.MemberVO;

public interface MemberService {
	
	public void join(MemberVO member);
	

	public boolean emailCheck(String email);
	public boolean nick_NameCheck(String nick_name);
	public boolean loginCheck(MemberVO member);

}
