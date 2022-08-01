package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString


public class Criteria {
	
	private int pageNum;
	private String u_id;
	private int amount;
	
	private int skip;
	
	public Criteria() {
		this(1,8);
		this.skip = 0;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum -1) * amount;
	}
	
	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		this.pageNum = pageNum;
		
	}
	
	public void setAmount(int amount) {
		this.skip =(this.pageNum-1)*amount;
		this.amount = amount;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	
	public int getAmount() {
		return amount;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount" + amount +"]";
	}

	public Criteria(int pageNum, String u_id, int amount, int skip) {
		super();
		this.pageNum = pageNum;
		this.u_id = u_id;
		this.amount = amount;
		this.skip = skip;
	}

}
