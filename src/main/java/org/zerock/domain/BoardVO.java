package org.zerock.domain;

import java.util.Date;

public class BoardVO {
	private Integer bno; //숫자형태의 객체는 Interger
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private String header;
	private int like_cnt;
	private int hate_cnt;
	private String src;
	
	private String[] files;
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public int getHate_cnt() {
		return hate_cnt;
	}
	public void setHate_cnt(int hate_cnt) {
		this.hate_cnt = hate_cnt;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", writer=" + writer+ ", content=" + content + ", regdate=" + regdate
				+ ", viewcnt=" + viewcnt + ", src="+ src +"]";
	}
}
