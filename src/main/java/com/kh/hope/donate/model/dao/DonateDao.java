package com.kh.hope.donate.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.donate.model.vo.CurrentUser;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.donate.model.vo.DonateTag;
import com.kh.hope.payment.model.vo.PaymentInfo;

@Repository
public class DonateDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public List<Donate> donateList(Map<String, Object> map) {

		return session.selectList("donate.donateList", map);
	}

	public Donate donateDetail(int donateNo) {
		return session.selectOne("donate.donateDetail", donateNo);
	}
	
//	후원자 현황
	public List<PaymentInfo> selectPayPeople(int donateNo) {
		
		return session.selectList("donate.selectPayPeople", donateNo);
	}
	
//	조회수 증가
	public int increaseCount(int donateNo) {
		return session.update("donate.increaseCount", donateNo);
	}
	
//  후원 다른게시글 리스트
	public List<Donate> selectOtherDonateList(Map<String, Object> map) {
		return session.selectList("donate.selectOtherDonateList", map);
	}
	
//  태그 리스트
	public List<DonateTag> selectTagList() {
		return session.selectList("donate.selectTagList");
	}
	
//	게시판 등록
	public int insertDonateBoard(Donate donate) {
		return session.insert("donate.insertDonateBoard", donate);
	}
	
//	사진 등록
	public int insertDonateImgList(List<Attachment> imgList) {
		return session.insert("donate.insertDonateImgList", imgList);
	}
	
//	게시판 수정
	public int updateDonateBoard(Donate donate) {
		return session.update("donate.updateDonateBoard", donate);
	}
	
//	게시판 사진 삭제
	public int deleteDonateImg(String deleteList) {
		return session.delete("donate.deleteDonateImg", deleteList);
	}
	
//	게시판 사진 수정
	public int updateDonateImg(Attachment at) {
		return session.update("donate.updateDonateImg", at);
	}
	
//	게시판 사진 추가
	public int insertDonateImg(Attachment at) {
		return session.insert("donate.insertDonateImg", at);
	}

//	게시글 삭제
	public int deleteDonateBoard(int donateNo) {
		return session.update("donate.deleteDonateBoard", donateNo);
	}

//	DB에 없는 사진 자동 삭제
	public List<String> selectDonateFileList() {
		return session.selectList("donate.selectDonateFileList");
	}
	
















	






}
