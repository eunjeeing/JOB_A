package com.kh.joba.admin.management.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.joba.admin.management.model.service.AdminService;
import com.kh.joba.admin.management.model.vo.Admin;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.member.model.vo.Member;

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
	
	@RequestMapping("admin/adminUpdateView")
	public String adminUpdateView(int adminNo, Model model) {
		System.out.println(adminNo);
		Admin admin = adminService.selectAdmin(adminNo);
		System.out.println(admin);
		model.addAttribute("admin", admin);
		return "admin/management/adminUpdateView";
	}
	
	
	
	@RequestMapping("admin/adminUpdate")
	public String adminUpdate(Admin admin, Model model) {
		
		String plainPassword = admin.getAdminPw();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword); // 비밀번호 암호화
		System.out.println("gradeNo: " + admin.getGradeNo());
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		admin.setAdminPw(encryptPassword);
		
		
		System.out.println("admin 수정 : " + admin);
		
		
		int result = adminService.updateAdmin(admin);
		System.out.println(result);
		String loc="/admin/adminList"; 
		String msg="";
		if (result > 0) {
			msg = "수정 성공";

		}else {
			msg = "수정 실패";
		}
		 model.addAttribute("msg", msg);
         model.addAttribute("loc", loc);
      
      return "user/common/msg";
	}
	

	/******************************************************************/
	
	@RequestMapping("user/userList")
	public String selcetUserList(Model model) { 
		
		List<Map<String,String>> list = adminService.selectMemberList();
		
		System.out.println("list : " + list);
		
		
		model.addAttribute("memberList", list);
		
		return "admin/management/memberList";
	}
	
	@RequestMapping("user/userDetail")
	public String selcetUserDetail(int memNo, Model model) { 
		
		List<Map<String, String>> member = adminService.selectMember(memNo);
		
		model.addAttribute("user", member);
		return "admin/management/memberDetail";
	}
	
	@RequestMapping("user/selectBoardList")
	public List<Map<String,String>> selectBoardList(int memNo) { 
		System.out.println(memNo);
		List<Map<String,String>> boardList = new ArrayList<Map<String,String>>();
		boardList = adminService.selectBoardList(memNo);
		System.out.println("boardList : " + boardList);
		return boardList;
	}
	
	@RequestMapping("user/selectCommentList")
	public List<Map<String,String>> selectCommentList(int memNo) { 
		List<Map<String,String>> commentList = adminService.selectCommentList(memNo);
		System.out.println("commentList : " + commentList);
		return commentList;
	}
	
	@RequestMapping("user/selectReportBoardList")
	public List<Map<String,String>> selectReportBoardList(int memNo) { 
		List<Map<String,String>> reportBoardList = adminService.selectReportBoardList(memNo);
		System.out.println("reportBoardList : " + reportBoardList);
		return reportBoardList;
	}
	
	@RequestMapping("user/selectReportCommentList")
	public List<Map<String,String>> selectReportCommentList(int memNo) { 
		List<Map<String,String>> reportCommentList = adminService.selectReportCommentList(memNo);
		System.out.println("reportCommentList : " + reportCommentList);
		return reportCommentList;
	}
	
	
	@RequestMapping("user/gradeListView")
	public String upGradeList(Model model) {
		List<Map<String,String>> gradeList = adminService.selectGradeList();
		System.out.println("boardList : " + gradeList);
		model.addAttribute("gradeList", gradeList);
		return "admin/management/upGradeList";
	}
	
	@RequestMapping("user/changeGrade")
	public String changeGrade(Member member, Model model) {
		System.out.println(member);
		int result = adminService.changeGrade(member);
		
		if ( result > 0) {
		}
		
		return "redirect:/user/userDetail?memNo="+member.getMemNo();
	}
	
	@RequestMapping("user/changeStatus")
	public String changeStatus(Member member, Model model) {
		
		int result = adminService.changeStatus(member);
		
		if ( result > 0) {
			model.addAttribute("statusMember", member);
		}
		return "redirect:/user/userDetail?memNo="+member.getMemNo();
	}

}
