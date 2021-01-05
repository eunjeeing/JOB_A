package com.kh.joba.admin.administer.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.joba.admin.administer.model.service.AdminService;
import com.kh.joba.admin.administer.model.vo.Admin;
import com.kh.joba.user.common.util.Utils;
import com.kh.joba.user.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("admin/adminList")
	public String selcetAdminList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) { 
		
		int numPerPage = 10; // 한 페이지당 채팅방 and 페이지 수
		
		// 1. 현재 페이지 채팅 구하기
		List<Map<String,String>> list = adminService.selectAdminList(cPage, numPerPage);
		
		// 2. 전체 채팅방 수 (페이지 처리를 위함 몇페이지까지 있는지)
		int totalAdmin = adminService.selectTotalAdmin();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalAdmin, cPage, numPerPage, "adminList");
		
		System.out.println("list : " + list);
		
		// 1,2,3 모델에 담기
		model.addAttribute("adminList", list);
		model.addAttribute("totalAdmin", totalAdmin);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/administer/adminList";
	}

	@RequestMapping("admin/adminEnroll")
	public String adminEnroll(Admin admin, Model model) {
		
		System.out.println(admin);
		
		String plainPassword = admin.getAdminPw();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		admin.setAdminPw(encryptPassword);
		
			
		int result = adminService.insertAdmin(admin);
		if (result > 0) {
			model.addAttribute("admin", admin);
		}
		
		return "redirect:admin/adminList";
	}
	
	@RequestMapping("admin/adminDelete/{adminNo}")
	public String adminDelete (Model model, Admin admin) {
		
		int result = adminService.deleteAdmin(admin.getAdminNo()); // no로 조회하고 삭제
		
		String loc = "/";
		String msg = "";
		
		if( result > 0) msg = "삭제 성공";
		else msg = "삭제 실패";
		
		 model.addAttribute("loc", loc);
		 model.addAttribute("msg", msg);
		
		return "redirect:admin/adminList";		
	}
	
	
/******************************************************************/
	
	@RequestMapping("admin/adminUpdateView")
	public String adminUpdateView(String memId, Model model) {
		
		Admin admin = adminService.selectAdmin(memId);
		model.addAttribute("admin", admin);
		return "admin/administer/adminUpdateView";
	}
	
	
	
	@RequestMapping("admin/adminUpdate")
	public String adminUpdate(Admin admin, Model model) {
		
		int result = adminService.updateAdmin(admin);
		
		return null;
	}
	


}
