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


<div class="container text-center">
	<nav>
		<ul class="pagination" >
			<%----------------------------------------------------------------%>
			<c:if test="${resultPage.currentPage <= 1 }">
				<li class="disabled">
			</c:if>
			<c:if test="${resultPage.currentPage > 1 }">
				<li>
			</c:if>
					<a targetPage="${(resultPage.currentPage-5)<1?1:resultPage.currentPage-5}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			<%----------------------------------------------------------------%>
			<c:forEach var="i" begin="${start}" end="${end}" step="1">
				<c:if test="${resultPage.currentPage!=i}">
					<li>
						<a targetPage="${i}">${i}</a>
					</li>
				</c:if>
				<c:if test="${resultPage.currentPage==i}">
					<li class="active">
						<a targetPage="${i}">${i}
							<span class="sr-only">(current)</span>
						</a>
					</li>
				</c:if>
			</c:forEach>
			<%----------------------------------------------------------------%>
			<c:if test="${resultPage.currentPage >= resultPage.maxPage}">
				<li class="disabled">
			</c:if>
			<c:if test="${resultPage.currentPage < resultPage.maxPage}">
				<li>
			</c:if>
					<a targetPage="${(resultPage.currentPage+5)>resultPage.maxPage ? resultPage.maxPage : resultPage.currentPage+5 }" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			<%----------------------------------------------------------------%>
		</ul>
	</nav>
</div>
