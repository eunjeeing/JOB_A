package com.kh.joba.user.comments2.model.vo;

import java.sql.Date;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Comments2 {
	
	private int comm_No;
	private int board_No;
	private String comm_Content;
	private int comm_Level;
	private int comm_Ref;
	private String comm_Status;
	private Date comm_Date;

}
