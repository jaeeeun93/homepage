package org.zerock.domain;

public class LikeVO {
	
	private Integer bno;
	private Integer likeno;
	private String userid;
	private Integer like_check;
	private Integer hate_check;
	private Integer duple_check;
	

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public Integer getLikeno() {
		return likeno;
	}

	public void setLikeno(Integer likeno) {
		this.likeno = likeno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Integer getLike_check() {
		return like_check;
	}

	public void setLike_check(Integer like_check) {
		this.like_check = like_check;
	}

	public Integer getHate_check() {
		return hate_check;
	}

	public void setHate_check(Integer hate_check) {
		this.hate_check = hate_check;
	}

	public Integer getDuple_check() {
		return duple_check;
	}

	public void setDuple_check(Integer duple_check) {
		this.duple_check = duple_check;
	}
	
	
}
