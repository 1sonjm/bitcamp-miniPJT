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

<script type="text/javascript" src="../javascript/calendar.js"></script>

<script type="text/javascript">
function fncUpdateReviewAnswer(){
	document.detailForm.action=;
	document.detailForm.submit();
}

function resetData(){
	document.detailForm.reset();
}
$(function(){
	$('button:contains("등록")').on('click',function(){
		$('form').attr('action','/review/updateAnswer/${review.reviewNo}').submit();
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
		<td>후기 제목</td>
		<td>${review.reviewTitle}</td>
	</tr>
	<tr>
		<td>후기 내용</td>
		<td>${review.reviewContent}</td>
	</tr>
	<tr>
		<td>답변 제목</td>
		<td>
			<input type="text" class="form-control" name="answerTitle" value="${review.answerTitle}">
		</td>
	</tr>
	<tr>
		<td>답변 내용</td>
		<td>
			<textarea name="answerContent" rows="4" cols="50">${review.answerContent}</textarea>
		</td>
	</tr>
	
	
</table>

<button class="btn btn-default" onclick="javascript:fncUpdateReviewAnswer();">등록</button>
<button class="btn btn-default" onclick="javascript:resetData();">취소</button>

</form>
</body>
</html>