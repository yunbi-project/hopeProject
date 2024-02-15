package com.kh.hope.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	
	private int productNo;
	private String productType;
	private String puserName;
	private String phone;
	private String email;
	private String productWay;
	private int productAmount;
	private String receipt;
	private String businessNum;
	private String residentNum;
	private String status;
	private Date productDate;
	private int categoryNo;

}