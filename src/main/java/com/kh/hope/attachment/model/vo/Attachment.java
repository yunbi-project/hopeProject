package com.kh.hope.attachment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Attachment {
	
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int  refFno;
	private String fileType;
	private Date createDate;
	private String status;
	private int imgLevel;
}
