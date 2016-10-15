<%@page import="org.json.simple.JSONArray"%>
<%@page import="kr.co.pujimi.dto.AddMenuDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="org.json.simple.JSONObject"%>

<%
	ArrayList<AddMenuDTO> addMenu_lists = (ArrayList)request.getAttribute("addMenu_lists");
	JSONArray jsonArray = new JSONArray();

	for(AddMenuDTO addTo : addMenu_lists){	
		JSONObject obj = new JSONObject();
		obj.put("menu_name", addTo.getMenu_name());
		obj.put("add_date", addTo.getAdd_date());
		System.out.println(addTo.getMenu_name() + "//" + addTo.getAdd_date());
		jsonArray.add(obj);			
	}
	
	out.println(jsonArray);
%>
