package org.adt.domain;

import lombok.Data;

@Data
public class CityVO {

	public int city_No;		//도시num
	public String city_Name;		//도시
	public int country_No;		//국가num
	public String country_Name;	//국가
	public int conti_No;		//대륙 num
	public String conti_Name;			//대륙
	
	//관광지
	//private int city_No;	
	public int spot_No;	//명소 num
	public String spot_Name;	//명소이름
	public String t_Latitude;	//위도
	public String t_Longitude;	//경도
	public String t_Content;	//도시 자세한설명
	public String t_Picture;	//사진경로
	public int t_tel;	//도시전화번호 + null값도 포함
	public String address;	//도시주소
	public String t_Explan;	//도시 간단설명

	//식당 restaurant
	//public int city_No;		//도시번호
	public int res_No;	//식당 번호
	public String res_Name;	//식당 이름
	public String res_Content;	//식당설명
	public String res_Picture;	//사진경로
	public int res_pno;	//사진 no
	public String res_Tel;	//식당 전화번호
	public String res_address;
	public String res_summary;	//레스트랑 요약
	
	//쇼핑 shop
	//public int city_No;		//도시번호
	public int shop_No;		//쇼핑 NUMBER
	public String shop_Name;	//쇼핑이름
	public String s_Content;	//설명
	public int s_Picture;		//사진 경로
	public int s_pno;	//사진경로no
	public String s_address;	//주소
	public String shop_Summary;	//요약


}
