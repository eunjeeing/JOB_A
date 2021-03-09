package com.kh.joba.user.search.model.vo;

import java.sql.Date;

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
public class Search {
	private int board_No;
	private int type_No;
	private int mem_No;
	private String board_Title;
	private String board_Content;
	private Date board_Date;
	private String board_Status;
	private int board_View;
	
	private String type_Name;
	private int comm_Count;
	private String mem_Nick;
	private int file_Count;
}
