package com.kh.hope.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.mypage.model.vo.Mypage;

@Repository
public class MypageDao {

	@Autowired
	private SqlSession session;
	
	public List<Mypage> selectMypageDonateListP(int userNo) {
		return session.selectList("mypageMapper.mypageDonateListP", userNo);
	}
	
	public List<Mypage> selectMypageDonateListM(int userNo) {
		return session.selectList("mypageMapper.mypageDonateListM", userNo);
	}

	public List<Mypage> selectMypageBookmarkList(int userNo) {
		return session.selectList("mypageMapper.mypageBookmarkList", userNo);
	}

	public List<Mypage> selectMypageProgramList(int userNo) {
		return session.selectList("mypageMapper.mypageProgramList", userNo);
	}

	public boolean deleteBookmark(int userNo, int programNo) {
	    try {
	        HashMap<String, Object> map = new HashMap();
	        map.put("userNo", userNo);
	        map.put("programNo", programNo);
	        
	        int result = session.delete("mypageMapper.deleteBookmark", map);
	        return result > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false; // 예외 발생 시 삭제 실패 처리
	    }
	}

	


	
	

	
	
}
