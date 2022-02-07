<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.dao.PhoneDao" %>

<% 
	//PhoneDao를 메모리에 올린다. 
	PhoneDao phoneDao = new PhoneDao();

	//파라미터값 가져오기
	int personId = Integer.parseInt(request.getParameter("id"));
	
	//삭제
	phoneDao.personDelete(personId);
	
	//리다이렉트
	response.sendRedirect("./list.jsp");
	
%>