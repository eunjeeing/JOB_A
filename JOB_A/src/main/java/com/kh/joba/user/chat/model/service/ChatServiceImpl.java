package com.kh.joba.user.chat.model.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.chat.model.dao.ChatDAO;
import com.kh.joba.user.chat.model.vo.Chat;
import com.kh.joba.user.common.exception.ChatException;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDAO chatDAO;
	
	@Override
	public List<Map<String, String>> selectChatList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return chatDAO.selectChatList(cPage, numPerPage);
	}
	
	@Override
	public int selectChatTotalContents() {
		// TODO Auto-generated method stub
		return chatDAO.selectChatTotalContents();
	}

	@Override
	public int insertChat(String chatTitle) throws ChatException {
		// TODO Auto-generated method stub
		int result = 0;
		int chatNo = chatDAO.selectChatSeq();
		Chat chat = new Chat();
		chat.setChatNo(chatNo);
		chat.setChatTitle(chatTitle);
		
		result = chatDAO.insertChat(chat);
		System.out.println(result);
		if (result == 0) {
			throw new ChatException();
		}
		
		return chatNo;
	}

	@Override
	public Map<String, String> selectChat(int chatNo) {
		// TODO Auto-generated method stub
		return chatDAO.selectChat(chatNo);
	}


	
}
