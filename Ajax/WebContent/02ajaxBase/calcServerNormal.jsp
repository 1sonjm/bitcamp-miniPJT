<%@page contentType="text/html; charset=EUC-KR" %>
<%@page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
</head>

<body>

<%
	//==> 가상으로 제품판매 갯수 reqeust시 10개씩 증가
	Integer sold = (Integer)application.getAttribute("sold");
	
	if( sold == null ){
		sold = new Integer(100);
		application.setAttribute("sold",sold);
	}
	int soldValue = sold.intValue() + 10;
	
	application.setAttribute("sold",new Integer(soldValue));
%>

<%	System.out.println("calcServerNormal.jsp(기존방식) sold ==>"+soldValue);%>

	<h1> 판매 보고서</h1>

		<table>
			<tr>
				<th>판매된 상품 갯수</th>
				<td><span id="sold"><%= soldValue %></span></td>
			</tr>
			<tr>
				<th>상품 단가</th>
				<td><span id="price">100</span>원</td>
			</tr>
		</table>
		
		<h2>총 매출금액  :  <span id="cash"><%= soldValue*100 %>원</span></h2>
		
		<form action="calcServerNormal.jsp" method="POST">
			<input type="submit" value="판매보고서 다시보기(기존방식)">
		</form>

</body>

</html>