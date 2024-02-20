// EditprofileDao.java
package com.kh.hope.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.user.model.vo.User;

@Repository
public class EditprofileDao {
    
    @Autowired
    private SqlSession session;
    
    // 프로필 정보를 업데이트하는 메서드
    
	public int updateUser(User user) {
		return session.update("mypageMapper.updateProfile", user);
	}
}
