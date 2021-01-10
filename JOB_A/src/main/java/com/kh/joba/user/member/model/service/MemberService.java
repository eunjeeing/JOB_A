package com.kh.joba.user.member.model.service;

import java.util.List;

import com.kh.joba.user.category.model.vo.WishCategory;
import com.kh.joba.user.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member); 

	Member selectOneMember(String memId);

	int updateMember(Member member);

	Member checkIdDuplicate(String memId);

	int deleteMember(String memId);

	Member checkNicknameDuplicate(String memNick);

	void insertWishCategory(int mem_No, int[] category_No);

	List<WishCategory> selectWishCategory(int memNo);

	void deleteWishCategory(int memNo);
}
