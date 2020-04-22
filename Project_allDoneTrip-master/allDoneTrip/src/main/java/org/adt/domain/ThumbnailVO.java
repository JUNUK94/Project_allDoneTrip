package org.adt.domain;

import lombok.Data;

@Data
public class ThumbnailVO {
	
	private Long plan_No; 
	private Long member_No; 
	private Long bno;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
}
