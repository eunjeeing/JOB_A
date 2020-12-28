package com.kh.joba.user.calendar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CalendarController {
	
	@RequestMapping("/calendar.do")
	public String calendar() {
		
		return "user/calendar/calendar";
	}
}
