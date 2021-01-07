package com.kh.joba.user.board.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
public class Board1 {
	private int board_no;
	private int type_no;
	private int mem_no;
	private int category_no;
	private String board_title;
	private String board_content;
	private String mem_nick;
	private Date board_date;
	private String board_status;
	private int board_view;
	private String board_url;
	private Attachment1 attachment;
	private int comm_count;
}
