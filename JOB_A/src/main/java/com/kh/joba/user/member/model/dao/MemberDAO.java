package com.kh.joba.user.member.model.dao;

import com.kh.joba.user.member.model.vo.Member;

public interface MemberDAO {
	
	int insertMember(Member member); 

	Member selectOneMember(String memId);

	int updateMember(Member member);

	int checkIdDuplicate(String memId);

	int deleteMember(String memId);
}
