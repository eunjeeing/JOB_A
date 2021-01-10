package com.kh.joba.admin.management.model.vo;

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
public class Admin {

	private int adminNo; // 회원번호
	private int gradeNo; // 등급번호
	private String adminId; // 아이디
	private String adminPw; // 비밀번호
	private String adminName; // 이름
	private String adminPhone; // 연락처
	private String adminEmail; // 이메일
	private String adminNick; // 닉네임
	private Date enrollDate; // 등록일
}


// 관리자 등록날짜, 이름 디비에 추가?
// 관리자 이메일 -> 사내이메일로 통일?

// 회원가입시 가입경로 설문? -> 통계에 사용



		