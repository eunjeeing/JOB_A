package com.kh.joba.admin.boardNotice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board.model.vo.Board1;

public interface BoardNoticeDAO {

	List<Map<String, String>> noticeList();

	List<Map<String, String>> adminNoticeList();

	Board1 selectOneNotice(int board_no);

	int updateNotice(Board1 notice);

	int deleteNotice(int board_no);

	int insertNotice(Board1 notice);

	int insertAdminNotice(Board1 notice);

	Board1 selectOneAdminNotice(int board_no);

	List<Map<String, String>> selectMentoTotalList();

	List<Map<String, String>> selectMentoAnsweredList();

	List<Map<String, String>> selectMentoUnansweredList();

	Board1 selectOneMento(int board_no);

}
