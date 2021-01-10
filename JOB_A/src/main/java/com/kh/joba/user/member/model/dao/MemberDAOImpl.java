package com.kh.joba.user.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.category.model.vo.WishCategory;
import com.kh.joba.user.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 회원가입
	@Override
	public int insertMember(Member member) {
		
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	// 로그인
	@Override
	public Member selectOneMember(String memId) {
		Member m = sqlSession.selectOne("memberMapper.loginMember", memId);
		System.out.println("DAO Member m : " + m);
		return m;
	}

	// 회원정보 수정
	@Override
	public int updateMember(Member member) {

		return sqlSession.update("memberMapper.updateMember", member);
	}

	// 아이디 중복 체크
	@Override
	public Member checkIdDuplicate(String memId) {
		
		System.out.println("dao : " + memId);
		Member m = sqlSession.selectOne("memberMapper.checkIdDuplicate", memId);
		
		System.out.println("리턴 값 : " + m);
		return m;
	}

	// 회원 탈퇴
	@Override
	public int deleteMember(String memId) {
		
		return sqlSession.delete("memberMapper.deleteMember", memId);
	}

	// 닉네임 중복 체크
	@Override
	public Member checkNicknameDuplicate(String memNick) {
		
		System.out.println("dao : " + memNick);
		Member m= sqlSession.selectOne("memberMapper.checkNicknameDuplicate", memNick);
		
		System.out.println("리턴값 :" + m);
		return m;
	}

	// 선호 직종 삽입
	@Override
	public void insertWishCategory(int mem_No, int resultCategory) {
				WishCategory wish = new WishCategory(mem_No, resultCategory);
				
		sqlSession.insert("memberMapper.insertWishCategory",wish);
		
	}


	// 회원정보수정페이지에서 DB에 있는 선호직종 가져오기
	@Override
	public List<WishCategory> selectWishCategory(int memNo) {
		
		List<WishCategory> ws = new ArrayList<WishCategory>();
		
		ws = sqlSession.selectList("memberMapper.selectWishCategory", memNo);
		
		return ws;
	}
	// 관심직종 삭제
	@Override
	public void deleteWishCategory(int memNo) {
		sqlSession.delete("memberMapper.deleteWishCategory", memNo);
	}

}
