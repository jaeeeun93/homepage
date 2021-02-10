package org.zerock.domain;

public class Criteria {
	
	private int page;
	private int perPageNum;
	
	public Criteria() {
	this.page = 1; //한페이지
	this.perPageNum = 10; //한페이지당 10개 출력
	}
	
	public void setPage(int page) {
		//수정
		if (page == 0) {
			this.page = 1;
			return;
		}		
		this.page = page;
	}
	public int getPage() {
		return page;
	}	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum == 0) { //선언이 되어있지 않다면 default 10으로 주겠다.
			this.perPageNum = 10; //페이지당 출력 게시물 수 
			return;
		}
		this.perPageNum = perPageNum;
	}	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	//Mybatis SQL mapper -
	//sql 구문에서 limit 시작 위치 지정 
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
