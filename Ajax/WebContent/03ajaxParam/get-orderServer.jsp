<%@page contentType="text/html; charset=EUC-KR" %>
<%@page pageEncoding="EUC-KR"%>

 <%@page import="java.io.*" %>

<%
	//==> 한글처리 NG
	//String name =  request.getParameter("name");
	//==> 한글처리 OK
	String name =  this.convertKo(request.getParameter("name"));
	
	String phone = request.getParameter("phone");
	
	System.out.println( request.getQueryString());
	
	//==> 주소를 임의로 발생시키기...
	String address ="";
	int random = new java.util.Random().nextInt(3);
	if( random ==0 ){
		address = "서울";
	}else if( random ==1 ){
		address = "부산";
	}else{
		address = "제주도";
	}
%>

<%
	 System.out.println("get-orderServer.jsp  ::   이름="+name+" 주소="+address+" 전화="+phone);
%>
이름 : <%= name %> 고객님
전화 : <%= phone %>
주소 : <%= address %>


<%!
	///Method //==>한글변환(GET) 
	private String convertKo(String paramValue){
		String convertParamValue = null;
		try{
			//==> API를 확인요망
			byte[] b = paramValue.getBytes("8859_1");
			convertParamValue = new String(b,"EUC_KR");
		}catch(UnsupportedEncodingException uee){
			System.out.println("한글 변환중 Exception 발생");
			uee.printStackTrace();
		}
		return convertParamValue;
	}
%>