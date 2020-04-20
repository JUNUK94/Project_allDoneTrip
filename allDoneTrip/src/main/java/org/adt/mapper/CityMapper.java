package org.adt.mapper;

import java.util.List;

import org.adt.domain.CityVO;


public interface CityMapper {

	public List<CityVO> getList();//도시출력
	
	public List<CityVO> read(int spot_No);//관광지명소
	
	public List<CityVO> list();

	//public List<CityVO> list() throws Exception;	//목록

}
