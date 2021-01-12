package com.kh.joba.admin.visitor.listener;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.kh.joba.admin.visitor.model.dao.VisitCountDAOImpl;
import com.kh.joba.admin.visitor.model.vo.VisitCount;

@Component
public class VisitCounterListener implements HttpSessionListener {
	
	VisitCountDAOImpl visitCountDAO;
	SqlSessionTemplate sqlSession;
	
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
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		// dao 생성
		HttpSession session = se.getSession();
		VisitCount v = new VisitCount();
		
		v.setVisit_ip(req.getRemoteAddr());
		v.setVisit_agent(req.getHeader("User-Agent"));
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
		visitCountDAO = (VisitCountDAOImpl)wac.getBean("visitCountDAO");
		sqlSession = (SqlSessionTemplate)wac.getBean("sqlSessionTemplate");
		// 전체 방문자 수 +1
		visitCountDAO.setVisitTotalCount(sqlSession,v);
		
		// 오늘 방문자 수
		int todayCount = visitCountDAO.getVisitTodayCount(sqlSession);
		
		// 전체 방문자 수
		int totalCount = visitCountDAO.getVisitTotalCount(sqlSession);
		
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
