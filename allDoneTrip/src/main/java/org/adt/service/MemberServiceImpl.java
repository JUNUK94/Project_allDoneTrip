package org.adt.service;

import org.adt.domain.MemberVO;
import org.adt.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mMapper;
	
	@Override
	public void join(MemberVO member) {
		// TODO Auto-generated method stub
		mMapper.join(member);
	}
	
}
