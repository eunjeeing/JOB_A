package com.kh.joba.user.search.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.common.util.UtilsBoard1;
import com.kh.joba.user.search.model.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	SearchService ss;
	
	@RequestMapping("/search/searchList.do")
	public String searchList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
							@RequestParam String keyword,
							Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = ss.searchList(cPage, numPerPage, keyword);
		int totalContents = ss.searchTotalContents(keyword);
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchList.bo?keyword="+keyword);
		
		// 조회확인용
		System.out.println("keyword : " + keyword);
		//System.out.println("totalContents : " + totalContents);
		//System.out.println("list : " + list);
	
		model.addAttribute("searchList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		//model.addAttribute("keyword", keyword);
		return "user/search/searchList"; 
	}
	
	@RequestMapping("/search/selectOne.do")
	public String selectOne(@RequestParam int board_No, Model model) {
		
		
		
		return null;
	}
}
