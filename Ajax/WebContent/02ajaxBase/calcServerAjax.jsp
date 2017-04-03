<%@page contentType="text/html; charset=EUC-KR" %>
<%@page pageEncoding="EUC-KR"%>

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

<% 	System.out.println("calcServerAjax(ajax적용) sold ==>"+soldValue); %>

<%= soldValue %>