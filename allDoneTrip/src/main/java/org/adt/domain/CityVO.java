package org.adt.domain;

import lombok.Data;

@Data
public class CityVO {

	private int city_No;		//도시num
	private String city_Name;		//도시
	private int country_No;		//국가num
	private String country_Name;	//국가
	private int conti_No;		//대륙 num
	private String conti_Name;			//대륙
	
	//관광지
	//private Long city_No;	
	private int spot_No;	//명소 num
	private String spot_Name;	//명소이름
	private String t_Latitude;	//위도
	private String t_Longitude;	//경도
	private String t_Content;	//도시 자세한설명
	private String t_Picture;	//사진경로
	private int t_tel;	//도시전화번호 + null값도 포함
	private String address;	//도시주소
	private String t_Explan;	//도시 간단설명




}
