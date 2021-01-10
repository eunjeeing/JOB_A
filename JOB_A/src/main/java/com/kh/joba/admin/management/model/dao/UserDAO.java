package com.kh.joba.admin.management.model.dao;

import java.util.List;
import java.util.Map;

public interface UserDAO {

	List<Map<String, String>> selectMemberList();
}
