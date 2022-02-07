<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.vo.PersonVo" %>
<%@ page import="com.javaex.dao.PhoneDao" %>

<% 
	//PhoneDao를 메모리에 올린다. 
	PhoneDao phoneDao = new PhoneDao();

	//파라미터값 가져오기
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String company = request.getParameter("company");
	int personId = Integer.parseInt(request.getParameter("id"));
	
	//전송된 값(파라미터)을 vo객체로 만든다
	PersonVo personVo = new PersonVo(personId, name, hp, company);
	System.out.println(personVo.toString());
	
	//수정
	phoneDao.personUpdate(personVo);
	
	//리다이렉트
	response.sendRedirect("./list.jsp");
	
%>