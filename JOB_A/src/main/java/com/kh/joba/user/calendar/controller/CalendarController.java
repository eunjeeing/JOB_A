package com.kh.joba.user.calendar.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.joba.user.calendar.model.vo.Calendar;


@Controller
public class CalendarController {
	
	@RequestMapping("/calendar.do")
	public String calendar() {
		
		System.out.println("calendar페이지 연결완료");
		
		return "user/calendar/fullcalendar";
	}
	
	@RequestMapping("/calendar")
	public String cal() {
		
		System.out.println("calendar페이지 연결완료");
		
		return "user/calendar/NewFile";
	}
	
	@RequestMapping("cal/calendarDetail")
	public String caldendarDetail(@ModelAttribute Calendar cal, Model model) throws Exception{
		
		HashMap calMap = new HashMap();
		
		
      
		return "user/calendar/NewFile";
	}
}
