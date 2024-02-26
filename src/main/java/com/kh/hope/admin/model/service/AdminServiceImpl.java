package com.kh.hope.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.admin.model.dao.AdminDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService{
		
	@Autowired
	public AdminDao adminDao;

}
