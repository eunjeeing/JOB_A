package com.kh.joba.admin.report.model.vo;

import java.sql.Date;

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
public class Report {
	
	private int reportNo; 			//신고번호
	private int memNo;	  			// 신고자
	private int boardNo; 	 		// 게시글 번호
	private int commNo;   			// 댓글 번호
	// private int memNo2;   		// 회원 번호(신고당한자)
	private String reportReason;	// 신고사유
	private Date reportDate; 		// 신고일자
	
}
