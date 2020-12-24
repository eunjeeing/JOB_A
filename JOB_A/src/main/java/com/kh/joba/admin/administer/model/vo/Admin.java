package com.kh.joba.admin.administer.model.vo;

import java.util.Date;

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
public class Admin {

	private int adminNo;
	private int gradeNo;
	private String adminId;
	private String adminPw;
	private String adminNick;
	private String adminEmail;
	private String adminPhone;
	private Date enrollDate;
}


// 관리자 등록날짜, 이름 디비에 추가?
// 관리자 이메일 -> 사내이메일로 통일?

// 회원가입시 가입경로 설문? -> 통계에 사용



		