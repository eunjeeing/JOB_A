package com.kh.joba.user.board.model.vo;

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
public class Attachment1 {
	private int file_no;
	private int board_no;
	private String file_origin;
	private String file_changed;
	private String file_path;
}
