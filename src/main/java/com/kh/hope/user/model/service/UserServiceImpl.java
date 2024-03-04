package com.kh.hope.user.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.user.model.dao.UserDao;
import com.kh.hope.user.model.vo.User;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Service
public class UserServiceImpl implements UserService {
	
	
	@Autowired
	private UserDao userDao;

	@Override
	public User loginUser(String email) {
		return userDao.loginUser(email);
	}

	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public int idCheck(String email) {
		return userDao.idCheck(email);
	}

	@Override
	public User idfind(User user) {
		return userDao.idfind(user);
	}

	@Override
	public User pwdfind(User user) {
		return userDao.pwdfind(user);
	}

	@Override
	public int repassword(String password, String email) {
		return userDao.repassword(password, email);
	}
//	휴대폰 인증
	@Override
	public void certifiedPhoneNumber(String phone, String numStr) {
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
				String api_key = "NCS5GUPGW9OAQFFD";
		        String api_secret = "3RWX2F3GJNEOFDPL7SEY66BBFIBXAJYI";
		        Message coolsms = new Message(api_key, api_secret);

		      
		        HashMap<String, String> params = new HashMap<String, String>();
		        params.put("to", phone);    // 수신받을 번호
		        params.put("from", "01068307305"); // 발신할 번호
		        params.put("type", "SMS");
		        params.put("text", "[희망의 조각] 인증번호는 [" +numStr+  "] 입니다. ");
		        params.put("app_version", "test app 1.2"); // application name and version

		        try {
		            org.json.simple.JSONObject obj = coolsms.send(params);
		            System.out.println(obj.toString());
		        } catch (CoolsmsException e) {
		            System.out.println(e.getMessage());
		            System.out.println(e.getCode());
		        }
			}

	}


