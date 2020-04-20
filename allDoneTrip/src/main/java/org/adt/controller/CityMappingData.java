package org.adt.controller;

import java.util.ArrayList;
import java.util.List;

import org.adt.domain.CityVO;
import org.adt.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
@Controller
public class CityMappingData {
	@Autowired
	private CityService cservice;
	
	static CityMappingData mCityMappingData;
	public static CityMappingData getInstance() {
		if(mCityMappingData ==null)
		{
			mCityMappingData = new CityMappingData();
		}
		return mCityMappingData;
	}
	
	static List<CityVO> mCityData;	
	static List<CityVO> mFOODData;
	
	public CityMappingData() {
		// TODO Auto-generated constructor stub
		mCityData = new ArrayList<CityVO>();
		mFOODData = new ArrayList<CityVO>();
	}

	List<CityVO> getCityData(){
		return mCityData;
	}
	
	public CityVO getCityData(int city_No, int spot_No){
		for(int i=0; i<mCityData.size(); i++)
		{
			if(mCityData.get(i).spot_No == spot_No)
			{
				return mCityData.get(i);
			}
		}
		return null;
	}
	public CityVO getFOODData(int city_No, int res_No){
		System.out.println(" city_No : .... food " +  city_No);
		System.out.println(" res_No : .... food " +  res_No);
		System.out.println(" mFOODData.size() : .... food " +  mFOODData.size());
		for(int i=0; i<mFOODData.size(); i++)
		{
			if(mFOODData.get(i).res_No == res_No)
			{
				return mFOODData.get(i);
			}
		}
		return null;
	}
	
	
	public void setCityData(List<CityVO> mCityVo)
	{
		mCityData = mCityVo;
		System.out.println("setCityData setting ON");
	}
	
	public void setFOODData(List<CityVO> mFOODVo)
	{
		mFOODData = mFOODVo;
		System.out.println("setFOODData setting ON");
	}
	
}
