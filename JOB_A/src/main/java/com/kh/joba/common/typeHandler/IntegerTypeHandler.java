package com.kh.joba.common.typeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class IntegerTypeHandler implements TypeHandler<int[]> {

	@Override
	public void setParameter(PreparedStatement ps, int i, int[] parameter, JdbcType jdbcType) throws SQLException {
		if( parameter != null) {
			String tmp = "";
			
			for(int j = 0 ; j < parameter.length; j++) {
				if( j == parameter.length - 1) tmp += parameter[j];
				else tmp += parameter[j] + ",";
			}
			
			ps.setString(i, tmp);
			
		} else {
			ps.setString(i, "");
		}
	}

	@Override
	public int[] getResult(ResultSet rs, String columnName) throws SQLException {
		
		String tmp[] = rs.getString(columnName).split(",");
		int[] arr = new int[tmp.length];
		int i = 0;
		for(String str : tmp) {
			arr[i] = Integer.parseInt(str);
			i++;
		}
		
		return arr;
	}

	@Override
	public int[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		
		String tmp[] = rs.getString(columnIndex).split(",");
		int[] arr = new int[tmp.length];
		int i = 0;
		for(String str : tmp) {
			arr[i] = Integer.parseInt(str);
			i++;
		}
		
		return arr;
	}

	@Override
	public int[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		
		String tmp[] = cs.getString(columnIndex).split(",");
		int[] arr = new int[tmp.length];
		int i = 0;
		for(String str : tmp) {
			arr[i] = Integer.parseInt(str);
			i++;
		}
		
		return arr;
	}

}
