package kr.co.pujimi.dto;

public class ResTO {
	
	private int res_seq;
	private String res_name;
	private String res_addr;
	private String res_phone;
	private String res_octime;
	private String res_content;
	private int user_seq;
	private String res_photo;
	private int res_price;
	private int res_point;
	private int res_revenue;
	private double res_grade;
	private int res_sells;
	private int res_likes;
	
	public int getRes_sells() {
		return res_sells;
	}
	public void setRes_sells(int res_sells) {
		this.res_sells = res_sells;
	}
	public int getRes_likes() {
		return res_likes;
	}
	public void setRes_likes(int res_likes) {
		this.res_likes = res_likes;
	}
	public int getRes_price() {
		return res_price;
	}
	public void setRes_price(int res_price) {
		this.res_price = res_price;
	}
	public double getRes_grade() {
		return res_grade;
	}
	public void setRes_grade(double res_grade) {
		this.res_grade = res_grade;
	}
	private String user_email;



	public String getRes_photo() {
		return res_photo;
	}
	public void setRes_photo(String res_photo) {
		this.res_photo = res_photo;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getRes_addr() {
		return res_addr;
	}
	public void setRes_addr(String res_addr) {
		this.res_addr = res_addr;
	}
	public String getRes_phone() {
		return res_phone;
	}
	public void setRes_phone(String res_phone) {
		this.res_phone = res_phone;
	}
	public String getRes_octime() {
		return res_octime;
	}
	public void setRes_octime(String res_octime) {
		this.res_octime = res_octime;
	}
	public String getRes_content() {
		return res_content;
	}
	public void setRes_content(String res_content) {
		this.res_content = res_content;
	}
	public int getRes_point() {
		return res_point;
	}
	public void setRes_point(int res_point) {
		this.res_point = res_point;
	}
	public int getRes_revenue() {
		return res_revenue;
	}
	public void setRes_revenue(int res_revenue) {
		this.res_revenue = res_revenue;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
}
