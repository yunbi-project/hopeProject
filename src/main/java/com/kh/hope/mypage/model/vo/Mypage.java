package com.kh.hope.mypage.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Mypage {
	
	// 기부 (donate)
	private String puserName;
	private int productAmount;
	private Date productDate;
	private String categoryName;
	
	// 봉사활동 (program)
	// 즐겨찾기 (bookmark)
	private String programName;
	private Date programActivityStartDate;
	private Date programActivityEndDate;
	
	
}

