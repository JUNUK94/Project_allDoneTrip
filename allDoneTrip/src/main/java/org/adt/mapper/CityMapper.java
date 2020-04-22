package org.adt.mapper;

import java.util.List;

import org.adt.domain.CityVO;
import org.adt.domain.PlannerVO;


public interface CityMapper {

	public List<CityVO> getList();//도시출력
	
	public List<CityVO> read(int spot_No);//관광지명소
	
	public List<CityVO> list();

	public List<CityVO> foodlist();	//식당 출력
	
	public List<CityVO> shoplist();	//쇼핑 출력
	//public List<CityVO> list() throws Exception;	//목록

}
