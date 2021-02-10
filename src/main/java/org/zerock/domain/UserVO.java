package org.zerock.domain;

import java.util.Date;

public class UserVO {
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String email2;
	private Date regdate;
	private Date updatedate;
	private String level;
	private String userdel;
	private String phone;
	private String profile;
	private String follower_num;
	private String following_num;
	private String[] files;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getUserdel() {
		return userdel;
	}
	public void setUserdel(String userdel) {
		this.userdel = userdel;
	}
	public String getFollower_num() {
		return follower_num;
	}
	public void setFollower_num(String follower_num) {
		this.follower_num = follower_num;
	}
	public String getFollowing_num() {
		return following_num;
	}
	public void setFollowing_num(String following_num) {
		this.following_num = following_num;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", email=" + email
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
}
