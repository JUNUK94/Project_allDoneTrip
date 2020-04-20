package org.adt.service;

import java.util.List;

import org.adt.domain.CityVO;
import org.adt.mapper.CityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class CityServiceImpl implements CityService{

	@Autowired
	private CityMapper cmapper;
	
	//매퍼
	private static String namespace = "org.adt.mapper.CityMapper";
	
	//리스트 가져오기
	@Override
	public List<CityVO> getList() {
		// TODO Auto-generated method stub
		
		System.out.println("city getlist....");
		return cmapper.getList();
	}

	@Override
	public List<CityVO> read(int spot_No) {
		// TODO Auto-generated method stub
		
		System.out.println("readdddddddddddddddddddd");
		return cmapper.read(spot_No);
	}

	@Override
	public List<CityVO> list() {
		// TODO Auto-generated method stub
		System.out.println("listlistlist");
		return cmapper.read(1);
	}

	//목록
	/*
	@Override
	public List<CityVO> list() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("abc");
		return cmapper.list();
	}*/





}
