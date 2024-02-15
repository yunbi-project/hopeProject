package com.kh.hope.mypage.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Mypage {
	
	private String puserName;
	private int productAmount;
	private Date productDate;
	private String categoryName;
	

}
