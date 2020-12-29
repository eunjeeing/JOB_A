package com.kh.joba.user.chat.model.vo;

import java.util.Date;

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

	private int chatIndex;
	private int chatNo; // 채팅방 번호
	private String chatTitle;
	private int memNo;
	private Date chatDate;
}
