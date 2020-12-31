package com.kh.joba.user.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CalendarController {
	
	@RequestMapping("/calendar.do")
	public String calendar() {
		
		System.out.println("calendar페이지 연결완료");
		
		return "user/calendar/fullcalendar";
	}
}
