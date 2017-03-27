<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" 
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title> 
</head>

<form name="detailForm" method="post">

<table class="table">
	<tr>
		<td>제품명</td>
		<td>구매자</td>
		<td>평점</td>
		<td>등록일</td>
	</tr>
	<tr>
		<td>${review.purchaseItem.prodName}</td>
		<td>${review.buyer.userId}</td>
		<td>${review.grade}</td>
		<td>${review.regDate}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">
			${review.reviewTitle }
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">
			<c:if test="${review.imageName != null}">
				<img src="images/reviewImages/${review.imageName}"><br/>
			</c:if>
			${review.reviewContent}
		</td>
	</tr>
	<c:if test="${review.answerTitle != null}">
		<tr>
			<td>답변제목</td>
			<td colspan="3">
				${review.answerTitle}
			</td>
		</tr>
		<tr>
			<td>답변내용</td>
			<td colspan="3">
				${review.answerContent }
			</td>
		</tr>
	</c:if>
	
</table>
</form>
<c:if test='${user.role=="admin"}'>
	<button class="btn btn-default" onclick="location.href='/review/updateAnswerView/${review.reviewNo}'">답변등록/수정</button>
</c:if>
<c:if test='${user.role=="user" && empty review.answerTitle}'>
	<button class="btn btn-default" onclick="location.href='/review/updateReviewView/${review.reviewNo}'">수정</button>
</c:if>
<button class="btn btn-default" onclick="javascript:history.go(-1)">이전</button>

</body>
</html>