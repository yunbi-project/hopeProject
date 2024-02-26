package com.kh.hope.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import com.kh.hope.member.model.vo.MemberEntity;
import com.kh.hope.user.model.vo.User;


@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 기본 세션 로그인

	public User loginUser(String email) {
		System.out.println(email);
		return session.selectOne("member.loginUser", email);
	}


	public int insertUser(User user) {
		return session.insert("member.insertUser" , user);
	}


	public int idCheck(String email) {
		return session.selectOne("member.idCheck",email);
	}


	public User idfind(String name, String phone) {
		 	User user = new User();
		    user.setUserName(name);
		    user.setPhone(phone);
		    System.out.println(user);
		    return session.selectOne("member.idfind", user);
		}
	
	public User pwdfind(String email, String phone) {
			User user = new User();
			user.setEmail(email);
			user.setPhone(phone);
			
		return session.selectOne("member.pwdfind", user);
	}
	
	public int repassword(String password, String email) {
			User user = new User();
			user.setPassword(password);
			user.setEmail(email);
		return session.update("member.repassword", user);
	}

	
	
	
	
	
	
	
	//------------------------------ 소셜로그인 -------------------------------------------------

	public User findByUsername(String providerid) { // 회원이 존재하는지 여부확인

		return session.selectOne("member.findByUsername", providerid);
	}

	public void save(User member) {	// 처음 소셜 로그인
		session.insert("member.save", member);
		
	}


	public void update(User existData) { // 이미 로그인한 소셜로그인 업데이트
		session.update("member.update", existData);
		
	}



	
}
