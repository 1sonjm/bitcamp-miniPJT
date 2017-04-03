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
$(function(){
	$('button:contains("등록")').on('click',function(){
		$('form').attr('action','/review/addReview/${purchase.tranNo}').submit();
	});
	$('button:contains("취소")').on('click',function(){
		$('form')[0].reset();
	});
});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" method="post">
<table class="table">
	<tr>
		<td>제품명</td>
		<td>구매자</td>
		<td>평점</td>
	</tr>
	<tr>
		<td>${purchase.purchaseProd.prodName}</td>
		<td>${user.userId}</td>
		<td><input type="text" size="3" maxlength="1" name="grade"/></td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="2">
			<input type="text" class="form-control" name="reviewTitle">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="2">
			<textarea name="reviewContent" rows="4" cols="50"></textarea>
		</td>
	</tr>
</table>
</form>

<button class="btn btn-default">등록</button>
<button class="btn btn-default">취소</button>

</body>
</html>