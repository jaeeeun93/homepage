package org.zerock.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount; // 총 게시물 수
	private int startPage; // 시작 페이지
	private int endPage; // 끝 페이지
	private boolean prev; // 이전 링크
	private boolean next; // 다음 링크

	private int displayPageNum = 10; //블럭 갯수
	private Criteria cri; // limit 메소드 이용
	
	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		// 마지막 블럭일 경우 계산 처리
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	public Criteria getCri() {
		return cri;
	}
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
	
	// get방식 - url 주소 변수 값 - 처리 용이하게..
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
			.queryParam("page", page)
			.queryParam("perPageNum", cri.getPerPageNum())
			.build();
		return uriComponents.toUriString();
	}
		
	// search 추가
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
			.queryParam("page", page)
			.queryParam("perPageNum", cri.getPerPageNum())
			.queryParam("searchType", ((SearchCriteria) cri).getSearchType())
			//.queryParam("keyword", ((SearchCriteria) cri).getKeyword())
			.queryParam("keyword", encoding(((SearchCriteria) cri).getKeyword()))
			.build();
		return uriComponents.toUriString();
	}
	
	// get 방식으로 값을 넘겼을때 한글이 깨질 경우 처리 추가
	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) { //trim 스페이스를 제외 //스페이스를 제외한 검색어가 0이라면
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
}
