package com.kh.joba.admin.boardNotice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.admin.boardNotice.model.service.BoardNoticeService;
import com.kh.joba.user.board.model.vo.Board1;
import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.comments2.model.vo.Comments2;

@Controller
public class BoardNoticeController {
	
	
	@Autowired
	BoardNoticeService bns;
	 
	@Autowired
	Comments2Service cs;
	
	@RequestMapping("/admin/noticeList.bo")
	public String noticeList(Model model) {
		
		List<Map<String, String>> list = bns.noticeList();
		//System.out.println(list + "1");
		for (int i = 0; i < list.size(); i++) {
			String new_date = (String)(((Board1) list.get(i)).getBoard_date().substring(0, 19));
			((Board1) list.get(i)).setBoard_date(new_date);
			//System.out.println(((Board1) list.get(i)).getBoard_date());
		}
		
		model.addAttribute("noticeList", list);
		
		
		return "admin/board/notice/noticeList";
	}
	
	@RequestMapping("/admin/noticeView.bo")
	public String noticeView(@RequestParam int board_no, Model model) {
		
		Board1 notice = bns.selectOneNotice(board_no);
		
		notice.setBoard_date(notice.getBoard_date().substring(0, 19));
		
		model.addAttribute("notice", notice);
		
		
		return "admin/board/notice/noticeView";
	}
	
	@RequestMapping("/admin/noticeUpdateForm.bo")
	public String noticeUpdateForm(@RequestParam int board_no, Model model) {
		
		Board1 notice = bns.selectOneNotice(board_no);	
		
		notice.setBoard_date(notice.getBoard_date().substring(0, 19));
		
		model.addAttribute("notice", notice);
		
		return "admin/board/notice/noticeUpdateView";
	}
	@RequestMapping("/admin/updateNotice.bo")
	public String noticeUpdate(Board1 notice) {
		
		System.out.println(notice);
		int result = bns.updateNotice(notice);
		
		return "redirect:/admin/noticeList.bo";
	}
	
	@RequestMapping("/admin/deleteNotice.bo")
	public String noticeDelete(@RequestParam int board_no) {
		
		System.out.println(board_no);
		int result = bns.deleteNotice(board_no);
		
		return "redirect:/admin/noticeList.bo";
	}
	
	
	@RequestMapping("/admin/noticeWrite.bo")
	public String noticeWriteForm () {
		return "admin/board/notice/noticeInsertForm";
	}
	
	@RequestMapping("/admin/insertNotice.bo")
	public String noticeInsert(Board1 notice) {

		int result = 0;
		String loc ="";
		if (notice.getType_no() == 1) {
			result = bns.insertNotice(notice);
			loc = "redirect:/admin/noticeList.bo";
		} else if (notice.getType_no() == 11) {
			result = bns.insertAdminNotice(notice);
			loc = "redirect:/admin/adminNotice.bo";
		}
		
		return loc;
	}

/************************************************************/
/* ADMIN NOTICE */
/**************************************************************/
	@RequestMapping("/admin/adminNotice.bo")
	public String adminNotice(Model model) {

		List<Map<String, String>> list = bns.adminNoticeList();
		
		for (int i = 0; i < list.size(); i++) {
			String new_date = (String)(((Board1) list.get(i)).getBoard_date().substring(0, 19));
			((Board1) list.get(i)).setBoard_date(new_date);
			//System.out.println(((Board1) list.get(i)).getBoard_date());
		}
		System.out.println(list);
		
		model.addAttribute("adminNotice", list);
	
		return "admin/board/notice/adminNoticeList";
	}
	
	@RequestMapping("/adminNoticeView.bo")
	public String adminNoticeView(@RequestParam int board_no, Model model) {
		
		System.out.println(board_no);
		Board1 adminNotice = bns.selectOneAdminNotice(board_no);
		System.out.println(adminNotice);
		List<Comments2> commentList = cs.selectComment(board_no);
		
		model.addAttribute("notice", adminNotice);
		model.addAttribute("commentList", commentList);

		
		return "admin/board/notice/adminNoticeView";
	}
	
	@RequestMapping("/admin/adminNoticeUpdateForm.bo")
	public String adminUpdateView(@RequestParam int board_no, Model model) {
		Board1 notice = bns.selectOneAdminNotice(board_no);	
		
		notice.setBoard_date(notice.getBoard_date().substring(0, 19));
		
		model.addAttribute("notice", notice);
		return "admin/board/notice/adminNoticeUpdateView";
	}
	
	@RequestMapping("/admin/updateAdminNotice.bo")
	public String adminUpdateNotice(Board1 notice) {
		System.out.println(notice);
		int result = bns.updateNotice(notice);
		
		return "redirect:/adminNoticeView.bo?board_no="+ notice.getBoard_no();

	}
	
	@RequestMapping("/admin/deleteAdminNotice.bo")
	public String adminNoticeDelete(@RequestParam int board_no) {
		
		System.out.println(board_no);
		int result = bns.deleteNotice(board_no);
		
		return "redirect:/admin/adminNotice.bo";
	}
	
	
	
	
/************************************************************/
/* ADMIN MENTO  */
/**************************************************************/
	@RequestMapping("/admin/mentoTotalList.bo")
	public String adminMentoTotalList(Model model) {
		
		List<Map<String, String>> list = bns.mentoTotalList();
		if (list != null) {
		for (int i = 0; i < list.size(); i++) {
			String new_date = (String)(((Board1) list.get(i)).getBoard_date().substring(0, 19));
			((Board1) list.get(i)).setBoard_date(new_date);
		}
		}
		
		model.addAttribute("mentoTotalList", list);
		
		return "admin/board/mento/mentoTotalList";
	}
	
	@RequestMapping("/admin/mentoAnsweredList.bo")
	public String adminMentoAnsweredList(Model model) {
		
		List<Map<String, String>> list = bns.mentoAnsweredList();
		if (list != null) {
		for (int i = 0; i < list.size(); i++) {
			String new_date = (String)(((Board1) list.get(i)).getBoard_date().substring(0, 19));
			((Board1) list.get(i)).setBoard_date(new_date);
		}
		}
		model.addAttribute("mentoAnsweredList", list);
		
		return "admin/board/mento/mentoAnsweredList";
	}
	
	@RequestMapping("/admin/mentoUnansweredList.bo")
	public String adminMentoUnansweredList(Model model) {
		
		List<Map<String, String>> list = bns.mentoUnansweredList();
		if (list != null) {
		for (int i = 0; i < list.size(); i++) {
			String new_date = (String)(((Board1) list.get(i)).getBoard_date().substring(0, 19));
			((Board1) list.get(i)).setBoard_date(new_date);
		}
		}
		
		model.addAttribute("mentoUnansweredList", list);
		
		return "admin/board/mento/mentoUnansweredList";
	}
	
	@RequestMapping("/admin/mentoView.bo")
	public String adminMentoView(@RequestParam int board_no , Model model) {
		
		//System.out.println(board_no);
		Board1 mento = bns.selectOneMento(board_no);
		//System.out.println(mento);
		List<Comments2> commentList = cs.selectComment(board_no);
		
		model.addAttribute("mento", mento);
		model.addAttribute("commentList", commentList);
		
		return "admin/board/mento/mentoView";
	}

}
