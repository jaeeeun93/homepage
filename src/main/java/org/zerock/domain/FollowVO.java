package org.zerock.domain;

public class FollowVO {
	
	private String following;
	private String follower;
	private Integer follow_check;
	
	public String getFollowing() {
		return following;
	}
	public void setFollowing(String following) {
		this.following = following;
	}
	public String getFollower() {
		return follower;
	}
	public void setFollower(String follower) {
		this.follower = follower;
	}
	public Integer getFollow_check() {
		return follow_check;
	}
	public void setFollow_check(Integer follow_check) {
		this.follow_check = follow_check;
	}
	
	
}
