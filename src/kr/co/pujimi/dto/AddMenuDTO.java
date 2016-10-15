package kr.co.pujimi.dto;

public class AddMenuDTO {
	
	private int res_seq;
	private String menu_name;
	private String[] addMenus;
	private String add_date;
	
	public int getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String[] getAddMenus() {
		return addMenus;
	}
	public void setAddMenus(String[] addMenus) {
		this.addMenus = addMenus;
	}
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
}
