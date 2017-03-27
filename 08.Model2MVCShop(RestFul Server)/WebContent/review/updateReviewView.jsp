<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head><!-- jQuery -->
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
<title>상품등록</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">
function fncUpdateReview(){
	document.detailForm.action='/review/updateReview/${review.reviewNo}';
	document.detailForm.submit();
}

function resetData(){
	document.detailForm.reset();
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

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
		<td><input type="text" size="3" maxlength="1" name="grade" value="${review.grade}"/></td>
		<td>${review.regDate}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">
			<input type="text" class="form-control" name="reviewTitle" value="${review.reviewTitle }">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">
			<textarea name="reviewContent" rows="4" cols="50">${review.reviewContent}</textarea>
		</td>
	</tr>
</table>

<button class="btn btn-default" onclick="javascript:fncUpdateReview();">등록</button>
<button class="btn btn-default" onclick="javascript:resetData();">취소</button>

</form>
</body>
</html>