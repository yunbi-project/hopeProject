
package com.kh.hope.program.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Request {
	private int requestNo;
	private String requestDate;
	private String status;
	private int userNo;
	private int programNo;
}
