package org.adt.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PlannerVO {
	
	  private Long plan_No;
	  private String nick_Name;
	  private String p_Title;
	  private String p_Content;
	  private String city_Name;
	  private String trip_Period;
	  private Long plan_Like;
	  private Long click_Num;
	  
	  private Date regdate;
	  private Date updateDate;
	  
}
