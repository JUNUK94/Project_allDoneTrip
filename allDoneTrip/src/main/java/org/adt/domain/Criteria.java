package org.adt.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
	private int amount;

	private String sortType;
	private String type;
	private String keyword;
	private int b_Type;
	
	
	//페이징 처리 관련
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
}
