package com.kh.joba.user.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.chat.model.service.ChatService;
import com.kh.joba.user.chat.model.vo.Chat;
import com.kh.joba.user.common.util.Utils;
import com.kh.joba.user.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	                  //   방 번호, 참가자 목록
	public static HashMap<Integer, List<String>> roomMembers;
	
	@RequestMapping("chat/chatList")
	public String selectChatList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) { 
	
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
		
		return "user/chat/chatList";
	}
	
	@RequestMapping("chat/chatRoom/{chatRoomNo}")
	public String selectChatRoom(HttpSession session, @PathVariable int chatRoomNo, @RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model, HttpServletRequest req) {
		System.out.println(chatRoomNo);
		Map<String, String> chatRoom = chatService.selectChatRoom(chatRoomNo);
		if(roomMembers == null) {
			roomMembers = new HashMap<Integer, List<String>>();
			
		}
		ArrayList<String> members = null;
		if(roomMembers.get(chatRoomNo) == null) { // 채팅방이 없을 때
			members = new ArrayList<String>();
			members.add(((Member)session.getAttribute("member")).getMemId());
			
			roomMembers.put(chatRoomNo, members);
		} else { // 채팅방이 있을 때
			members = (ArrayList<String>)roomMembers.get(chatRoomNo);
			members.add(((Member)session.getAttribute("member")).getMemId());
			
			roomMembers.put(chatRoomNo, members);
		}
		
		
		model.addAttribute("chatRoom", chatRoom);
		
		
		int numPerPage = 8;
		List<Map<String,String>> chatList = chatService.selectChatList(cPage, numPerPage);
		int totalChats = chatService.selectChatTotalContents();
		String pageBar = Utils.getPageBar(totalChats, cPage, numPerPage, "");

		model.addAttribute("chatList", chatList);
		model.addAttribute("totalChats", totalChats);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		model.addAttribute("host", req.getRemoteAddr());
		
		return "user/chat/chatRoom";
	}

	@RequestMapping("chat/insertChat")
	public String insertChat(Chat chat, @RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model, HttpServletRequest req) {
		System.out.println(chat);
		int chatRoomNo = chatService.insertChat(chat);
		Map<String, String> chatRoom = chatService.selectChatRoom(chatRoomNo);
		
		model.addAttribute("chatRoom", chatRoom);
		
		
		return "redirect:/chat/chatRoom/" + chatRoomNo;
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





