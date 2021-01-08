package com.kh.joba.user.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.chat.model.vo.Chat;

@Repository
public class ChatDAOImpl implements ChatDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectChatList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("chatMapper.selectChatList", null, rows);
	}

	@Override
	public int selectChatTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.selectChatTotalContents");
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
	public Map<String, Chat> selectChat(int chatNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.selectChat", chatNo);
	}

	@Override
	public Object deleteChat(int chatNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.deleteChat", chatNo);
	}

}
