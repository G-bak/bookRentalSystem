<%@ page import="db.dao.BookDAO" %>
<%@ page import="db.dto.BookDTO" %>
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
		request.setCharacterEncoding("UTF-8");	//문자 인코딩 설정 - 한글깨짐 방지
		System.out.println(request.getParameter("bookno"));		//request - 요청 , response - 응답 
		System.out.println(request.getParameter("bcount"));
		
		//request.getParameter 결과 -> String
		int bookno = Integer.parseInt(request.getParameter("bookno"));	//int는 쓸수 없음 대신 integer로 받아서 저장
		int bcount = Integer.parseInt(request.getParameter("bcount"));
	
		BookDAO bookDAO = new BookDAO();
		
		//낱개 저장
 		int result = bookDAO.setbookquantity(bcount, bookno);
	
		if ( result > 0 ){
	%>
		<script>
			alert('수량 변경 완료');
			location.href = 'test.jsp';	
		</script>
	<%	
		} else {
	%>		
		<script>
			alert('수량 변경 실패');
			history.back();	//뒤로가기		//addDept.jsp 저장하려는 페이지 -> 추가 -> addDept_action.jsp
		</script>
	<% 
		}	
		
	%>
</body>
</html>