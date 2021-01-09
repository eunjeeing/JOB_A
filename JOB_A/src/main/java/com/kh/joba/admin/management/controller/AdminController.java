package com.kh.joba.admin.management.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.joba.admin.management.model.service.AdminService;
import com.kh.joba.admin.management.model.vo.Admin;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("admin/adminList")
	public String selcetAdminList(Model model) { 
		
		List<Map<String,String>> list = adminService.selectAdminList();
		
		model.addAttribute("adminList", list);
		
		return "admin/management/adminList";
	}

	@RequestMapping("admin/adminEnrollView")
	public String adminEnrollView() {
		return "admin/management/adminEnroll";
	}
	
	
	@RequestMapping("admin/adminEnroll")
	public String adminEnroll(Admin admin, Model model) {
		
		System.out.println("입력값 " + admin);
		
		String plainPassword = admin.getAdminPw();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		admin.setAdminPw(encryptPassword);
		
		String fullEmail = admin.getAdminEmail() + "@job-jo8a.com";
		
		admin.setAdminEmail(fullEmail);
		
		int result = adminService.insertAdmin(admin);
		if (result > 0) {
			model.addAttribute("admin", admin);
		}
		
		return "redirect:adminList";
	}
	
	@RequestMapping("admin/adminDelete")
	public String adminDelete (int adminNo, Model model) {
		
		System.out.println(adminNo);
		int result = adminService.deleteAdmin(adminNo); // no로 조회하고 삭제
		
		String loc = "/";
		String msg = "";
		
		if( result > 0) msg = "삭제 성공";
		else msg = "삭제 실패";
		
		 model.addAttribute("loc", loc);
		 model.addAttribute("msg", msg);
		
		return "redirect:adminList";		
	}
	
	
/******************************************************************/
	
	@RequestMapping("admin/adminUpdateView")
	public String adminUpdateView(int adminNo, Model model) {
		System.out.println(adminNo);
		Admin admin = adminService.selectAdmin(adminNo);
		
		model.addAttribute("admin", admin);
		return "admin/management/adminUpdateView";
	}
	
	
	
	@RequestMapping("admin/adminUpdate")
	public String adminUpdate(Admin admin, Model model) {
		
		int result = adminService.updateAdmin(admin);
		
		return null;
	}
	


}
