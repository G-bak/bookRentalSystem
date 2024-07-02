<%@ page import="db2.dao.RentalDAO"%>
<%@ page import="db2.dto.RentalDTO"%>
<%@ page import="db2.dao.ReserveStatusDAO"%>
<%@ page import="db2.dto.ReserveStatusDTO"%>
<%@ page import="db2.dao.BookInfoDAO"%>
<%@ page import="db2.dto.BookInfoDTO"%>
<%@ page import="db2.dao.ReserveAbleDAO"%>
<%@ page import="db2.dto.ReserveAbleDTO"%>
<%@ page import="db2.dao.BookQuantityRentalStatusDAO"%>
<%@ page import="db2.dto.BookQuantityRentalStatusDTO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Loan System</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div class="header">
        <h1>도서 대여 시스템</h1>
    </div>
    
    <div class="section-title">
    	<span>대여 현황 조회</span>
    	&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-reserve-status">예약내역조회</button>
    	&nbsp;&nbsp;<button type="button" class="btn btn-reserve-expiration-status" onclick="open543()">예약만료내역조회</button>
    	<script>
    		function open543() {
    			document.querySelector('.reserve-expiration-status-container').style.display = 'flex';
    		}
    	</script>
    </div>
    <div class="search-box">
        <div class="search-group">
	        <form action="rentalStatus.jsp" method="POST" id="frm_rentno">
	            <input type="text" id="input_rentno" name="rentno" placeholder="대여번호">
	            <button type="submit">검색</button>
	        </form>
        </div>
        <div class="search-group">
	        <form action="rentalStatus.jsp" method="POST" id="frm_mname">
	            <input type="text" id="input_mname" name="mname" placeholder="회원명">
	            <button type="submit">검색</button>
	        </form>
        </div>
        <div class="search-group">
	        <form action="rentalStatus.jsp" method="POST" id="frm_bname">
	            <input type="text" id="input_bname" name="bname" placeholder="도서제목">
	            <button type="submit">검색</button>
	        </form>
        </div>  
        <form action="rentalStatus.jsp" method="POST" id="frm_date">
            <div class="form-group" style="display: inline-block;">
                <label for="start-date" style="font-size: 1rem;">대여날짜</label>
                <input type="date" id="input_startDate" name="startDate" style="padding: 7px;">
            </div>&nbsp;
            <div class="form-group" style="display: inline-block;">
                <label for="end-date">종료범위지정</label>
                <input type="date" id="input_endDate" name="endDate" style="padding: 7px;">
            </div>
            <button type="submit">검색</button>
        </form> 
        <div class="search-group">
        	&nbsp;&nbsp;&nbsp;
        	<form action="rentalStatus.jsp" method="POST" id="frm_rstatus">
	            <input type="text" id="input_rstatus" name="rstatus" placeholder="대여상태">
	            <button type="submit">검색</button>
            </form>
        </div>
    </div>
    <div class="modal-container reserve-status-container">
        <div class="reserve-status-title">예약내역조회</div>
        <div class="btn-close btn-reserve-status-container-close">&nbsp;X&nbsp;</div>
        
        <div class="reserve-status-table-container">
            <table id="reserve-status-table" style="width: 684px;">
                <thead>
                    <tr>
                        <th>예약번호</th>
                        <th>회원명</th>
                        <th>도서제목</th>
                        <th>예약대기날짜</th> 
                        <th>예약완료날짜</th>    
                        <th>예약상태</th> 
                        <th>구분</th>
                    </tr>
                </thead>
                <tbody>
                <%
                ReserveStatusDAO reserveStatusDAO = new ReserveStatusDAO();
                List<ReserveStatusDTO> reserveList = reserveStatusDAO.selectAllReserveStatus();
                
                if (reserveList != null) {
                	for (ReserveStatusDTO reserve : reserveList) { %>
                		<tr>
	                        <td><%=reserve.getReserve_id()%></td>
	                        <td><%=reserve.getMname()%></td>
	                        <td class="td"><div class="scroll"><%=reserve.getBname()%></div></td>
	                        <td><%=reserve.getReserve_wait_date()%></td>
	                        <td><%=reserve.getReserve_comp_date()%></td>
	                        <td><strong><%=reserve.getReserve_status()%></strong></td>
	                        <td>
	                        	<% if (reserve.getReserve_status().equals("예약완료")) { %>
		        					<button type="button" class="btn">대여</button>
		    					<% } %>
	                        </td>
                    	</tr>
                <% } 
                }%>
                </tbody>
            </table>
        </div>
    </div>
    <div class="modal-container reserve-expiration-status-container">
        <div class="reserve-status-title">예약만료내역조회</div>
        <div class="btn-close btn-reserve-expiration-status-container-close" onclick="close543()">&nbsp;X&nbsp;</div>
        <script>
    		function close543() {
    			document.querySelector('.reserve-expiration-status-container').style.display = 'none';
    		}
    	</script>
        <div class="reserve-status-table-container">
            <table id="reserve-status-table" style="width: 684px;">
                <thead>
                    <tr>
                        <th>예약번호</th>
                        <th>회원명</th>
                        <th>도서제목</th>
                        <th>예약완료날짜</th>    
                        <th>예약상태</th>
                        <th>구분</th>
                    </tr>
                </thead>
                <tbody>
                <%
                List<ReserveStatusDTO> reserveCancelList = reserveStatusDAO.selectReserveExpirationStatus();
                
                if (reserveCancelList != null) {
                	for (int i = 0; i < reserveCancelList.size(); i++) { %>
                		<form action="reserveCancel_action.jsp" method="post" id="frm-reserve-cancel">
	                		<tr>
	                			<input type="hidden" id="input-rsv-reserve_id" name="rsv_reserve_id">	                			
		                        <td id="param-rsvno<%=i%>"><%=reserveCancelList.get(i).getReserve_id()%></td>
		                        <td><%=reserveCancelList.get(i).getMname()%></td>
		                        <td class="td"><div class="scroll"><%=reserveCancelList.get(i).getBname()%></div></td>
		                        <td><%=reserveCancelList.get(i).getReserve_comp_date()%></td>
		                        <td><strong><%=reserveCancelList.get(i).getReserve_status()%></strong></td>
		                        <td><button type="submit" class="btn" onclick="reserve_cancel(<%=i%>)">예약취소</button></td>
		                        <script>
		                        	function reserve_cancel(i) {
		                        		let param1 = document.querySelector('#param-rsvno'+i).innerText;
		                        		document.querySelector('#input-rsv-reserve_id').value = param1;
		                        		console.log("text 통과1");
		                        		if (document.querySelector('#input-rsv-reserve_id').value != null) {
		                        			document.querySelector('#frm-reserve-cancel').submit();		                        			
		                        		}
		                        	}
		                        </script>
	                    	</tr>
                    	</form>
                <% } 
                }%>
                </tbody>
            </table>
        </div>
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
                <th>구분</th>
            </tr>
        </thead>
        <tbody>
           <%
           	request.setCharacterEncoding("UTF-8");
                      
           	RentalDAO rentalDAO = new RentalDAO();
           	List<RentalDTO> rentalList = null;
           	boolean isEmptyStr = false;
           	List<String> db_params = new ArrayList<>();
           	String targetStr = null;
           	int targetNo = 0;
           	
           	String str_rentno = request.getParameter("rentno");
           	String mname = request.getParameter("mname"); 
           	String bname = request.getParameter("bname"); 
           	String startDate = request.getParameter("startDate"); 
           	String endDate = request.getParameter("endDate"); 
           	String rstatus = request.getParameter("rstatus");           	
           	
           	String[] params = new String[] {str_rentno, mname, bname, startDate, endDate, rstatus};
           								
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
           					int rentno = Integer.parseInt(str_rentno);
           	           		rentalList = rentalDAO.selectRentalByRentno(rentno);
           	           		break;
           				case 1:
           	           		rentalList = rentalDAO.selectRentalByMname(mname);
           	           		break;
           				case 2:
           	           		rentalList = rentalDAO.selectRentalByBname(bname);
           	           		break;
           				case 3:
        	           		rentalList = rentalDAO.selectRentalByStartDateEndDate(startDate, endDate);               				 	
           	           		break;
           				case 4:
           	           		break;
           				case 5:
           					switch (rstatus) {
           						case "대여중":
           							rstatus = "rt";
           							break;
           						case "연체중":
           							rstatus = "od";
           							break;
           						case "반납완료":
           							rstatus = "cp";
           							break;
           						case "예약":
           							rstatus = "rs";
           							break;
           						case "예약취소":
           							rstatus = "cc";  
           							break;
           					}
           	           		rentalList = rentalDAO.selectRentalByRstatus(rstatus);
           	           		break;
           			}           			
           		}
           	}
           	
           	if (isEmptyStr) {
           		if (startDate == null && endDate == null) 
           			rentalList = rentalDAO.selectAllRental();
           		else {
					if (startDate.equals("") && !endDate.equals("")) { %>
						<script>
						alert("대여날짜를 입력해주세요!");
						</script>
				 <% } else if (endDate.equals("") && !startDate.equals("")) { %>
				 		<script>
						alert("종료범위를 지정해주세요!");
						</script>
				 <% } else {
				 		rentalList = rentalDAO.selectAllRental(); %>
				 	}
           	  <%  } 
           	   } 
            }
			
          	if (rentalList != null) {
	           for (RentalDTO rental : rentalList) { %>
	           	<tr>
					<td><%=rental.getRentno()%></td>
	           		<td><%=rental.getMname()%></td>
	           		<td><%=rental.getBname()%></td>
	           		<td><%=rental.getRental_date()%></td>
	           		<td><%=rental.getReturn_date()%></td>
	           		<td><%=rental.getOd_date()%></td>
	           		<td><%=rental.getStop_date()%></td>
	           		<td><%=rental.getComp_date()%></td>
	           		<td><%=rental.getRstatus()%></td>
	           		<td>
	           			<% if (!"반납완료".equals(rental.getRstatus())) { %>
        					<button type="button" class="btn">반납</button>
    					<% } %>
	           		</td>
	           	</tr>
			<% } 
			} else {
				System.out.println("NULL");
			}
          	%>
        </tbody>
    </table>
    
    <div class="section-title">
    	<span>도서 조회</span>
    	&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-book-quantity-rental-status" onclick="test()">도서별 재고 및 대여현황</button>
        <script>
        function test() {
        	document.querySelector('.book-quantity-rental-status-container').style.display = 'flex';
        }
        </script>
   	</div>
   	<div class="modal-container book-quantity-rental-status-container">
        <div class="book-reserve-title">도서별 재고 및 대여현황</div>
        <div class="btn-close btn-book-quantity-rental-status-container-close" onclick="close23232()">&nbsp;X&nbsp;</div>
        <script>
        function close23232() {
        	document.querySelector('.book-quantity-rental-status-container').style.display = 'none';
        }
        </script>
        <div class="book-quantity-rental-status-table-container">
            <table id="book-quantity-rental-status-table" style="width: 684px;">
                <thead>
                    <tr>
                        <th>도서번호</th>
                        <th>도서제목</th>
                        <th>대여현황</th>
                        <th>재고</th>
                        <th>상태</th>
                        <th>구분</th>
                    </tr>
                </thead>
                <tbody>
                <%
                BookQuantityRentalStatusDAO b = new BookQuantityRentalStatusDAO();
                
                List<BookQuantityRentalStatusDTO> bList = new ArrayList<BookQuantityRentalStatusDTO>();
                bList = b.selectAllBookQuantityRentalStatus();
                String param_bname = null;       
                int param_bookno = 0; 
                
                if (bList.size() != 0) {
                	for (int i = 0; i < bList.size(); i++) { %>
	                	<tr>
	                        <td id="param_bookno<%=i%>"><%=bList.get(i).getBookno()%></td>
	                        <td class="td" id="param_bname<%=i%>"><div class="scroll"><%=bList.get(i).getBname()%></div></td>
	                        <td><%=bList.get(i).getRentalStatusCount()%>건</td>
	                        <td><%=bList.get(i).getBcount()%>권</td>
	                        <td><%=bList.get(i).getRentalStatus()%></td>
	                        <td>
	                        	<%if (bList.get(i).getRentalStatus().equals("예약만 가능")) {%>
	                        		<button id="btn-reserve<%=i%>" class="btn" style="border: 1px solid rgb(83, 83, 83)" onclick="insertReservation(<%=i%>)">
	                        			<script type="text/javascript">
	                        				function insertReservation(i) {
	                        					reserveContainer.style.display = 'flex';
	                        					
	                        					document.querySelector("#rsv-bname").innerText = document.querySelector("#param_bname"+i).innerText;
	                        					document.querySelector("#input_br_bookno").value = document.querySelector("#param_bookno"+i).innerText;
	                        					console.log(document.querySelector("#input_br_bookno").value);	                        	
	                        				}
	                        			</script>
	                        			<strong>예약</strong>
	                        		</button>
	                        	<%} else {%>
	                        		<button id="" class="btn">대여</button>
	                        	<%}%>
	                        </td>
                    	</tr>
                	<% }
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
    
   	<div class="reserve-container">
       	<div class="reserve-title">도서 예약</div>
        <div class="btn-close btn-reserve-container-close" onclick="close52()">&nbsp;X&nbsp;</div>
        <script type="text/javascript">
        	function close52() {
        		document.querySelector('.reserve-container').style.display = 'none';
        	}
        </script>
        <div class="reserve-table-container">
            <form action="reservation_action.jsp" method="post">
                <div style="margin-top: 20px;" class="td"><strong>도서명</strong>
                    <div class="scroll" id="rsv-bname"></div>
                </div>              
               	<input type="text" id="input_br_membno" name="rs-membno" placeholder="회원번호">
               	<input type="hidden" id="input_br_bookno" name="rs-bookno">
               	<button type="submit">전송</button>             
            </form>
        </div>
    </div>

    <script src="js/script.js"></script>

</body>
</html>