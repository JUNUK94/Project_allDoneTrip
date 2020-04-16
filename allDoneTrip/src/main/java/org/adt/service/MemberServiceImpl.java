package org.adt.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.adt.domain.MemberVO;
import org.adt.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

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
	
	
	
	
	
}
