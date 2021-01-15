package com.kh.joba.user.chat.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.joba.user.member.model.vo.Member;

public class ChatHandler extends TextWebSocketHandler {
	
	public static HashMap<Integer, List<WebSocketSession>> wsList = new HashMap<>(); // 방번호, 참가자리스트?
	
	@Override // 세션 연결시 동작
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 방번호 꺼내기 
		String url = session.getUri().toString();
		int roomNo = Integer.parseInt(url.split("/")[5]);
		
		// 사용자 닉네임
		String memNick= ((Member)session.getAttributes().get("member")).getMemNick();
		System.out.println(memNick);
		
		List<WebSocketSession> wsMemberList = new ArrayList<WebSocketSession>(); // 사용자(세션)리스트
		
		if(wsList.get(roomNo) == null) { // 방이 비어있을때
			
			wsMemberList.add(session); // 내가 첫번째
			wsList.put(roomNo, wsMemberList);
			
		} else if(! wsMemberList.contains(session)) { // 방은 있는데 그안에 내가 등록되어있지 않으면
			
			wsMemberList = wsList.get(roomNo); // 방을 가져와서
			wsMemberList.add(session); // 내 세션 추가
			
			wsList.put(roomNo, wsMemberList); // 특정방에 있는 
		}
		
		// 채팅방 입장 시 상대방에게 입장 메시지 보내기
		for(WebSocketSession user : wsList.get(roomNo)) {
			
			if(user != session) {
				user.sendMessage(new TextMessage(memNick + "님이 입장하셨습니다."));
			}
		}
	
		
	}
	
	@Override // 웹소켓으로 메시지 전송 시 동작!
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		
		// 방번호 꺼내기 
		String url = session.getUri().toString();
		int roomNo = Integer.parseInt(url.split("/")[5]);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		// 메시지 송신자
		Member loginMember = (Member)session.getAttributes().get("member");
				
		// 채팅방 입장 시 상대방에게 입장 메시지 보내기
		for(WebSocketSession user : wsList.get(roomNo)) {
			// 수신자.sendMessage( 송신자 | 안녕하세요 | 192.0.0.0 | user01 );
			user.sendMessage(new TextMessage(session.getId() + "|" + message.getPayload() + "|" + session.getRemoteAddress() + "|" 
											+ loginMember.getMemNick() + "|" + sdf.format(new Date())) );
			// TextMessage 객체만들어서 세션id, 메시지내용,  보내기 
			
		}
		
		
	}


	@Override // 웹소켓 종료 시 동작!
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
