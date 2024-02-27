package com.kh.hope.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.admin.model.dao.AdminDao;
import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.user.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService{
		
	@Autowired
	public AdminDao adminDao;

	// 사용자 조회
	@Override
	public List<User> selectAllUser() {
		return adminDao.selectAllUser();
	}
	// 사용자 삭제
	@Override
	public int deleteUser(int userNo, String reason) {
		
		int result = adminDao.deleteUser(userNo);
		
		if(result > 0) {
			// 블랙리스트 추가
			BlackList blackList = BlackList.builder()
									.reason(reason)
									.userNo(userNo)
									.build();
			adminDao.blackListInsert(blackList);
		}
		
		return result;
	}
	// 회원정보 확인
	@Override
	public User getUserOne(int userNo) {
		
		System.out.println("serviceImpl : " + userNo);
		return adminDao.getUserOne(userNo);
	}
	// 회원정보확인 수정
	@Override
	public int updateUserInfo(User user) {
		
		return adminDao.updateUserInfo(user);
	}
	// 회원 이름검색
	@Override
	public List<User> searchUserByName(String userName) {
		return adminDao.searchUserByName(userName);
	}
	
	// 블랙리스트 조회
	@Override
	public List<BlackList> blackListView() {
		return adminDao.blackListView();
	}
	//User 테이블 정지풀기
	@Override
	public int releseStop(int userNo) {
		return adminDao.releseStop(userNo);
	}
	// 블랙리스트 정지풀기
	@Override
	public int modifyUserStop(int userNo) {
		return adminDao.modifyUserStop(userNo);
	}
	// 블랙리스트 회원번호 검색
	@Override
	public List<BlackList> searchByUserNo(int userNo) {
		return adminDao.searchByUserNo(userNo);
	}


}
