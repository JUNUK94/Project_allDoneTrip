package org.adt.domain;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long b_Type;
	private String bType_Name; 
	private Long member_No; 
	private Long bno; 
	private String title; 
	private String b_content; 
	private Long b_clickNum; 
	private Long b_Like; 
	
	private String regdate; 
	private String updatedate; 
	private String planner_OX;  // 플래너 유무 Y,N

}
