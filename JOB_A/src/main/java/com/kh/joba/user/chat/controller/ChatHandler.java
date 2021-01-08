package com.kh.joba.user.chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.joba.user.member.model.vo.Member;

public class ChatHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<>();
	
	@Override // 세션 연결시 동작
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessionList.add(session);
		
		System.out.println(session.getId() + " :: 연결됨.. " );
		// session으로부터 로그인한 사용자 정보 가져오기
		Member loginMember = (Member)session.getAttributes().get("member");
		
		// 채팅방 입장 시 상대방에게 입장 메시지 보내기
		for(WebSocketSession user : sessionList) {
			if(user != session) {
				user.sendMessage(new TextMessage(loginMember.getMemNick() + "님이 입장하셨습니다."));
			}
		}
		
	}
	
	@Override // 웹소켓으로 메시지 전송 시 동작!
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 메시지 송신자
		Member loginMember = (Member)session.getAttributes().get("member");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		
		// 송신자가 보낸 메시지를 접속한 사용자들에게 전송하기
		for(WebSocketSession user: sessionList) {
			// 수신자.sendMessage( 송신자 | 안녕하세요 | 192.0.0.0 | user01 );
			user.sendMessage(new TextMessage(session.getId() + "|" + message.getPayload() + "|" + session.getRemoteAddress() + "|" 
											+ loginMember.getMemNick() + "|" + sdf.format(new Date())) );
			// TextMessage 객체만들어서 세션id, 메시지내용,  보내기 
		}
		
		
	}

	@Override // 웹소켓 종료 시 동작!
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session); // 종료한 사용자(session) 목록에서 지우기
		
		System.out.println(session.getId() + " :: 연결 종료! ");
		
		Member loginMember = (Member)session.getAttributes().get("member"); 
		
		// 채팅방에 해당 사용자가 나갔음을 알리는 메시지 전송
		for(WebSocketSession user : sessionList) {
			user.sendMessage(new TextMessage(loginMember.getMemNick() +"님이 퇴장하셨습니다."));
		}
	}
	


}
