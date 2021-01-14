package com.kh.joba.user.chat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.joba.user.chat.model.service.ChatService;
import com.kh.joba.user.chat.model.vo.Chat;
import com.kh.joba.user.common.util.Utils;

@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;

	
	
	@RequestMapping("chat/chatList")
	public String selectChatList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model, HttpServletRequest req) { 
	
		// 페이징
		int numPerPage = 8; // 한 페이지당 채팅방 and 페이지 수
		
		// 1. 현재 페이지 채팅 구하기
		List<Map<String,String>> chatList = chatService.selectChatList(cPage, numPerPage);
		
		// 2. 전체 채팅방 수 (페이지 처리를 위함 몇페이지까지 있는지)
		int totalChats = chatService.selectChatTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalChats, cPage, numPerPage, "");
		
		// System.out.println("list : " + chatList);
		// 1,2,3 모델에 담기
		model.addAttribute("chatList", chatList);
		model.addAttribute("totalChats", totalChats);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		// System.out.println(chatNo);
		
//		// 방 정보
//		Map<String, Chat> chat = chatService.selectChat(chatNo);
//		System.out.println(chatNo + "번째 chat: " + chat);
//		
//		model.addAttribute("chat", chat);
		
		return "user/chat/chatList";
	}
	
	
//	@RequestMapping("chat/chatList")
//	public String selectChatList(Model model, HttpServletRequest req) { 
//
//		List<Map<String,String>> chatList = chatService.selectChatList();
////		System.out.println(chatList);
//		model.addAttribute("chatList", chatList);
//		
//		return "user/chat/chatList";
//	}
	
	@RequestMapping("chat/chatRoom/{chatNo}")
	@ResponseBody
	public Map<String, Chat> selectChatRoom(@PathVariable int chatNo) {
		System.out.println(chatNo);
		Map<String, Chat> chatRoom = chatService.selectChatRoom(chatNo);
		System.out.println(chatRoom);
		return chatRoom;
	}
	
//	@RequestMapping("chat/insertChat")
//	public String insertChat(Chat chat, Model model, HttpServletRequest req) {
//		System.out.println(chat);
//		int chatNo = chatService.insertChat(chat);
//		
//		return "redirect:/chat/chatRoom/" + chatNo;
//	}

	@RequestMapping("chat/insertChat")
	@ResponseBody
	public Map<String, Integer> insertChat(Chat chat, Model model, HttpServletRequest req) {
		System.out.println(chat);
		Map<String, Integer> chatRoomNo = chatService.insertChat(chat);
		List<Map<String,String>> chatList = chatService.selectChatList();
		model.addAttribute("chatList", chatList);
		
		System.out.println(chatRoomNo);
		return chatRoomNo;
	}
	
	@RequestMapping("/chat/exitChat")
	public String exitChat() {
		return "redirect:/chat/chatList";
	}
	
	@RequestMapping("/chat/deleteChat/{chatNo}")
	public String deleteChat(@PathVariable int chatNo) {
		chatService.deleteChat(chatNo);
		
		return "redirect:/chat/chatList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}





