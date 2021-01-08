package com.kh.joba.user.category.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class WishCategory {


	private int mem_No;
	private int[] category_No;	
	private int resultCategory; // 객체 생성을 위한 용도 
	
	public WishCategory(int mem_No, int resultCategory) {
		super();
		this.mem_No = mem_No;
		this.resultCategory = resultCategory;
	}
	
}



