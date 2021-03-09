package com.kh.joba.user.common.exception;

public class BoardException extends RuntimeException {
	
	public BoardException() { }
	
	public BoardException(String message) {
		super("게시글 에러 : " + message);
	}

}
