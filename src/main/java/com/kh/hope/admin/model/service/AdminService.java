package com.kh.hope.admin.model.service;

import java.util.List;

import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.user.model.vo.User;

public interface AdminService {

	// 사용자 List 조회
	List<User> selectAllUser();
	
	// 사용자 삭제
	int deleteUser(int userNo, String reason);
	
	// 회원정보 확인
	User getUserOne(int userNo);
	
	// 회원정보 업데이트
	int updateUserInfo(User user);

	// 회원 이름검색
	List<User> searchUserByName(String userName);

	// 블랙리스트 List 조회
	List<BlackList> blackListView();

	// User 테이블 정지풀기
	int releseStop(int userNo);

	// 블랙리스트 테이블 정지풀기
	int modifyUserStop(int userNo);

	// 블랙리스트 회원번호 검색
	List<BlackList> searchByUserNo(int userNo);

}
