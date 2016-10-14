<%@page import="org.json.simple.JSONArray"%>
<%@page import="kr.co.pujimi.dto.LikeMenuDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="org.json.simple.JSONObject"%>

<%
	ArrayList<LikeMenuDTO> likeMenu_lists = (ArrayList)request.getAttribute("likeMenu_lists");
	JSONArray jsonArray = new JSONArray();

	for(LikeMenuDTO lmDTo : likeMenu_lists){	
		JSONObject obj = new JSONObject();
		obj.put("menu_name", lmDTo.getMenu_name());
		obj.put("like_date", lmDTo.getLike_date());
		System.out.println(lmDTo.getMenu_name() + "//" + lmDTo.getLike_date());
		jsonArray.add(obj);			
	}
	
	out.println(jsonArray);
%>
