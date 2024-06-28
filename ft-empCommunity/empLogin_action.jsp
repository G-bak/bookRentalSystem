<%@ page import="db.dao.TestDAO" %>
<%@ page import="db.dto.TestDTO" %>
<%@ page import="db.dto.EmployeeDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<%
		//로그인 입력한 값을 기준으로 로그인 여부 확인!
		request.setCharacterEncoding("UTF-8");
		String empno = request.getParameter("id");
		String password = request.getParameter("pw");
		
		TestDAO testDAO = new TestDAO();
		EmployeeDTO employee = testDAO.employeeLogin(empno, password);
		if(employee == null){
	%>
		<script>alert('정보가 존재하지 않습니다. 로그인 해주세요.');
	 	location.href = "empLogin.jsp";</script>
	<%	} else {
		session.setAttribute("ename", employee.getEname());
		String ename = session.getAttribute("ename").toString(); 
		session.setAttribute("empno", employee.getEmpno());%>
		<script>alert('<%=ename%>님 환영합니다.');
		location.href = "ers.jsp";</script>		
	<% }%> 
	

</body>
</html>