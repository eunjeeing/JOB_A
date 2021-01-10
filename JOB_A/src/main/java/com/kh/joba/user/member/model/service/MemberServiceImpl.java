package com.kh.joba.user.member.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.category.model.vo.WishCategory;
import com.kh.joba.user.member.model.dao.MemberDAO;
import com.kh.joba.user.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	// 회원가입 
	@Override
	public int insertMember(Member member) {  

		return memberDAO.insertMember(member);
	}

	// 회원 로그인 
	@Override
	public Member selectOneMember(String memId) {
		return memberDAO.selectOneMember(memId);
	}

	// 회원 정보 수정
	@Override
	public int updateMember(Member member) {
	
		return memberDAO.updateMember(member);
	}

	// 아이디 중복 확인
	@Override
	public Member checkIdDuplicate(String memId) {
	
		return memberDAO.checkIdDuplicate(memId);
	}

	// 회원 탈퇴
	@Override
	public int deleteMember(String memId) {
		
		return memberDAO.deleteMember(memId);
	}

	// 닉네임 중복 확인
	@Override
	public Member checkNicknameDuplicate(String memNick) {
		//HashMap<String, Object> hmap = new HashMap<String, Object>();
		//hmap.put("memNick", memNick);
		//System.out.println("service = " + memNick);
		return memberDAO.checkNicknameDuplicate(memNick);
	}

	// 선호직종 입력
	@Override
	public void insertWishCategory(int mem_No, int[] category_No) {// WishCategory까지 받는다 치고 여기서 반복문을 돌려야 합니다.
		System.out.println("memNo "+ mem_No + " category+No : " + category_No);
		for (int category_no : category_No ) {
			System.out.println("category_no:"+category_no);
			memberDAO.insertWishCategory(mem_No, category_no);
		}  //이런 식으로 선택한 카테고리 갯수만큼 반복 시켜야 해요!
		
		
	}

	// 회원정보수정페이지에서 DB에 있는 선호직종 가져오기
	@Override
	public List<WishCategory> selectWishCategory(int memNo) {
	
		
		return memberDAO.selectWishCategory(memNo);
	}
	//선호직종 삭제
	@Override
	public void deleteWishCategory(int memNo) {
		memberDAO.deleteWishCategory(memNo);
	}

}
