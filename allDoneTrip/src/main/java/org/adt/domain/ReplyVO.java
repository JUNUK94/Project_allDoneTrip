package org.adt.domain;

import lombok.Data;

@Data
public class ReplyVO {

	private Long b_Type;
	private Long bno;
	private Long rno;
	private String r_Content;
	private String nick_Name;
	private String email;
	private String regdate;
	private String updatedate;
	private Long up_Rno;

}
