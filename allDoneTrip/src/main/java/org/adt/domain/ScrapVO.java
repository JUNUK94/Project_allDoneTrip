package org.adt.domain;

import lombok.Data;

@Data
public class ScrapVO {
	
	private long sno;
	private long plan_No;
	private Long bno;
	private String email;
	private boolean status;
	private String scrap_Date;
	
}
