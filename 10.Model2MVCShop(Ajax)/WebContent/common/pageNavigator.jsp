<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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