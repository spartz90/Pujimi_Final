package kr.co.pujimi.dto;

public class CouponTO {
	private int res_seq;
	private String res_name;
	private int res_price;
	private int user_seq;
	private int user_point;
	private String cp_serial;
	private String user_email;
	private String user_nickname;

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
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

	public int getRes_price() {
		return res_price;
	}

	public void setRes_price(int res_price) {
		this.res_price = res_price;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public String getCp_serial() {
		return cp_serial;
	}

	public void setCp_serial(String cp_serial) {
		this.cp_serial = cp_serial;
	}

}
