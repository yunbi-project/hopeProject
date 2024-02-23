package com.kh.hope.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.product.model.dao.ProductDao;
import com.kh.hope.product.model.vo.Product;
import com.kh.hope.product.model.vo.ProductCategory;

import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Slf4j
@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao productDao;

//	물품 기부 신청
	@Override
	public int insertProduct(Product p) {
		return productDao.insertProduct(p);
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

//	물품기부 번호 조회
	@Override
	public int selectProductNo() {
		return productDao.selectProductNo();
	}

//	물품기부번호 조회 리스트
	@Override
	public List<Product> selectProductNoCheck(String phone) {
		return productDao.selectProductNoCheck(phone);
	}

//	물품 기부 수정 체크
	@Override
	public Product selectProductUpdateCheck(Product pro) {
		return productDao.selectProductUpdateCheck(pro);
	}

//	물품 기부 수정
	@Override
	public int updateProduct(Product pro) {
		return productDao.updateProduct(pro);
	}

//	물품 기부 카테고리 리스트
	@Override
	public List<ProductCategory> selectProductCategoryList() {
		return productDao.selectProductCategoryList();
	}

}
