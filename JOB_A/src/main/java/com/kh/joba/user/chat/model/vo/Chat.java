package com.kh.joba.user.chat.model.vo;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Chat {

	private int chatNo; // 채팅방 번호
	private String chatTitle;
	private String chatDate;
	private String memId; // 채팅방 생성자
	private Set<WebSocketSession> sessions = new HashSet<>();
}
