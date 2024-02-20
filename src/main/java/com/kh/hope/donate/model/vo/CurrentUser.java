package com.kh.hope.donate.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CurrentUser {
	private int rowNum;
	private int donateAmount;
	private String optionalText;
	private String donateDate; 
	
}
