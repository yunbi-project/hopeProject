package com.kh.hope.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.user.model.vo.User;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession session;

	// 사용자 조회
	public List<User> selectAllUser() {
		return session.selectList("adminMapper.selectAllUser");
	}
	// 사용자 삭제
	public int deleteUser(int userNo) {
		return session.update("adminMapper.deleteUser", userNo);
	}
	// 블랙리스트 Insert
	public int blackListInsert(BlackList blackList) {
		return session.insert("adminMapper.blackListInsert", blackList);
	}
	// 회원정보 확인
	public User getUserOne(int userNo) {
		return session.selectOne("adminMapper.getUserOne", userNo);
	}
	// 회원정보 수정
	public int updateUserInfo(User user) {
		return session.update("adminMapper.updateUserInfo" , user);
	}
	// 이름 검색
	public List<User> searchUserByName(String userName) {
		return session.selectList("adminMapper.searchUserByName" , userName);
	}
	// 블랙리스트 조회
	public List<BlackList> blackListView() {
		return session.selectList("adminMapper.blackListView");
	}
	// User 테이블 정지풀기
	public int releseStop(int userNo) {
		return session.update("adminMapper.releseStop" , userNo);
	}
	// 블랙리스트 정지풀기
	public int modifyUserStop(int userNo) {
		return session.update("adminMapper.modifyUserStop", userNo);
	}
	// 블랙리스트 회원번호 검색
	public List<BlackList> searchByUserNo(int userNo) {
		return session.selectList("adminMapper.searchByUserNo" , userNo);
	}
	
	

}
