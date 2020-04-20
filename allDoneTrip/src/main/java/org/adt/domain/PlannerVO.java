package org.adt.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PlannerVO {
	
	  private Long plan_No;
	  private String email;
	  private String nick_Name;
	  private String p_Title;
	  private String p_Content;
	  private String city_Name;
	  private int city_No;
	  private String startDay;
	  private String endDay;
	  private String trip_Period;
	  private Long plan_Like;
	  private Long click_Num;
	  private int status;
	  
	  private String p_Thumbnail;
	  private String regdate;
	  private String updateDate;
	  
	  private Long like_No;
}
