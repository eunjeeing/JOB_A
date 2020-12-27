package com.kh.joba.user.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.joba.user.common.exception.MemberException;
import com.kh.joba.user.member.model.service.MemberService;
import com.kh.joba.user.member.model.vo.Member;


@SessionAttributes(value= {"member"})
@Controller
public class MemberController {

	// 비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 페이지 접속
	@RequestMapping("login.do")
	public String loginForm() {
		System.out.println("로그인페이지 접속ok");
		
		return "/member/login";
	}
	
   // 로그인 
   @RequestMapping("/member/memberLogin.do")
   public String memberLogin(@RequestParam String memId,
                       @RequestParam String memPw,
                       Model model) {
      System.out.println("member/memberLogin.do 접속 ok");
      
         String loc = "/";
         String msg = "";
         
         Member m = memberService.selectOneMember(memId);
         
         if(m == null) {
            msg = "존재하지 않는 아이디입니다.";
         } else {
            if(bcryptPasswordEncoder.matches(memPw, m.getMemPw())){
               msg = "로그인에 성공하였습니다!";
               model.addAttribute("member", m);
               
            } else {
               msg = "비밀번호가 일치하지 않습니다!";
               
            }
         }
         
         model.addAttribute("msg", msg);
         model.addAttribute("loc", loc);
      
      return "index";
   }
	
	// 회원가입 페이지 접속
	@RequestMapping("join.do")
	public String joinForm() {
		System.out.println("회원가입 페이지 접속 ok");
		
		return "/member/enroll";
	}
	
	// 회원가입
	@RequestMapping("memberEnroll.do")
	public String memberEnorll(Member member, Model model) throws MemberException {
		System.out.println("memberEnroll : " + member);
		
	
		String plainPassword = member.getMemPw();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword); // 비밀번호 암호화
		
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		member.setMemPw(encryptPassword);
		
		try {
			
			int result = memberService.insertMember(member);
			
			String loc="/";
			String msg="";
			
			if(result > 0) msg = "취뽀 성공해요!";
			else msg = "어쩌죠~ 다시 시도해주세요!";
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg); 
		
			System.out.println("loc : " + loc);
			
		} catch(Exception e) {
			System.out.println("회원가입 에러 발생!!");
			
			throw new MemberException(e.getMessage());
		}
		
		return "user/common/msg";
	}
	
	

	
	
}
