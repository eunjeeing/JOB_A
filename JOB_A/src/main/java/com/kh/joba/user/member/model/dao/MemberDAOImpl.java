package com.kh.joba.user.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		// TODO Auto-generated method stub
		return 0;
	}

	// 아이디 중복 체크
	@Override
	public int checkIdDuplicate(String memId) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 회원 정보 삭제 - 탈퇴
	@Override
	public int deleteMember(String memId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
