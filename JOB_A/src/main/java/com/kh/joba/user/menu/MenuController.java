package com.kh.joba.user.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {
	
	@RequestMapping("/index.ma")
	public String menu01() { return "index"; }
	
	@RequestMapping("/elements.ma")
	public String menu02() { return "user/samplePage/elements"; }
	
	@RequestMapping("/generic.ma")
	public String menu03() { return "user/samplePage/generic"; }

}
