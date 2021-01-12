package com.kh.joba.user.board.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.board.model.service.Board1Service;
import com.kh.joba.user.board.model.vo.Board1;
import com.kh.joba.user.board.model.vo.Comment1;
import com.kh.joba.user.bookmark.model.service.BookmarkService;
import com.kh.joba.user.bookmark.model.vo.Bookmark;
import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.common.util.UtilsBoard1;
import com.kh.joba.user.member.model.vo.Member;

@Controller
public class Board1Controller {
	
	@Autowired
	Board1Service bs;
	
	@Autowired
	Comments2Service cs;
	
	@Autowired
	BookmarkService ms;
	
	// *********************************************************************************************
	// 							Write Form Controller Area
	// *********************************************************************************************
	@RequestMapping("/noticeWrite.bo")
	public String noticeForm() {
		return "user/board/notice/noticeInsertForm";
	}
	@RequestMapping("/interviewWrite.bo")
	public String interviewForm() {
		return "user/board/review/interview/interviewInsertForm";
	}
	@RequestMapping("/acceptWrite.bo")
	public String acceptForm() {
		return "user/board/review/interview/acceptInsertForm";
	}
	@RequestMapping("/mentoWrite.bo")
	public String mentoForm() {
		return "user/board/mento/mentoInsertForm";
	}
	@RequestMapping("/tomorrowWrite.bo")
	public String tomorrowForm() {
		return "user/board/tomorrow/tomorrowInsertForm";
	}
	
	
	
	// *******************************************************************************************
	// 							Notice Controller Area
	// *******************************************************************************************
	
