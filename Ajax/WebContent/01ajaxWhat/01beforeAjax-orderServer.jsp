<%@page contentType="text/html; charset=EUC-KR" %>
<%@page pageEncoding="EUC-KR"%>

<%
	//==> 임의로 번지수를 reqeust시 10씩 증가
	Integer addr = (Integer)session.getAttribute("addr");
	if( addr == null ){
		addr = new Integer(100);
		session.setAttribute("addr",addr);
	}
	int addrValue = addr.intValue() + 10;
	session.setAttribute("addr",new Integer(addrValue));

	String phone =  request.getParameter("phone");

	//==> DBMS에서 전화번호 정보를 이용하여 주소를 검색했다고 가정
	 System.out.println("01beforeAjax-orderServer.jsp  ::   전화="+phone+" 번지="+addrValue);
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
</head>

<body onload="document.forms[0].reset()">

	<form method="post" action="01beforeAjax-orderServer.jsp" >
	
		<p>전 화 번 호 :  
			<input type="text" size="14" name="phone" id="phone" value=<%=phone %> ></input>
		</p>
		
		<p>배 달 장 소 : </p>  
		<p>
			<textarea 	rows="4" cols="50" name="address" id="address" >
				<%="\n 전화번호 :  "+phone+"고객님\n 주소 : 서울시 "+ addrValue +" 번지 입니다."%>
			</textarea>	
		</p>
		
		<p style="color: red;">기존회원은 전화번호 입력후주문버튼을누르세요...</p>
		
		<p><input type="submit" value="주문하기" id="submit"/></p>	
		
	</form>
	
</body>

</html>