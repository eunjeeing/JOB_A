package com.kh.joba.user.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.chat.model.vo.Chat;

@Repository
public class ChatDAOImpl implements ChatDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectChatList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chatMapper.selectChatList");
	}

	@Override
	public int insertChat(Chat chat) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chatMapper.insertChat", chat);
	}

	@Override
	public int selectChatSeq() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.selectChatSeq");
	}

	@Override
	public Map<String, Chat> selectChatRoom(int chatNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.selectChat", chatNo);
	}

	@Override
	public Object deleteChat(int chatNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.deleteChat", chatNo);
	}

}
