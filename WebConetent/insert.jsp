<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.vo.PersonVo" %>
<%@ page import="com.javaex.dao.PhoneDao" %>

<%@ page import="java.util.List" %>

<%
	//PhoneDao를 메모리에 올린다. 
	PhoneDao phoneDao = new PhoneDao();

	
	///////////////////////////////////////////////
	//저장 관련
	///////////////////////////////////////////////
	
	//파라미터값 가져오기
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String company = request.getParameter("company");

	
	//테스트
	//System.out.println(name);
	//System.out.println(hp);
	//System.out.println(company);
	
	
	//전송된 값(파라미터)을 vo객체로 만든다
	PersonVo personVo = new PersonVo(name, hp, company);
	//System.out.println(personVo.toString());
	
	//저장
	phoneDao.personInsert(personVo);

	
	
	
	
	//dao 리스트요청 + html
	
	//리다이렉트
	response.sendRedirect("./list.jsp");
	
%>

