<%@ page import="db.dao.BookDAO" %>
<%@ page import="db.dto.BookDTO" %>
<%@ page import="db.dto.Book2DTO" %>
<%@ page import="db.dto.Book3DTO" %>
<%@ page import="db.dto.EmployeeDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Loan System</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
   	<%
	//로그인 입력한 값을 기준으로 누구인지 확인
	request.setCharacterEncoding("UTF-8");
   	String ename = (String) session.getAttribute("ename"); /* 로그인액션에서 정보를 받아 이름 확인 */  	
   	if (ename != null) {
   	String empno = session.getAttribute("empno").toString(); /* 로그인액션에서 정보를 받아 사번 확인 */	
	%>
    <div class="header"><h1>도서 대여 시스템</h1></div>
	<div class="section-title">"<%=ename %>"님 환영합니다.<button class="right" onclick="employeeClick()">관리자 공지사항</button></div><br/>
	<div class="employee" id="employee"><!-- 모달창 -->
	    <h1> 관리자 공지사항 </h1><br/>
        <button class="right" id="btn" onclick="communityClick()"> 공지 추가 </button><br/><br/>
        	<div class="community" id="community">
        		<h3> 공지사항 추가 </h3><br/>
		        <form action="community_action.jsp" method="post" id="frm_community">
	            <label> 직원 번호 : <input type ="text" id="input_empno" name= "empno" value="<%=empno%>"> </label><br/><br/>
	            <label> 메시지 : &nbsp;&nbsp;&nbsp;<input type ="text" id="input_message" name= "message"> </label><br/><br/><br/>
	            <button type = "submit" id="btn"> 공지 추가 </button>
        		</form>	        
        	</div>
        <table id="rankingTable">
    	<thead>
       		<tr>
	            <th>직원 번호</th>
	            <th>메시지</th>
	            <th>공지 날짜</th>
	        </tr>
	     </thead>
	     <tbody>
	     	<%
	     		BookDAO bookDAO = new BookDAO();
				List<EmployeeDTO> employeeList = bookDAO.getCommunityList();
				
				for(EmployeeDTO employee : employeeList) {	
			%>
	     	<tr>
                <td><%=employee.getEmpno()%></td>
                <td><%=employee.getMessage()%></td>
                <td><%=employee.getSend_date()%></td>
            </tr>
            <%
				}
			%> 
	    </tbody>
	    </table>          
    </div>
    <div class="section-title">회원 정보<button class="right" onclick="logOut()">log out</button></div>
    <script>
	function logOut(){
	location.href="logout_action.jsp";
	}
	</script>
    <div class="search-box">
        <div class="search-group">
            <input type="text" id="customerSearch1" placeholder="회원번호">
            <button id="member-number-name-button">검색</button>
        </div>
        <div class="search-group">
            <input type="text" id="customerSearch1" placeholder="회원명">
            <button id="member-number-name-button">검색</button>
        </div>
        <div class="search-group">
            <input type="text" id="customerSearch2" placeholder="휴대폰번호">
            <button onclick="searchTable('customerSearch2', 'customerTable')">검색</button>
        </div>
        <div class="search-group">
            <input type="text" id="customerSearch2" placeholder="대여상태">
            <button onclick="searchTable('customerSearch2', 'customerTable')">검색</button>
        </div>
    </div>
    <table id="customerTable">
        <thead>
            <tr>
                <th>회원번호</th>
                <th>회원명</th>
                <th>휴대폰번호</th>
                <th>주소</th>
                <th>대여상태</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>100</td>
                <td>강지은</td>
                <td>010-1234-5678</td>
                <td>충청남도 천안시 서북구 성성2길 52-1</td>
                <td>연체</td>
            </tr>
        </tbody>
    </table>

    <div class="section-title">회원 대여 내역 조회</div>
    <div class="search-box">
        <div class="search-group" style="display: flex;">
            <input type="text" id="historySearch1" placeholder="회원번호">
            <button onclick="searchTable('historySearch1', 'historyTable')">검색</button>
        </div>
        <div class="search-group" style="display: flex;">
            <input type="text" id="historySearch1" placeholder="회원명">
            <button onclick="searchTable('historySearch1', 'historyTable')">검색</button>
        </div>
        <div class="search-group">
            <input type="text" id="customerSearch2" placeholder="휴대폰번호">
            <button onclick="searchTable('customerSearch2', 'customerTable')">검색</button>
        </div>
    </div>
    <table id="historyTable">
        <thead>
            <tr>
                <th>대여번호</th>
                <th>회원명</th>
                <th>도서제목</th>
                <th>대여날짜</th>
                <th>반납기한</th>
                <th>연체날짜</th>  
                <th>정지날짜</th>  
                <th>반납날짜</th>   
                <th>대여상태</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>10000</td>
                <td>강지은</td>
                <td>아이가 없는 집</td>
                <td>2024.06.22</td>
                <td>2024.06.29</td>
                <td></td>
                <td></td>
                <td></td>
                <td>대여중</td>
            </tr>
            <tr>
                <td>10001</td>
                <td>강지은</td>
                <td>모순</td>
                <td>2024.02.26</td>
                <td>2024.03.03</td>
                <td></td>
                <td></td>
                <td></td>
                <td>연체</td>
            </tr>
        </tbody>
    </table>
<!-- 10001	100	1001	24/06/21	od -->
    <div class="section-title">대여 현황 조회</div>
    <div class="search-box">
        <div class="search-group">
            <input type="text" id="bookSearch1" placeholder="대여번호">
            <button onclick="searchTable('bookSearch1', 'bookTable')">검색</button>
        </div>
        <div class="search-group">
            <input type="text" id="bookSearch1" placeholder="도서번호">
            <button onclick="searchTable('bookSearch1', 'bookTable')">검색</button>
        </div>
        <div class="search-group">
            <input type="text" id="bookSearch2" placeholder="도서제목">
            <button onclick="searchTable('bookSearch2', 'bookTable')">검색</button>
        </div>
        <div class="search-group">
            <input type="text" id="bookSearch2" placeholder="대여상태">
            <button onclick="searchTable('bookSearch2', 'bookTable')">검색</button>
        </div>
        <form>
            <div class="form-group" style="display: inline-block;">
                <label for="start-date" style="font-size: 1rem;">시작날짜</label>
                <input type="date" id="start-date" name="start-date" style="padding: 7px;">
            </div>&nbsp;
            <div class="form-group" style="display: inline-block;">
                <label for="end-date">종료날짜</label>
                <input type="date" id="end-date" name="end-date" style="padding: 7px;">
            </div>
            <button onclick="searchTable('start-date', 'historyTable')">검색</button>
        </form>
    </div>
    <table id="bookTable">
        <thead>
            <tr>
                <th>대여번호</th>
                <th>회원명</th>
                <th>도서제목</th>
                <th>대여날짜</th> 
                <th>반납기한</th>      
                <th>연체날짜</th>  
                <th>정지날짜</th>  
                <th>반납날짜</th>           
                <th>대여상태</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>10000</td>
                <td>강지은</td>
                <td>아이가 없는 집</td>
                <td>2024.06.22</td>     
                <td>2024.06.29</td>  
                <td></td>    
                <td></td>    
                <td></td>    
                <td>대여중</td>
            </tr>
        </tbody>
    </table>
    <div class="section-title">도서 정보<button class="right" onclick="btnClick()">도서추가</button>
    	<button class="right" onclick="bookqClick()">도서 수량 업데이트</button>
    </div>
    <div class="bookadd" id="bookadd">
        <h1> 도서 추가</h1>
        <form action="bookaddition_action.jsp" method="post" id="frm_book">
            <label> 책 이름 : <input type ="text" id="input_bname" name= "bname"> </label><br/>
            <label> 저자 : &nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" id="input_bauthor" name= "bauthor"> </label><br/>
            <label> 출판사 : <input type ="text" id="input_bpublish" name= "bpublish"> </label><br/>
            <label> 가격 : &nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" id="input_bprice" name= "bprice"> </label><br/>
            <label> 분류번호 :     
                <select name="genrno">
                    <option id="input_genrno"> 소설 </option>
                    <option id="input_genrno"> 시/에세이 </option>
                    <option id="input_genrno"> 경제/경영 </option>
                    <option id="input_genrno"> 자기계발 </option>
                    <option id="input_genrno"> 만화 </option>
                </select> 
            </label><br/>
            <label> 발행일 : <input type ="date" id="input_bdate" name= "bdate"> </label><br/>
            <label> 수량 : &nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" id="input_bcount" name= "bcount"> </label><br/><br/>
            <button type = "submit" id="btn"> 도서 추가 </button>
        </form>
    </div>
    <div class="bookq" id="bookq">
        <h1> 도서 수량 업데이트 </h1><br/>
        <form action="bookquantity_action.jsp" method="post" id="frm_bookq">
            <label> 책 번호 : <input type ="text" id="input_bookno" name= "bookno"> </label><br/><br/>
            <label> 수량 : &nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" id="input_bcount" name= "bcount"> </label><br/><br/><br/>
            <button type = "submit" id="btn"> 도서 수량 업데이트 </button>
        </form>
    </div>
    <div class="search-box">
        <div class="search-group">
        	<form action="ers.jsp" method="post" id="frm_bookno">
	            <input type="text" id="loanSearch1" placeholder="도서번호" name="bookno">
	            <button type="submit">검색</button>
            </form>
        </div>
        <div class="search-group">
        	<form action="ers.jsp" method="post">
	            <input type="text" id="loanSearch1" placeholder="도서제목" name="bname">
	            <button type="submit">검색</button>
            </form>
        </div>
        <div class="search-group">
        	<form action="ers.jsp" method="post">
	            <input type="text" id="loanSearch2" placeholder="장르명" name="gname">
	            <button type="submit">검색</button>
            </form>
        </div>
        <div class="search-group">
        	<form action="ers.jsp" method="post">
	            <input type="text" id="loanSearch2" placeholder="저자" name="bauthor">
	            <button type="submit">검색</button>
            </form>
        </div>
        <div class="search-group">
        	<form action="ers.jsp" method="post">
	            <input type="text" id="loanSearch2" placeholder="출판사" name="bpublish">
	            <button type="submit">검색</button>
            </form>
        </div>
        <div class="search-group">
        	<form action="ers.jsp" method="post">
	            <input type="text" id="loanSearch2" placeholder="재고" name="bcount">
	            <button type="submit">검색</button>
            </form>
        </div>
    </div>
    <table id="loanTable">
        <thead>
            <tr>
                <th>도서번호</th>
                <th>도서제목</th>
                <th>저자</th>
                <th>출판사</th>
                <th>가격</th>
                <th>장르</th>
                <th>발행일</th>
                <th>재고</th>
            </tr>
        </thead>
        <tbody>
    <%
    	request.setCharacterEncoding("UTF-8");
 		
		
		List<Book2DTO> getBookList = null;
       	boolean isEmptyStr = false;
       	List<String> db_params = new ArrayList<>();
       	String targetStr = null;
       	int targetNo = 0;
		
		String booknoSTR = request.getParameter("bookno");
		String bname = request.getParameter("bname");
		String bauthor = request.getParameter("bauthor");
		String bpublish = request.getParameter("bpublish");
		String gname = request.getParameter("gname");
		String bcountSTR = request.getParameter("bcount");	
		
		String[] params = new String[] {booknoSTR, bname, bauthor, bpublish, gname, bcountSTR};
		
		for (String param : params) {           		
   			if (param != null) {
   				db_params.add(param);
   			}
       	}
       	
       	if (db_params.size() != params.length) {
       		for (String param : db_params) {
       			if (param.equals("")) {
       				isEmptyStr = true;
       				break;
       			}
       		}
       	}
       	
       	if (!isEmptyStr) { 
       		for (int i = 0; i < params.length; i++) {
       			if (params[i] != null) {
       				targetStr = params[i];
       				targetNo = i;
       				break;
       			}
       		}
       		
       		if (targetStr != null) {      			
       			switch (targetNo) {
       				case 0:
       					if (booknoSTR.isBlank()) { 
       	%>					
       				<script>alert("공백 안됨 다시 입력 Go!");</script>  					       						
       	<%				
       					}
       					else{
       						int bookno = Integer.parseInt(booknoSTR);
       						getBookList = bookDAO.getBookNoList(bookno);
       					}       						
       	           		break;
       				case 1:
       					getBookList = bookDAO.getBookNameList(bname);
       	           		break;
       				case 2:
       					getBookList = bookDAO.getBookAuthorList(bauthor);
       	           		break;
       				case 3:
       					getBookList = bookDAO.getBookPublishList(bpublish);
       	           		break;
       				case 4:
       					getBookList = bookDAO.getBookGnameList(gname);
       	           		break;
       				case 5:
       					if(bcountSTR.isBlank()){
       	%>				
       					<script>alert("공백 안됨 다시 입력 Go!");</script>  					
       	<%			
       					}else{
       						int bcount = Integer.parseInt(bcountSTR);
       						getBookList = bookDAO.getBookCountList(bcount);
       					}	
       	           		break;
       			}           			
       		}
       	}
       	
       	if (isEmptyStr) {
       		getBookList = bookDAO.getBookList();
       	}
		
       	if(getBookList != null){
			for(Book2DTO bookList : getBookList) {
		%>				
	             <tr>
	                <td><%=bookList.getBookno()%></td>
	                <td><%=bookList.getBname()%></td>
	                <td><%=bookList.getBauthor()%></td>
	                <td><%=bookList.getBpublish()%></td>
	                <td><%=bookList.getBprice()%></td>
	                <td><%=bookList.getGname()%></td>
	                <td><%=bookList.getBdate()%></td>
	                <td><%=bookList.getBcount()%></td>
	            </tr>       
		<%	
		  	}
		}
		%>        
 	</tbody>
    </table>
    <table id="rankingTable">
    <div class="section-title">인기 도서</div>
    	<thead>
         	<tr>
	             <th>도서 제목</th>
	             <th>저자</th>
	             <th>대여 횟수</th>
	         </tr>
	     </thead>
	     <tbody>
	     	<%
				List<Book3DTO> book3List = bookDAO.getBookRanking();
				for(Book3DTO book : book3List) {	
			%>
	     	<tr>
                <td><%=book.getBname()%></td>
                <td><%=book.getBauthor()%></td>
                <td><%=book.getBookno()%></td>
            </tr>
            <%
				}
			%> 
	     </tbody>
    </table>
    <% 
    } else {
    %>
		<script>
			alert('로그인을 해주세요');
			location.href = 'empLogin.jsp';	//
		</script>
	 <% 
    }
    %>
    <script src="js/script.js"></script>

</body>
</html>