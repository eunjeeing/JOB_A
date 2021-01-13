package com.kh.joba.admin.index.model.vo;

import com.kh.joba.user.board.model.vo.Attachment1;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class IndexVo {
	
	private int board_no;
	private int type_no;
	private int mem_no;
	private int category_no;
	private String board_title;
	private String board_content;
	private String mem_nick;
	private String board_date;
	private String board_status;
	private int board_view;
	private String board_url;
	private int comm_count;
	private String board_mainTitle;

	private String category_Name;
	private int comm_Count;
	private String mem_Nick;
	private int file_Count;
	private String type_Name;
}
