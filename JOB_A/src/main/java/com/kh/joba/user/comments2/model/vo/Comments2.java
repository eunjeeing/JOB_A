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
	private int comm_ReportNum;
	private String mem_Nick;
	private int type_No;
	private String board_Title;
	
	
	// 댓글 비활성화/상태 여부 위한 객체
	public Comments2(int comm_No, String comm_Status) {
		super();
		this.comm_No = comm_No;
		this.comm_Status = comm_Status;
	}
	

}
