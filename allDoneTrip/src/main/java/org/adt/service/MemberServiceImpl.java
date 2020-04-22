package org.adt.service;

import org.adt.domain.MemberVO;
import org.adt.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mMapper;
	
	@Override
	public void join(MemberVO member) {
		// TODO Auto-generated method stub
		mMapper.join(member);
	}

	@Override
	public boolean emailCheck(String email) {
		// TODO Auto-generated method stub
		int count = Integer.parseInt(mMapper.emailCheck(email));
		if(count == 0) {
			return true;
		}else {
			return false;
		}	
	}

	@Override
	public boolean nick_NameCheck(String nick_Name) {
		// TODO Auto-generated method stub
		int count = Integer.parseInt(mMapper.nick_NameCheck(nick_Name));
		if(count == 0) {
			return true;
		}else {
			return false;
		}	
	}

	@Override
	public boolean loginCheck(MemberVO member) {
		// TODO Auto-generated method stub
		log.info("cnt");
		int count = Integer.parseInt(mMapper.loginCheck(member));
		log.info(count);
		if(count == 1) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public String idSearch(String name, int phone_Num) {
		// TODO Auto-generated method stub
		String searchEmail = mMapper.idSearch(name, phone_Num);
		
		return searchEmail;
	}
	
	@Override
	public String pwSearch(String email, int phone_Num) {
		// TODO Auto-generated method stub
		String searchPassword = mMapper.pwSearch(email, phone_Num);
		
		return searchPassword;
	}

	
	
	
}
