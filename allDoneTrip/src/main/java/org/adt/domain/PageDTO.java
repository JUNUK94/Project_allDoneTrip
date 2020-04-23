package org.adt.domain;

import lombok.Data;

@Data
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int total;
	private Criteria cri;

	// 페이징 처리
	public PageDTO(Criteria cri, int total) {

		this.cri = cri;
		this.total = total;

		this.endPage = (int) ((Math.ceil(cri.getPageNum() / 10.0)) * 10);
		this.startPage = this.endPage - 9;

		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

//		int number = (int) (total / cri.getAmount());
//		int realEnd = 0;
//
//		if (number == 1) {
//			realEnd = number;
//		} else {
//			realEnd = number + 1;
//		}

		if (realEnd < endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

}
