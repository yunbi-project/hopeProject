package com.kh.hope.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.hope.payment.model.dao.PaymentDao;
import com.kh.hope.payment.model.vo.PaymentData;
import com.kh.hope.payment.model.vo.ReadyResponse;

@Service
public class PaymentService {

	@Autowired
	private PaymentDao dao;

	public ReadyResponse payReady(PaymentData payment, int totalAmount, String userNo, int donateNo) {
		String order_id = "100";

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("partner_order_id", order_id);
		parameters.add("partner_user_id", userNo+"");
//		parameters.add("item_name", payment);
//		parameters.add("quantity", String.valueOf(quantity));
		parameters.add("total_amount", String.valueOf(totalAmount));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", "");
		parameters.add("cancel_url", "");
		parameters.add("fail_url", "");

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

		RestTemplate template = new RestTemplate();

		String url = "https:kapi.kakao.com/v1/payment/ready";

		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);

		return readyResponse;
	}

	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK daa71c4e4b639513b588ed16164cccf3");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}
}
