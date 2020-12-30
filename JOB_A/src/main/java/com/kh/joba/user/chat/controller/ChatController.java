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
import com.kh.joba.user.chat.model.vo.Chat;
import com.kh.joba.user.common.exception.ChatException;
import com.kh.joba.user.common.util.Utils;

@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@RequestMapping("/chat/chatView/{chatNo}")
	public String chatView(int chatNo, Model model, HttpServletRequest req) {
		List<Chat> chatList = chatService.selectChat(chatNo);
		
		model.addAttribute("chatList", chatList);
		
		model.addAttribute("host", req.getRemoteHost());
		return "chat/chatting";
	}
	
	
	@RequestMapping("chat/chatList.do")
	public String selectChatList( @RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) { 
		
		int numPerPage = 10; // 한 페이지당 채팅방 and 페이지 수
		
		// 1. 현재 페이지 채팅 구하기
		List<Map<String,String>> list = chatService.selectChatList(cPage, numPerPage);
		
		// 2. 전체 채팅방 수 (페이지 처리를 위함 몇페이지까지 있는지)
		int totalChats = chatService.selectChatTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalChats, cPage, numPerPage, "chatList.do");
		
		System.out.println("list : " + list);
		
		// 1,2,3 모델에 담기
		model.addAttribute("chatList", list);
		model.addAttribute("totalChats", totalChats);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/chat/chatList";
	}
	
	@RequestMapping("chat/insertChat")
	public String insertChat(String chatTitle, Model model, HttpServletRequest req) {

		int chatNo = 0;
		try {
			chatNo = chatService.insertChat(chatTitle);
		} catch (ChatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/chat/chatView/" + chatNo;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}





