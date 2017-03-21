<%@ page contentType="text/html; charset=euc-kr" %>
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

<%----------------------------------------------------------------%>
<c:set var="start" value="${resultPage.currentPage-2}"/>
<c:if test="${start<1}">
	<c:set var="start" value="1"/>
</c:if>
<c:set var="end" value="${start+4}"/>
<c:if test="${end>resultPage.maxPage}">
	<c:set var="end" value="${resultPage.maxPage}"/>
</c:if>
<%----------------------------------------------------------------%>



<div class="btn-group btn-group-sm">
	<%----------------------------------------------------------------%>
	<c:if test="${resultPage.currentPage > 1 }">
		<button type="button" class="btn btn-default" 
			onclick="javascript:fncGetList('${(resultPage.currentPage-5)<1?1:resultPage.currentPage-5}');">¢¸</button>
	</c:if>
	<c:if test="${resultPage.currentPage <= 1 }">
		<button type="button" class="btn btn-default disabled">¢·</button>
	</c:if>
	<%----------------------------------------------------------------%>
	<c:forEach var="i" begin="${start}" end="${end}" step="1">
		<c:if test="${resultPage.currentPage!=i}">
			<button type="button" class="btn btn-default" 
				onclick="javascript:fncGetList('${i}');">${i}</button>
		</c:if>
		<c:if test="${resultPage.currentPage==i}">
			<button type="button" class="btn btn-info">${i}</button>
		</c:if>
	</c:forEach>
	<%----------------------------------------------------------------%>
	<c:if test="${resultPage.currentPage < resultPage.maxPage}">
		<button type="button" class="btn btn-default" 
			onclick="javascript:fncGetList('${(resultPage.currentPage+5)>resultPage.maxPage ? resultPage.maxPage : resultPage.currentPage+5 }')">¢º</button>
	</c:if>
	<c:if test="${resultPage.currentPage >= resultPage.maxPage}">
		<button type="button" class="btn btn-default disabled">¢¹</button>
	</c:if>
	<%----------------------------------------------------------------%>
</div>