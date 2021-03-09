package com.kh.joba.user.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.joba.admin.management.model.service.AdminService;
import com.kh.joba.admin.management.model.vo.Admin;
import com.kh.joba.user.bookmark.model.service.BookmarkService;
import com.kh.joba.user.category.model.vo.WishCategory;
import com.kh.joba.user.common.exception.MemberException;
import com.kh.joba.user.member.model.service.MemberService;
import com.kh.joba.user.member.model.vo.Member;
import com.kh.joba.user.mypage.model.service.MypageService;
import com.kh.joba.user.myscrap.model.service.MyScrapService;


@SessionAttributes(value= {"member"})
@Controller
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private AdminService adminService;
	
	@Autowired
	MypageService ms;
	
	@Autowired
	MyScrapService mss;
	
	@Autowired
	BookmarkService bs;

	@Autowired
	private JavaMailSender mailSender;
	
	// 로그인 페이지 접속
	@RequestMapping("login.do")
	public String loginForm(Model model) {
		Member m = (Member) model.getAttribute("member");
		
		System.out.println("멤버정보:"+m);
		System.out.println("로그인페이지 접속ok");
		
		if(m != null) {
			
			return "index";
		} 
		
		return "user/member/login";
	}
	
   // 로그인 
   @RequestMapping("/member/memberLogin.do")
   public String memberLogin(
		   			   @RequestParam String memId,
                       @RequestParam String memPw,
                       Model model) {
      System.out.println("member/memberLogin.do 접속 ok");
      
         String loc = "/login.do";
         String msg = "";
         
         Member m = memberService.selectOneMember(memId);
         
         if(m == null) {
            msg = "회원가입 해주셨나요? 존재하지 않는 아이디입니다 ㅠ_ㅠ";
         } else {
            if(bcryptPasswordEncoder.matches(memPw, m.getMemPw()) && m.getMemState() != 2){
               model.addAttribute("member", m);
               return "redirect:/";
               
            } else {
               msg = "로그인 실패 ㅠ_ㅠ";
               
            } 
         }
         
         model.addAttribute("msg", msg);
         model.addAttribute("loc", loc);
      
      return "user/common/msg";
   }
	
	// 회원가입 페이지 접속
	@RequestMapping("join.do")
	public String joinForm() {
		System.out.println("회원가입 페이지 접속 ok");
		
		return "user/member/enroll";
	}
	
	// 회원가입
	@RequestMapping("memberEnroll.do")
	public String memberEnorll(Member member, WishCategory WishCategory, Model model) throws MemberException {
		System.out.println("memberEnroll : " + member);
		System.out.println("wishCategory : " + WishCategory);
	
		String plainPassword = member.getMemPw();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword); 
		System.out.println("gradeNo: " + member.getGradeNo());
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		member.setMemPw(encryptPassword);
		
		try {
			int result = memberService.insertMember(member);
			
			String loc="/";
			String msg="";
			
			if(result > 0) msg = "취뽀 성공해요!";
			else msg = "어쩌죠~ 다시 시도해주세요!";
		
			 Member m = memberService.selectOneMember(member.getMemId());
			
				
			memberService.insertWishCategory(m.getMemNo(),WishCategory.getCategory_No());
							
			 
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg); 
			model.addAttribute("member", m);

			System.out.println("loc : " + loc); 
			
		} catch(Exception e) {
			System.out.println("회원가입 에러 발생!!");
			
			throw new MemberException(e.getMessage());
		}
		
		return "user/common/msg";
	}
	
	// 로그아웃 (header.jsp에 있음)
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		
		if(! sessionStatus.isComplete()) {
			sessionStatus.setComplete();
			
		System.out.println("로그아웃 ok");
		}
		
		return "redirect:/";
		
	}
	
	// 마이페이지 접속
	@RequestMapping("/member/myPage.do")
	public String mypage(Model model) {
	    
		Member member = (Member) model.getAttribute("member");
		System.out.println(member);
		
		Admin admin = new Admin(member.getMemNo(), member.getGradeNo(), member.getMemId(), 
								member.getMemPw(), member.getMemName(), member.getMemPhone(), 
								member.getMemEmail(), member.getMemNick(), member.getMemDate());
		
		System.out.println("마이페이지 접속 ok");
		System.out.println("member : " + member);
		
		int result = bs.deleteAllBookmark();
		int myPostTotalContents = ms.selectMyPostTotalContents(member.getMemNo());
		int myCommentTotalContents = ms.selectMyCommentTotalContents(member.getMemNo());
		int myScrapTotalContents = mss.selectMyScrapTotalContents(member.getMemNo());
		
		model.addAttribute("myPostTotalContents", myPostTotalContents);
		model.addAttribute("myCommentTotalContents", myCommentTotalContents);
		model.addAttribute("myScrapTotalContents", myScrapTotalContents);
		
		if(member.getGradeNo()== 0 || member.getGradeNo()==1) {
			
			System.out.println("admin 정보 : " + admin);
			
			model.addAttribute("admin", admin);
			return "admin/management/adminUpdateView";
			
		}
		
		return "user/member/myPage";
		
	}

	/* 아이디 중복 체크*/
	@RequestMapping("/member/idCheckDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(@RequestParam String memId){
		System.out.println("아이디중복 확인되나?");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean checkId = memberService.checkIdDuplicate(memId) == null ? true : false;
		
		map.put("checkId", checkId);
		
		return map;
		
	}

	/* 닉네임 중복 체크 */
	@RequestMapping("/member/checkNicknameDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkNicknameDuplicate(@RequestParam String memNick){
		System.out.println("1번");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = memberService.checkNicknameDuplicate(memNick) == null ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}

    /* 이메일 인증 */
    @RequestMapping(value="/member/emailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        System.out.println("이메일 데이터 전송 확인");
        System.out.println("인증번호 : " + email);
                
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호 : " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "johnsara94@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }

        String num = Integer.toString(checkNum);
        
        return num;
    }
	
    // 회원 정보 수정 페이지
    @RequestMapping("/member/memberView.do")
    public String memberUpdate( Model model) {
    	    	
    	Member m = (Member) model.getAttribute("member");
    	System.out.println("마이페이지 멤버뷰"+m);
    	model.addAttribute("member", m);
    	
    	List<WishCategory> ws = new ArrayList<WishCategory>();
    	
     	ws = memberService.selectWishCategory(m.getMemNo());
     	model.addAttribute("wishcategory", ws);
     	
    	System.out.println("회원정보 수정페이지 wishcategory : " + ws.toString());
    	
    	return "user/member/memberView";
    	
    }
    
    // 회원정보수정 버튼
    @RequestMapping("/member/memberUpdated.do")
    public String memberUpdate(Member member, WishCategory WishCategory, Model model) throws MemberException{
		System.out.println("컨트롤러 버튼에서 member : " + member);
    	System.out.println("컨트롤러에서 WishCategory : " + WishCategory);
    	
		String plainPassword = member.getMemPw();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword); 
		System.out.println("gradeNo: " + member.getGradeNo());
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		member.setMemPw(encryptPassword);
	
  
    	int result = memberService.updateMember(member);
    
    	memberService.deleteWishCategory(member.getMemNo());
    	memberService.insertWishCategory(member.getMemNo(),WishCategory.getCategory_No());

    	String loc = "/member/myPage.do";
    	String msg = "";
    	
    	if(result > 0) {
    		msg = "회원 정보 수정 성공";
    		model.addAttribute("member", member);
    		System.out.println("컨트롤러에서 업데이트 된 member : " + member.toString());
    		
    	} else {
    		msg = "회원 정보 수정 실패";
    	}
    	
    	model.addAttribute("loc", loc);
    	model.addAttribute("msg", msg);
    	
    	return "user/common/msg";
    }
    
    // 회원 탈퇴
    @RequestMapping("member/memberDelete.do")
    public String memberDelete(SessionStatus sessionStatus, Model model, Member member) {
    	
    	int result = memberService.deleteMember(member.getMemId());
    
    	if(result > 0) sessionStatus.setComplete(); 
    	
    	String loc = "/";
    	String msg = "";
    	
    	if(result > 0) msg = "그동안 JOBA를 이용해주셔서 감사합니다.";
    	else msg = "회원 탈퇴를 실패하였습니다.";
    	
    	model.addAttribute("loc", loc);
    	model.addAttribute("msg", msg);
    	
    	return "user/common/msg";
    }
}
