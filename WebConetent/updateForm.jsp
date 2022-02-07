<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.vo.PersonVo" %>
<%@ page import="com.javaex.dao.PhoneDao" %>


<%
	//PhoneDao를 메모리에 올린다. 
	PhoneDao phoneDao = new PhoneDao();


	//파라미터에서 수정할 id값을 가져온다
	int personId = Integer.parseInt(request.getParameter("id"));

	PersonVo personVo = phoneDao.getPerson(personId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>[Phonebook1]</h1>

	<h2>전화번호 수정폼</h2>

	<p>
		수정화면입니다.<br>
	   	아래의 값을 수정하고 "수정" 버튼을 클릭하세요
	</p>
	
	<form action="./update.jsp" method="get">
		이름(name): <input type="text" name="name" value="<%=personVo.getName()%>"> <br>
		핸드폰(hp): <input type="text" name="hp" value="<%=personVo.getHp()%>"> <br>
		회사(company): <input type="text" name="company" value="<%=personVo.getCompany()%>"> <br>
		코드(id): <input type="text" name="id" value="<%=personVo.getPersonId()%>"> <br>
		<button type="submit">수정</button>
	</form>
	
</body>
</html>