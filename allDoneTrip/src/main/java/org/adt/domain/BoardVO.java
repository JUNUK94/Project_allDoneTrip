package org.adt.domain;

import lombok.Data;

@Data
public class BoardVO {

	private int b_Type;
	private String bType_Name;
	private int member_No;
	private int bno;
	private String title;
	private String b_content;
	private int b_clickNum;
	private int b_Like;
	private String regdate;
	private String updatedate;
	private Boolean planner_OX; //플래너 유무 Y,N
}
