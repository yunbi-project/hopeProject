package com.kh.hope.board.model.vo;

import java.util.List;

import com.kh.hope.attachment.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardExt extends Board{
	
	private List<Attachment> imgList;
	
	private String userName;
	private String originName;

}
