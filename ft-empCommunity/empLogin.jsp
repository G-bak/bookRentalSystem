<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 로그인 페이지</h1>
	<div class=loginbox>	
	<form action="empLogin_action.jsp" method="post">
		아이디 : <input type="text" name="id"> <br>
		비밀번호 : <input type="password" name="pw"> <br>
		<button type="submit">로그인</button>	
	</form>		
	<!-- <button onclick="addmember()">회원가입</button>	 -->
	</div>
	
	<script>
	function addmember(){
	location.href="addMember.jsp";
	}
	</script>
	
</body>
</html>