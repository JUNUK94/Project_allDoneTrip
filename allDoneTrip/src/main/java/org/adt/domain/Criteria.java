package org.adt.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
	private int amount;

	private String sortType;
	private String type;
	private String keyword;
	
	
	//현재 페이지 정보
	public Criteria() {
		this.pageNum = 1;
		this.amount = 1;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
}
