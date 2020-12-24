package com.kh.joba.user.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.chat.model.dao.ChatDAO;

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



	
}