	@RequestMapping("/notice.bo")
	public String noticeList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectNoticeList(cPage, numPerPage);
		int totalContents = bs.selectNoticeTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "notice.bo");
		
		// 조회확인용
		System.out.println("list : " + list);
		System.out.println("test");
		
		model.addAttribute("noticeList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/notice/notice"; 
	}
	@RequestMapping("/searchNotice.bo")
	public String searchNotice(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchNoticeList(cPage, numPerPage, keyword);
		int totalContents = bs.searchNoticeTotalContents(keyword);
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchNotice.bo?keyword="+keyword);
		
		// 조회확인용
		System.out.println("keyword : " + keyword);
		//System.out.println("totalContents : " + totalContents);
		//System.out.println("list : " + list);
	
		model.addAttribute("noticeList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		//model.addAttribute("keyword", keyword);
		
		return "user/board/notice/notice"; 
	}	
	@RequestMapping("/selectOneNotice.bo")
	public String selectOneNotice(@RequestParam int board_no, Model model) { 
		System.out.println("[selectOneNotice] board_no : " + board_no);
		Board1 notice = bs.selectOneNotice(board_no);
		//System.out.println("Notice : " + notice);
		model.addAttribute("notice", notice);

		return "user/board/notice/noticeView"; 
	}
	@RequestMapping("/noticeUpdateForm.bo")
	public String updateViewNotice(@RequestParam int board_no, Model model) {
		Board1 notice = bs.updateViewNotice(board_no);
		model.addAttribute("notice", notice);
		
		return "user/board/notice/noticeUpdateForm";
	}
	@RequestMapping("/updateNotice.bo")
	public String updateNotice(Board1 notice, HttpServletRequest req, Model model) {
		
		int board_no = notice.getBoard_no();
		Board1 originalNotice = bs.updateViewNotice(board_no);
		originalNotice.setBoard_title(notice.getBoard_title());
		originalNotice.setBoard_content(notice.getBoard_content());

		int result = bs.updateNotice(notice);
		String loc = "/notice.bo";
		String msg = "";
		
		if (result > 0) {
			msg = "공지사항 수정 성공";
		} else {
			msg = "공지사항 수정 실패...";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "user/common/msg";
	}
	@RequestMapping("/noticeDelete.bo")
	public String deleteNotice(@RequestParam int board_no, Model model) {
		System.out.println("[deleteNotice] board_no : " + board_no);
		
		int result = bs.deleteNotice(board_no);
		
		String loc = "/notice.bo";
		String msg = "";
		
		if ( result > 0 ) {
			msg = "공지사항 삭제 완료";
		} else {
			msg = "공지사항 삭제 실패.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "user/common/msg";
	}
	@RequestMapping("/insertNotice.bo")
	public String insertNotice(Board1 notice, Model model) {
		System.out.println("[insertNotice] board_title : " + notice.getBoard_title());
		int result = bs.insertNotice(notice);
		
		return "redirect:notice.bo";
	}
	
	

	// *******************************************************************************************
	// 							Mentoring Controller Area
	// *******************************************************************************************
	@RequestMapping("/mentoList.bo")
	public String mentowList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model, HttpSession session) {
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectMentoList(cPage, numPerPage);
		int totalContents = bs.selectMentoTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "mentoList.bo");
		if (session.getAttribute("member")!= null) {
			Member mem = (Member)session.getAttribute("member");
			List<Bookmark> bookmarkList = ms.selectAllBookmark(mem.getMemNo());
			model.addAttribute("bookmarkList", bookmarkList);			
		}
		
		model.addAttribute("mentoList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/mento/mentoList"; 
	}
	
	@RequestMapping("/selectOneMento.bo")
	public String mentoView(@RequestParam int board_no, Model model, HttpSession session) {
		Board1 mento = bs.selectOneMento(board_no);
		List<Comments2> commentList = cs.selectComment(board_no);
		Member mem = (Member)session.getAttribute("member");
		Bookmark isBookmark = new Bookmark(board_no, mem.getMemNo(), 0);
		Bookmark bookmark = ms.selectOneBookmark(isBookmark);
		
		model.addAttribute("bookmark", bookmark);

		model.addAttribute("mento", mento);
		model.addAttribute("commentList", commentList);
		//model.addAttribute("bookmarkList", bookmark);
		
		return "user/board/mento/mentoView";
	}
	
	@RequestMapping("/searchMentoList.bo")
	public String searchMentoList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model, HttpSession session) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchMentoList(cPage, numPerPage, changeToUpper(keyword));
		int totalContents = bs.searchMentoTotalContents(changeToUpper(keyword));
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchMentoList.bo?keyword="+changeToUpper(keyword));
		
		if (session.getAttribute("member") != null) {
			Member mem = (Member)session.getAttribute("member");
			List<Bookmark> bookmarkList = ms.selectAllBookmark(mem.getMemNo());
			model.addAttribute("bookmarkList", bookmarkList);			
		}
		
		model.addAttribute("mentoList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/mento/mentoList"; 
	}
	
	@RequestMapping("/mentoUpdateForm.bo")
	public String mentoUpdateForm (@RequestParam int board_no, Model model) {
		Board1 mento = bs.selectOneMento(board_no);
		model.addAttribute("mento", mento);		
		
		return "user/board/mento/mentoUpdateForm";
	}
	
	@RequestMapping("/mentoUpdate.bo")
	public String mentoUpdate(Board1 mento, Model model) {
			
		int result = bs.mentoUpdate(mento);
		String msg = "";
		String loc = "";
		
		if (result > 0) {
			loc = "/mentoView.bo?board_no=" + mento.getBoard_no();
			msg = "게시글 수정 성공";
		} else {
			msg = "게시글 수정 실패";
		}	
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
	
		return "user/common/msg";
	}
	
	@RequestMapping("/mentoDelete.bo")
	public String mentoDelete(@RequestParam int board_no, Model model /*,@RequestParam int type_no, #@RequestParam int mem_no*/) {
		int result1 = bs.mentoDelete(board_no);
		//int result2 = ms.bookmarkDelete(board_no, mem_no, type_no);
		return "redirect:mentoList.bo";
	}
	
	@RequestMapping("/mentoInsert.bo")
	public String mentoInsert(Board1 mento, Model model) {
		int result = bs.mentoInsert(mento);
		return "redirect:mentoList.bo";
	}
	
	
	
	// *******************************************************************************************
	// 							UntilTomorrow Controller Area
	// *******************************************************************************************
	@RequestMapping("/tomorrowList.bo")
	public String tomorrowList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model, HttpSession session) {
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectTomorrowList(cPage, numPerPage);
		int totalContents = bs.selectTomorrowTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "tomorrowList.bo");
		
		if (session.getAttribute("member") != null) {
			Member mem = (Member)session.getAttribute("member");
			List<Bookmark> bookmarkList = ms.selectAllBookmark(mem.getMemNo());
			model.addAttribute("bookmarkList", bookmarkList);					
		}
		
		model.addAttribute("tomorrowList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/tomorrow/tomorrowList"; 
	}
	
	@RequestMapping("/selectOneTomorrow.bo")
	public String tomorrowView(@RequestParam int board_no, Model model, HttpSession session) {
		Board1 tomorrow = bs.selectOneTomorrow(board_no);
		List<Comments2> commentList = cs.selectComment(board_no);
		Member mem = (Member)session.getAttribute("member");
		Bookmark isBookmark = new Bookmark(board_no, mem.getMemNo(), 0);
		Bookmark bookmark = ms.selectOneBookmark(isBookmark);
		
		model.addAttribute("bookmark", bookmark);
		model.addAttribute("tomorrow", tomorrow);
		model.addAttribute("commentList", commentList);
		
		return "user/board/tomorrow/tomorrowView";
	}
	
	@RequestMapping("/searchTomorrowList.bo")
	public String searchTomorrowList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model, HttpSession session) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchTomorrowList(cPage, numPerPage, changeToUpper(keyword));
		int totalContents = bs.searchTomorrowTotalContents(changeToUpper(keyword));
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchTomorrowList.bo?keyword="+changeToUpper(keyword));
		
		if (session.getAttribute("member") != null) {
			Member mem = (Member)session.getAttribute("member");
			List<Bookmark> bookmarkList = ms.selectAllBookmark(mem.getMemNo());
			model.addAttribute("bookmarkList", bookmarkList);			
		}
		
		model.addAttribute("tomorrowList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/tomorrow/tomorrowList"; 
	}
	
	@RequestMapping("/tomorrowUpdateForm.bo")
	public String tomorrowUpdateForm (@RequestParam int board_no, Model model) {
		Board1 mento = bs.selectOneTomorrow(board_no);
		model.addAttribute("tomorrow", mento);		
		
		return "user/board/tomorrow/tomorrowUpdateForm";
	}
	
	@RequestMapping("/updateTomorrow.bo")
	public String tomorrowUpdate(Board1 tomorrow, Model model) {
			
		int result = bs.tomorrowUpdate(tomorrow);
		String msg = "";
		String loc = "";
		
		if (result > 0) {
			loc = "/tomorrowView.bo?board_no=" + tomorrow.getBoard_no();
			msg = "게시글 수정 성공";
		} else {
			msg = "게시글 수정 실패";
		}	
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
	
		return "user/common/msg";
	}
	
	@RequestMapping("/tomorrowDelete.bo")
	public String tomorrowDelete(@RequestParam int board_no, Model model /*,@RequestParam int type_no, #@RequestParam int mem_no*/) {
		int result1 = bs.tomorrowDelete(board_no);
		//int result2 = ms.bookmarkDelete(board_no, mem_no, type_no);
		return "redirect:tomorrowList.bo";
	}
	
	@RequestMapping("/tomorrowInsert.bo")
	public String tomorrowInsert(Board1 tomorrow, Model model) {
		int result = bs.tomorrowInsert(tomorrow);
		return "redirect:tomorrowList.bo";
	}
	
	
	
	// *******************************************************************************************
	// 							InterviewReview Controller Area
	// *******************************************************************************************
	@RequestMapping("/interviewList.bo")
	public String interviewList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			HttpSession session,
			Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectInterviewList(cPage, numPerPage);
		int totalContents = bs.selectInterviewTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "interviewList.bo");
		
		if (session.getAttribute("member") != null) {
			Member mem = (Member)session.getAttribute("member");
			List<Bookmark> bookmarkList = ms.selectAllBookmark(mem.getMemNo());
			model.addAttribute("bookmarkList", bookmarkList);			
		}
		
		model.addAttribute("interviewList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/review/interview/interviewList"; 
	}
	
	@RequestMapping("/selectOneInterview.bo")
	public String selectOneInterview(@RequestParam int board_no, Model model, HttpSession session) {
		//System.out.println("Interview select One controller : " + board_no);
		Board1 interview = bs.selectOneInterview(board_no);
		List<Comments2> commentList = cs.selectComment(board_no);
		
		Member mem = (Member)session.getAttribute("member");
		Bookmark isBookmark = new Bookmark(board_no, mem.getMemNo(), 0);
		Bookmark bookmark = ms.selectOneBookmark(isBookmark);
		
		model.addAttribute("bookmark", bookmark);
		model.addAttribute("interview", interview);
		model.addAttribute("commentList", commentList);
		
		return "user/board/review/interview/interviewView";
	}
	
	@RequestMapping("/interviewUpdateForm.bo")
	public String interviewUpdateForm (@RequestParam int board_no, Model model) {
		Board1 interview = bs.selectOneInterview(board_no);
		
		String oriTitle = interview.getBoard_title();
		int target = oriTitle.indexOf("[");
		String mainTitle = oriTitle.substring(oriTitle.indexOf("[")+1, oriTitle.indexOf("]")).trim();
		String subTitle = oriTitle.substring(oriTitle.indexOf("]")+1).trim();
		
		interview.setBoard_mainTitle(mainTitle);
		interview.setBoard_title(subTitle);
		
		//System.out.println("mainTitle :" + mainTitle.trim());
		//System.out.println("subTitle :" + subTitle.trim());
		
		
		model.addAttribute("interview", interview);		
		return "user/board/review/interview/interviewUpdateForm";
	}
	
	@RequestMapping("/interviewUpdate.bo")
	public String interviewUpdate(@RequestParam String board_mainTitle, Board1 interview, Model model) {
		
		interview.setBoard_title("[" + changeToUpper(board_mainTitle) + "] " + interview.getBoard_title());
		
		int result = bs.interviewUpdate(interview);
		String msg = "";
		String loc = "";
		
		if (result > 0) {
			loc = "/selectOneInterview.bo?board_no=" + interview.getBoard_no();
			msg = "게시글 수정 성공";
		} else {
			msg = "게시글 수정 실패";
		}	
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
	
		return "user/common/msg";
	}
	
	@RequestMapping("/interviewDelete.bo")
	public String interviewDelete(@RequestParam int board_no, Model model) {
		int result = bs.interviewDelete(board_no);
		return "redirect:interviewList.bo";
	}
	
	@RequestMapping("/interviewInsert.bo")
	public String interviewInsert(@RequestParam String board_mainTitle, Board1 interview, Model model) {
		interview.setBoard_title("[" + changeToUpper(board_mainTitle) + "] " + interview.getBoard_title());
		int result = bs.interviewInsert(interview);
		return "redirect:interviewList.bo";
	}
	
	@RequestMapping("/searchInterview.bo")
	public String searchInterview(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model, HttpSession session) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchInterviewList(cPage, numPerPage, changeToUpper(keyword));
		int totalContents = bs.searchInterviewTotalContents(changeToUpper(keyword));
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchInterview.bo?keyword="+changeToUpper(keyword));
		
		if (session.getAttribute("member") != null) {
			Member mem = (Member)session.getAttribute("member");
			List<Bookmark> bookmarkList = ms.selectAllBookmark(mem.getMemNo());
			model.addAttribute("bookmarkList", bookmarkList);			
		}
		
		model.addAttribute("interviewList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/review/interview/interviewList"; 
	}	
	
	
	// *******************************************************************************************
	// 							AcceptanceReview Controller Area
	// *******************************************************************************************
	@RequestMapping("/acceptList.bo")
	public String acceptList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, HttpSession session,
			Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectAcceptList(cPage, numPerPage);
		int totalContents = bs.selectAcceptTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "acceptList.bo");
		if (session.getAttribute("member") != null) {
			Member mem = (Member)session.getAttribute("member");
			List<Bookmark> bookmarkList = ms.selectAllBookmark(mem.getMemNo());
			model.addAttribute("bookmarkList", bookmarkList);			
		}
		model.addAttribute("acceptList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/review/acceptance/acceptList"; 
	}
	
	@RequestMapping("/selectOneAccept.bo")
	public String selectOneAccept(@RequestParam int board_no, Model model, HttpSession session) {
		//System.out.println("Interview select One controller : " + board_no);
		Board1 accept = bs.selectOneAccept(board_no);
		List<Comments2> commentList = cs.selectComment(board_no);
		
		Member mem = (Member)session.getAttribute("member");
		Bookmark isBookmark = new Bookmark(board_no, mem.getMemNo(), 0);
		Bookmark bookmark = ms.selectOneBookmark(isBookmark);
		
		model.addAttribute("bookmark", bookmark);	
		model.addAttribute("accept", accept);
		model.addAttribute("commentList", commentList);
		
		return "user/board/review/acceptance/acceptView";
	}
	
	@RequestMapping("/acceptUpdateForm.bo")
	public String AcceptUpdateForm (@RequestParam int board_no, Model model) {
		Board1 accept = bs.selectOneAccept(board_no);
		
		String oriTitle = accept.getBoard_title();
		int target = oriTitle.indexOf("[");
		String mainTitle = oriTitle.substring(oriTitle.indexOf("[")+1, oriTitle.indexOf("]")).trim();
		String subTitle = oriTitle.substring(oriTitle.indexOf("]")+1).trim();
		
		accept.setBoard_mainTitle(mainTitle);
		accept.setBoard_title(subTitle);
		
		//System.out.println("mainTitle :" + mainTitle.trim());
		//System.out.println("subTitle :" + subTitle.trim());
		
		
		model.addAttribute("accept", accept);		
		return "user/board/review/acceptance/acceptUpdateForm";
	}
	
	@RequestMapping("/acceptUpdate.bo")
	public String acceptUpdate(@RequestParam String board_mainTitle, Board1 accept, Model model) {
		
		accept.setBoard_title("[" + changeToUpper(board_mainTitle) + "] " + accept.getBoard_title());
		
		int result = bs.acceptUpdate(accept);
		String msg = "";
		String loc = "";
		
		if (result > 0) {
			loc = "/selectOneAccept.bo?board_no=" + accept.getBoard_no();
			msg = "게시글 수정 성공";
		} else {
			msg = "게시글 수정 실패";
		}	
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
	
		return "user/common/msg";
	}
	
	@RequestMapping("/acceptDelete.bo")
	public String acceptDelete(@RequestParam int board_no, Model model) {
		int result = bs.acceptDelete(board_no);
		return "redirect:acceptList.bo";
	}
	
	@RequestMapping("/acceptInsert.bo")
	public String acceptInsert(@RequestParam String board_mainTitle, Board1 accept, Model model) {
		accept.setBoard_title("[" + changeToUpper(board_mainTitle) + "] " + accept.getBoard_title());
		int result = bs.acceptInsert(accept);
		return "redirect:acceptList.bo";
	}
	
	@RequestMapping("/searchAccept.bo")
	public String searchAccept(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model, HttpSession session) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchInterviewList(cPage, numPerPage, changeToUpper(keyword));
		int totalContents = bs.searchAcceptTotalContents(changeToUpper(keyword));
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchInterview.bo?keyword="+changeToUpper(keyword));
		if (session.getAttribute("member") != null) {
			Member mem = (Member)session.getAttribute("member");
			List<Bookmark> bookmarkList = ms.selectAllBookmark(mem.getMemNo());
			model.addAttribute("bookmarkList", bookmarkList);			
		}
		model.addAttribute("interviewList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/review/acceptance/acceptList"; 
	}	
	
	
	
	
	
// *******************************************************************************************
// 							Common Method Area
// *******************************************************************************************
		public String fileNameChanger(String oldFileName) {
			
			String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int)(Math.random() * 1000);
			return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
		}
		
		//대문자 변환
		public String changeToUpper(String keyword) {
			String originalWord = keyword;
			String changedWord = "";
			char temp;
			for (int i = 0; i < keyword.length(); i++) {
				temp = originalWord.charAt(i);
				if ((97 <= temp) && (temp <= 122)) {
					changedWord += originalWord.valueOf(temp).toUpperCase();
				} else {
					changedWord += (char)temp;
				}
			}
			return changedWord;
		}
	
}
