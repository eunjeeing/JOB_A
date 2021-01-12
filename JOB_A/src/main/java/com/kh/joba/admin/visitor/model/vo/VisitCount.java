package com.kh.joba.admin.visitor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class VisitCount {
	
	 private String visit_id;	// 접속 번호
	 private String visit_ip;	// 접속 아이피
     private String visit_time;	// 접속 접속시간
     private String visit_agent; // 접속 브로우저 
     }
