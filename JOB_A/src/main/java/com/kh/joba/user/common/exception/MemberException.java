package com.kh.joba.user.common.exception;
/**
 * @author yey95
 *
 */
public class MemberException extends Exception {
	
	public MemberException() { }
	
	public MemberException(String message) {
		super("회원 에러 : " + message);
	}
	
}
