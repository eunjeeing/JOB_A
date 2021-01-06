package com.kh.joba.user.mypage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.common.util.Utils;
import com.kh.joba.user.common.util.UtilsBoard1;
import com.kh.joba.user.mypage.model.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService ms;

	@RequestMapping("/mypage/selectMyPost.do")
	public String selectMyPost
		(@RequestParam( value="cPage", required=false, defaultValue="1") int cPage,
		 @RequestParam int mem_No, Model model) {
		
		int numPerPage = 10; 
		
		List<Map<String, String>> list = ms.selectMyPost(cPage, numPerPage, mem_No);
		
		int totalContents = ms.selectMyPostTotalContents(mem_No);
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectMyPost.do?mem_No="+mem_No);
		
		System.out.println("내가 쓴 게시글 조회 - 회원 번호 : " + mem_No);
		
		model.addAttribute("selectMyPost", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		return "user/mypage/myPost";
	}
	
}
