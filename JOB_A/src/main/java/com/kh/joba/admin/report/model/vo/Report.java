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
	
	private int reportNo; 			// 신고번호
	private int memNo;	  			// 신고자
	private int boardNo; 	 		// 게시글 번호
	private int commNo;				// 댓글 번호
	private String reportReason;	// 신고사유
	private Date reportDate; 		// 신고일자
	private int memNo2;   			// 회원 번호(신고당한자:피신고자)
	
	public Report(int memNo, int boardNo, String reportReason, int memNo2) {
		super();
		this.memNo = memNo;
		this.boardNo = boardNo;
		this.reportReason = reportReason;
		this.memNo2 = memNo2;
	}

	public Report(int memNo, int boardNo, int commNo, String reportReason, int memNo2) {
		super();
		this.memNo = memNo;
		this.boardNo = boardNo;
		this.commNo = commNo;
		this.reportReason = reportReason;
		this.memNo2 = memNo2;
	}



	
	
	
}
