package org.adt.domain;

import lombok.Data;

@Data
public class CityDTO {

	private Long CITY_NO;		//도시num
	private String CITY_NAME;		//도시
	private int COUNTRY_NO;		//국가num
	private String COUNTRY_NAME;	//국가
	private int CONTI_NO;		//대륙 num
	private String CONTI_NAME;			//대륙
}
