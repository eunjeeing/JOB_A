package com.kh.joba.admin.administer.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.admin.administer.model.service.AdminService;
import com.kh.joba.user.common.util.Utils;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("admin/adminList.do")
	public String selcetAdminList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) { 
		
		int numPerPage = 10; // 한 페이지당 채팅방 and 페이지 수
		
		// 1. 현재 페이지 채팅 구하기
		List<Map<String,String>> list = adminService.selectAdminList(cPage, numPerPage);
		
		// 2. 전체 채팅방 수 (페이지 처리를 위함 몇페이지까지 있는지)
		int totalAdmin = adminService.selectTotalAdmin();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalAdmin, cPage, numPerPage, "adminList.do");
		
		System.out.println("list : " + list);
		
		// 1,2,3 모델에 담기
		model.addAttribute("chatList", list);
		model.addAttribute("totalAdmin", totalAdmin);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/administer/adminList";
	}



}
