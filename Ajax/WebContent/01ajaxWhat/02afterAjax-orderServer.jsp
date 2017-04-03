<%@page contentType="text/html; charset=EUC-KR" %>
<%@page pageEncoding="EUC-KR"%>

<%
	//==> 가상으로 번지수를 reqeust시 10씩 증가
	Integer addr = (Integer)session.getAttribute("addr");
	if( addr == null ){
		addr = new Integer(100);
		session.setAttribute("addr",addr);
	}
	int addrValue = addr.intValue() + 10;
	session.setAttribute("addr",new Integer(addrValue));

	String phone =  request.getParameter("phone");

	//==> DBMS에서 전화번호 정보를 이용하여 주소를 검색했다고 가정
	System.out.println("02afterAjax-orderServer.jsp  ::   전화="+phone+" 번지="+addrValue);
%>

전화번호 :  <%=phone%> 고객님
주소 : 서울시  <%= (addrValue) %> 번지 입니다