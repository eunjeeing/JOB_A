package com.kh.joba.user.board2.blahblah.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Board2 {
	
	private int board_No;
	private int type_No;
	private int mem_No;
	private int category_No;
	private String board_Title;
	private String board_Content;
	private Date board_Date;
	private String board_Status;
	private int board_View;
	private String board_Url;
	private Date board_Start;
	private Date board_End;
	private Date board_Announce;
	
	private String category_Name;
	private int comm_Count;
	private String mem_Nick;
	private int file_Count;
	private String type_Name;
	
	// 게시글 비활성화/상태 여부를 위한 매개변수 생성자 by yeori
	public Board2(int board_No, String board_Status) {
		super();
		this.board_No = board_No;
		this.board_Status = board_Status;
	}
	
	


}
