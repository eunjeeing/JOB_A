package com.kh.joba.user.member.model.dao;

import java.util.HashMap;

import com.kh.joba.user.member.model.vo.Member;

public interface MemberDAO {
	
	int insertMember(Member member); 

	Member selectOneMember(String memId);

	int updateMember(Member member);

	Member checkIdDuplicate(String memId);

	int deleteMember(String memId);

	Member checkNicknameDuplicate(String memNick);

	void insertWishCategory(int mem_No, int[] category_No);
}
