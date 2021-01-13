package com.kh.joba.user.bookmark.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Bookmark {
	private int board_no;
	private int mem_no;
	private int type_no;
	private String keyword;
}
