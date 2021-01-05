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
	


}
