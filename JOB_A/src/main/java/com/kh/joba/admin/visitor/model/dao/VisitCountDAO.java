package com.kh.joba.admin.visitor.model.dao;

import java.sql.Connection;

import javax.servlet.http.HttpSessionEvent;


public interface VisitCountDAO {
	
	int getVisitTodayCount(Connection con);

	int getVisitTotalCount(Connection con);

	int setVisitTotalCount(Connection con, HttpSessionEvent se);
}
