package com.koreait.vo;

import java.util.ArrayList;

public class MvcboardList {
	
//	ArrayList 만들기
	private ArrayList<MvcboardVO> list = new ArrayList<MvcboardVO>();
	
//	페이징 작업에 사용할 8개의 변수를 선언한다.	
	private int pageSize = 10;
	private int totalCount = 0;
	private int totalPage = 0;
	private int currentPage = 1;
	private int startNo = 0;
	private int endNo = 0;
	private int startPage = 0;
	private int endPage = 0;

//	1. 기본 생성자를 만들어 둬 (할일은 없음. 아래를 위한 초석작업)
	public MvcboardList() {	}
	
//	2. pageSize, totalCount, currentPage를 인수로 넘겨받아 초기화 시키고 나머지 변수를 계산해서 초기화 시키는 생성자.
	public MvcboardList(int pageSize, int totalCount, int currentPage) {
		super();
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		
//		3. pageSize, totalCount, currentPage를 제외한 나머지 변수의 값을 계산하는 메소드를 실행한다.		
		calculator();
		
	}
	
//	4. pageSize, totalCount, currentPage를 제외한 나머지 변수의 값을 계산하는 메소드
	private void calculator() {
		totalPage = (totalCount -1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage -1) * pageSize +1;
		endNo = startNo + pageSize - 1;
		endNo =  endNo > totalCount? totalCount : endNo;
		startPage = (currentPage - 1) / 10 * 10 + 1;
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage;
		
	}
//	5. getters&setters
	public ArrayList<MvcboardVO> getList() {
		return list;
	}

	public void setList(ArrayList<MvcboardVO> list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

//	6. toString
	@Override
	public String toString() {
		return "MvcboardList [list=" + list + ", pageSize=" + pageSize + ", totalCount=" + totalCount + ", totalPage="
				+ totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo=" + endNo
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
