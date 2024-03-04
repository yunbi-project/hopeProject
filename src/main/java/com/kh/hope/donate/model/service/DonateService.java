package com.kh.hope.donate.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.config.Utils;
import com.kh.hope.donate.model.dao.DonateDao;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.donate.model.vo.DonateTag;
import com.kh.hope.payment.model.vo.PaymentInfo;

import jakarta.servlet.ServletContext;

@Service
public class DonateService {

	@Autowired
	private DonateDao dao;
	
	@Autowired
	private ServletContext application;
	
	public List<Donate> donateList(Map<String, Object> map) {
		return dao.donateList(map);
	}

	public Donate donateDetail(int donateNo) {
		return dao.donateDetail(donateNo);
	}

//	후원자 현황
	public List<PaymentInfo> selectPayPeople(int donateNo) {
		return dao.selectPayPeople(donateNo);
	}
	
//	조회수 증가
	public int increaseCount(int donateNo) {
		return dao.increaseCount(donateNo);
	}
	
//  후원 다른게시글 리스트
	public List<Donate> selectOtherDonateList(Map<String, Object> map) {
		return dao.selectOtherDonateList(map);
	}
	
//	태그 리스트
	public List<DonateTag> selectTagList() {
		return dao.selectTagList();
	}
	
//	후원모집 게시글 등록(사진 포함)
	@Transactional(rollbackFor = {Exception.class})
	public int insertDonateBoard(Donate donate, List<Attachment> imgList) throws Exception {
		
		donate.setDonateContent(Utils.XSSHandling(donate.getDonateContent()));
		donate.setDonateContent(Utils.newLineHandling(donate.getDonateContent()));
		donate.setDonateTitle(Utils.XSSHandling(donate.getDonateTitle()));
		
		int result = dao.insertDonateBoard(donate);
		
		int donateNo = donate.getDonateNo();
		
		
		
		if(!imgList.isEmpty()) {
			for(Attachment bi : imgList) {
				bi.setRefFno(donateNo);
			}
			result = dao.insertDonateImgList(imgList); // 다중 insert문 // 4개의 행이 담겨져있다? 그럼 4개의 행을 추가하면됨.
			
			if(result != imgList.size()) {  // 이미지 삽입 실패시
				throw new Exception("예외 강제 발생");
			}
		}
		
		return result;
		
	}
	
	// 게시판 수정 + 사진 수정
	public int updateDonateBoard(Donate donate, String deleteList, List<MultipartFile> upfiles) {
		
		donate.setDonateContent(Utils.XSSHandling(donate.getDonateContent()));
		donate.setDonateContent(Utils.newLineHandling(donate.getDonateContent()));
		donate.setDonateTitle(Utils.XSSHandling(donate.getDonateTitle()));
		
		int result = dao.updateDonateBoard(donate);
		
		// 이미지 및 첨부파일 등록
		String webPath = "/resources/images/donate/" + "/";
		String serverFolderPath = application.getRealPath(webPath);
		
		// 게시글 등록이 성공적으로 완료되었을 때
		if(result > 0) {
			
			// 업로드된 이미지를 분류작업
			List<Attachment> imgList = new ArrayList();
			
			if(upfiles != null) {  
				for(int i=0; i<upfiles.size(); i++) {
					if(!upfiles.get(i).isEmpty()) {
						
						String changeName = Utils.saveFile(upfiles.get(i), serverFolderPath);
						
						// Attachment객체 생성후, 필요한 값을 추가해서 imgList에 추가
						Attachment at = new Attachment();
						at.setChangeName(changeName);
						at.setOriginName(upfiles.get(i).getOriginalFilename());
						at.setRefFno(donate.getDonateNo());
						at.setImgLevel(i);
						
						imgList.add(at);
					}
				}
			}
			
			// x버튼을 눌러서 이미지를 삭제하고자 하는 경우
			if(deleteList != null && !deleteList.equals("")) {
				
				// 삭제하기 위해서는 board_img_no가 필요함
				result = dao.deleteDonateImg(deleteList);
			}
			
			// db에서 삭제처리 완료됐거나 혹은 게시판 업데이트 성공시
			if(result > 0) {
				// BoardImg객체 하나하나 업데이트
				
				for(Attachment at : imgList) {
					result = dao.updateDonateImg(at);
					
					// result값은 1혹은 0으로 반환
					// result == 0 ? 실패 → 기존에 이미지가 없던 경우
					// result == 1 ? 성공 → 기존에 이미지가 있던 경우
					
					if(result == 0) {   // 기존에 이미지가 없으면 insert문 호출
						result = dao.insertDonateImg(at); 
						// 기존에 있던 boardMapper 이용. changeName, OriginName, refBno, imgLevel 값이 다 있어서 문제없음
					}
				}
			}
		
		}
		
		return result;
	}

//	게시글 삭제
	public int deleteDonateBoard(int donateNo) {
		return dao.deleteDonateBoard(donateNo);
	}

//	DB에 없는 게시글 자동 삭제
	public List<String> selectDonateFileList() {
		return dao.selectDonateFileList();
	}
	
	
}




