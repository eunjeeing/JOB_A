package com.kh.joba.admin.management.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.joba.admin.management.model.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("user/userList")
	public String selcetUserList(Model model) { 
		
		List<Map<String,String>> list = userService.selectMemberList();
		
		System.out.println("list : " + list);
		
		
		model.addAttribute("memberList", list);
		
		return "admin/management/memberList";
	}



}
