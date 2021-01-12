package com.kh.joba.user.myscrap.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.bookmark.model.service.BookmarkService;
import com.kh.joba.user.bookmark.model.vo.Bookmark;
import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.common.util.UtilsBoard1;
import com.kh.joba.user.member.model.vo.Member;
import com.kh.joba.user.myscrap.model.service.MyScrapService;

@Controller
public class MyScrapController {
	
	/*
	@Autowired
	MyScrapService mss;
	
	@Autowired
	BookmarkService bs;
	
	@RequestMapping("/myscrap/selectMyScrap.bo")
	public String selectMyScrapList
		(@RequestParam( value="cPage", required=false, defaultValue="1") int cPage,
		 @RequestParam int mem_no, Model model) {
		
		int numPerPage = 10; 
		
		List<Map<String, String>> list = mss.selectMyScrapList(cPage, numPerPage, mem_no);
		
		int totalContents = mss.selectMyScrapTotalContents(mem_no);
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "selectMyPost.do?mem_no="+mem_no);
				
		model.addAttribute("myScrapList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		return "user/mypage/myScrap";
	}
	
	@RequestMapping("/myscrap/sortScrapList.bo")
	public String sortScrapList(@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, 
								@RequestParam int mem_no, 
								@RequestParam int type_no,
								Model model) {
		
		System.out.println(mem_no + "/" +  type_no);
		
		Bookmark book = new Bookmark(0, mem_no, type_no);
		
		int numPerPage = 10; 
		
		List<Map<String, String>> list = mss.sortMyScrapList(cPage, numPerPage, book);
		
		int totalContents = mss.sortMyScrapTotalContents(mem_no);
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "selectMyPost.do?mem_no="+mem_no);
				
		model.addAttribute("myScrapList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/mypage/myScrap";
		
	}
	
	
	@RequestMapping("/searchScrapList.bo")
	public String searchMentoList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model, HttpSession session) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchScrapList(cPage, numPerPage, changeToUpper(keyword));
		int totalContents = bs.searchMyScrapTotalContents(changeToUpper(keyword));
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchMentoList.bo?keyword="+changeToUpper(keyword));
		
		if (session.getAttribute("member") != null) {
			Member mem = (Member)session.getAttribute("member");
			List<Bookmark> bookmarkList = ms.selectAllBookmark(mem.getMemNo());
			model.addAttribute("bookmarkList", bookmarkList);			
		}
		
		model.addAttribute("mentoList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/mento/mentoList"; 
	}
	 * */

}
