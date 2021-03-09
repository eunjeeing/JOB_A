package com.kh.joba.user.chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.joba.user.member.model.vo.Member;

public class ChatHandler extends TextWebSocketHandler {
	
	public static HashMap<Integer, List<WebSocketSession>> wsList = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		String url = session.getUri().toString();
		int roomNo = Integer.parseInt(url.split("/")[5]);
		
		String memNick= ((Member)session.getAttributes().get("member")).getMemNick();
		System.out.println(memNick);
		
		List<WebSocketSession> wsMemberList = new ArrayList<WebSocketSession>();
		
		if(wsList.get(roomNo) == null) {
			
			wsMemberList.add(session);
			wsList.put(roomNo, wsMemberList);
			
		} else if(! wsMemberList.contains(session)) {
			
			wsMemberList = wsList.get(roomNo);
			wsMemberList.add(session); 
			
			wsList.put(roomNo, wsMemberList);
		}
		
		for(WebSocketSession user : wsList.get(roomNo)) {
			
			if(user != session) {
				user.sendMessage(new TextMessage(memNick + "님이 입장하셨습니다."));
			}
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String url = session.getUri().toString();
		int roomNo = Integer.parseInt(url.split("/")[5]);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		Member loginMember = (Member)session.getAttributes().get("member");
				
		for(WebSocketSession user : wsList.get(roomNo)) {
			// 수신자.sendMessage( 송신자 | 안녕하세요 | 192.0.0.0 | user01 );
			user.sendMessage(new TextMessage(session.getId() + "|" + message.getPayload() + "|" + session.getRemoteAddress() + "|" 
											+ loginMember.getMemNick() + "|" + sdf.format(new Date())) );
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		String url = session.getUri().toString();
		int roomNo = Integer.parseInt(url.split("/")[5]);
		
		wsList.get(roomNo).remove(session);
		
		Member loginMember = (Member)session.getAttributes().get("member"); 
		
		// 채팅방에 해당 사용자가 나갔음을 알리는 메시지 전송
		for(WebSocketSession user : wsList.get(roomNo)) {
			user.sendMessage(new TextMessage(loginMember.getMemNick() +"님이 퇴장하셨습니다."));
		}
	}
}
