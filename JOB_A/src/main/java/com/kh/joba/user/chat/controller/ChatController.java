package com.kh.joba.user.chat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.chat.model.service.ChatService;
import com.kh.joba.user.common.util.Utils;

@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@RequestMapping("/chatting.do")
	public String chatting(Model model, HttpServletRequest req) {
		
		model.addAttribute("hosr", req.getRemoteHost());
		return "chat/chatView";
	}
	
	
	@RequestMapping("chat/chatList.do")
	public String selectChatList( @RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) { 
		
		int numPerPage = 10; // 한 페이지당 채팅방 and 페이지 수
		
		// 1. 현재 페이지 채팅 구하기
		List<Map<String,String>> list = chatService.selectChatList(cPage, numPerPage);
		
		// 2. 전체 채팅방 수 (페이지 처리를 위함 몇페이지까지 있는지)
		int totalContents = chatService.selectChatTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "chatList.do");
		
		System.out.println("list : " + list);
		
		// 1,2,3 모델에 담기
		model.addAttribute("chatList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/chat/chatList";
	}

}
