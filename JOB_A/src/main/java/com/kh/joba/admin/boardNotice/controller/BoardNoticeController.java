package com.kh.joba.admin.boardNotice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.joba.admin.boardNotice.model.service.BoardNoticeService;

@Controller
public class BoardNoticeController {
	
	
	@Autowired
	BoardNoticeService bns;
	 
	
	@RequestMapping("/admin/noticeList.bo")
	public String noticeList(Model model) {
		
		List<Map<String, String>> list = bns.noticeList();
		System.out.println(list);
		model.addAttribute("noticeList", list);
		
		
		return "admin/board/notice/noticeList";
	}
	
	@RequestMapping("/admin/noticeWrite.bo")
	public String noticeWriteForm () {
		return "admin/board/notice/noticeWriteForm";
	}

}
