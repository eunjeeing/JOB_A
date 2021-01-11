package com.kh.joba.user.comments2.model.vo;


import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Comments2 {
	
	private int comm_No;
	private int mem_No;
	private int board_No;
	private String comm_Content;
	private int comm_Level;
	private int comm_Ref;
	private String comm_Status;
	private String comm_Date;
	
	private String mem_Nick;
	private int type_No;
	private String board_Title;
	

}
