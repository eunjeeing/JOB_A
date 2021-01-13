package com.kh.joba.user.bookmark.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.joba.user.bookmark.model.service.BookmarkService;
import com.kh.joba.user.bookmark.model.vo.Bookmark;

@Controller
public class BookmarkController {
	
	
	@Autowired
	BookmarkService bs;
	
	
	
	@RequestMapping("/bookmark/insertBookmark.bm")
	@ResponseBody
	public Map<String, Object> insertBookmark(@RequestParam int board_no,
									@RequestParam int mem_no) {
		
		Bookmark bookmark = new Bookmark(board_no, mem_no, 0, null);
		Map<String, Object> map = new HashMap<String, Object>();
		boolean result = bs.insertBookmark(bookmark) == 0 ? false : true;
		map.put("isSuccess", result);
		
		return map;
	}
	
	@RequestMapping("/bookmark/deleteBookmark.bm")
	@ResponseBody
	public Map<String, Object> deleteBookmark(@RequestParam int board_no,
								@RequestParam int mem_no)	{
	
		Bookmark bookmark = new Bookmark(board_no, mem_no, 0, null);
		Map<String, Object> map = new HashMap<String, Object>();
		boolean result = bs.deleteBookmark(bookmark) == 0 ? false : true;
		map.put("isSuccess", result);
		
		return map;
	}
	

	
	

}
