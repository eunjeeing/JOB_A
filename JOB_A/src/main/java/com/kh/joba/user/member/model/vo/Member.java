package com.kh.joba.user.member.model.vo;

import java.io.Serializable;
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
public class Member implements Serializable{
	
	private static final long serialVersionUID = 1741L;
	
	private int memNo;
	private int gradeNo;
	private String memId;
	private String mempw;
	private String memNick;
	private String mememail;
	private Date membirth;
	private String memarea;
	private int memState;
}
