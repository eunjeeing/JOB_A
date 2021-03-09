package com.kh.joba.user.attachment.model.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Attachment {
	
	private int file_No;
	private int board_No;
	private String file_Origin;
	private String file_Changed;
	private String file_Path;

}
