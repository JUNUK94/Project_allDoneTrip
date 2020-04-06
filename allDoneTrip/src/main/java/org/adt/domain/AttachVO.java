package org.adt.domain;

import lombok.Data;

@Data
public class AttachVO {

	private int attach_Type; //후기 2, 동행찾기 3,자유 4, 회원 5
	private String type_Name;
	private String uuid;
	private String upload_Path;
	private String file_Name;
	private boolean file_Type;
	
	private Long member_No; 
	private Long bno;
}
