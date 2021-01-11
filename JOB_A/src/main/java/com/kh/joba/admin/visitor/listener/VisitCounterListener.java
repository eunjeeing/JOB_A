package com.kh.joba.admin.visitor.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.kh.joba.admin.visitor.model.dao.VisitCountDAOImpl;

public class VisitCounterListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
//		HttpSession session = se.getSession();
//		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
//		// 등록된 빈을 사용할 수 있도록 설정
//		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
//		// request를 파라미터에 넣지 않고 사용할 수 있도록 설정
//		VisitCountDAO visitCountDAO = (VisitCountDAO) wac.getBean("visitCountDAO");
//		VisitCount vo = new VisitCount();
//		vo.setVisit_ip(req.getRemoteAddr());
//		vo.setVisit_agent(req.getHeader("User-Agent"));
//		visitCountDAO.insertVisitor(vo);
		
		// dao 생성
		HttpSession session = se.getSession();
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
		VisitCountDAOImpl dao = (VisitCountDAOImpl)wac.getBean("visitCountDAO");
		
		// 전체 방문자 수 +1
		dao.setVisitTotalCount();
		
		// 오늘 방문자 수
		int todayCount = dao.getVisitTodayCount();
		
		// 전체 방문자 수
		int totalCount = dao.getVisitTotalCount();
		
		// 세션 속성에 담아준다.
		session.setAttribute("totalCount", totalCount);
		session.setAttribute("todayCount", todayCount);
		System.out.println("전달확인 total" + totalCount);
		System.out.println("전달확인 today" + todayCount);
	}


	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub

	}

}
