<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" 
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
<html>
<head>
<title>열어본 상품 보기</title>
</head>

<body>
<c:if test="${viewListMap!=null}">
	<table class="table table-hover">
		<thead>
			<tr>
				<td>순번</td>
				<td>제품명</td>
			</tr>
		</thead>
		<c:set var="i" value="0"/>
		<c:forEach items="${viewListMap}" var="viewProudctItem">
			
			<tr>
				<td><c:set var="i" value="${i+1}"/>${i}</td>
				<td><a href="/getProduct.do?prodNo=${viewProudctItem.key}&menu=search" target="rightFrame">
					${viewProudctItem.value}</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
<c:if test="${viewListMap==null}">
	<p class="bg-info">최근 본 상품이 존재하지 않습니다.</p>
</c:if>
</body>
</html>