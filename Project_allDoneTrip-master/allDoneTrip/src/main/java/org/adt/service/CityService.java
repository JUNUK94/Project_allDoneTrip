package org.adt.service;

import java.util.List;

import org.adt.domain.CityVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public interface CityService {
	
	
	public List<CityVO> getList();

	public List<CityVO> read(int spot_No);//관광지명소

	public List<CityVO> list();

	public List<CityVO> foodlist();	//식당 출력
	
	public List<CityVO> shoplist();	//쇼핑 출력

	
}
