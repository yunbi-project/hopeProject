package com.kh.hope.activityreport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.hope.activityreport.model.service.ActivityReportService;

@Controller
public class ActivityReportController {
	
	@Autowired
	private ActivityReportService activityreportService;
}
