package org.adt.domain;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int total;
	private Criteria cri;
	
	
	//생성자에서 초기값 할당
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)((Math.ceil(cri.getPageNum() /10.0)) * 10);
		this.startPage = this.endPage - 9;
		
		
		int realEnd = 0;
		int number = (int)(total / cri.getAmount());
		
		if(number == 1) {
			realEnd = number;
		} else {
			realEnd = number+1;
		}
		
		//int realEnd = (int)(total / cri.getAmount())+1;
		if(realEnd < endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
