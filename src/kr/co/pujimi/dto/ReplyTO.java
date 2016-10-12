package kr.co.pujimi.dto;

public class ReplyTO {
	private int re_seq;
	private String re_content;
	private String re_photo;
	private String re_date;
	private double re_grade;
	private int res_seq;
	private int user_seq;
	private String user_nickname;
	
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_photo() {
		return re_photo;
	}
	public void setRe_photo(String re_photo) {
		this.re_photo = re_photo;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	public double getRe_grade() {
		return re_grade;
	}
	public void setRe_grade(double res_grade) {
		this.re_grade = res_grade;
	}
	public int getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}	
	
}
