package com.kh.joba.user.common.util;

import org.springframework.stereotype.Controller;

@Controller
public class UtilsBoard1 { // 게시판 페이징처리
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url, String keyword){
		String pageBar = "";
		int pageBarSize = 10;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1; // 
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("totalPage : "+totalPage);
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li>";
			pageBar += "<a class='button' href='#' tabindex='-1'>Prev</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page'>";
			pageBar += "<a class='button' href='javascript:fn_paging("+(pageNo-1)+")'>Prev</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){ // 페이지가 끝에 도달하지 않았다면 반복
			if(cPage == pageNo ){
				pageBar += "<li class='page'>";
				pageBar += "<a class='page'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page'>";
				pageBar += "<a class='page' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page'>";
			pageBar += "<a class='button' href='#'>Next</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page'>";
			pageBar += "<a class='button' href='javascript:fn_paging("+pageNo+")'>Next</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage'&keyword='+keyword;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}

}