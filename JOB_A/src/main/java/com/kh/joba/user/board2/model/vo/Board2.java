package com.kh.joba.user.board2.model.vo;

import java.sql.Date;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Board2 {
	
	private int boardNo;
	private int typeNo;
	private int memNo;
	private int categoryNo;
	private String boardType;
	private String boardContent;
	private Date boardDate;
	private String boardStatus;
	private int boardView;
	private String boardUrl;

}
