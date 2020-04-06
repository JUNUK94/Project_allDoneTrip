package org.adt.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PlannerReplyVO {
	
	  private Long plan_No;
	  private Long p_Rno;
	  private String nick_Name;
	  private String email;
	  private String pr_Content;
	  private String regdate;
	  private String updateDate;
	  private Long up_Prno;
}
