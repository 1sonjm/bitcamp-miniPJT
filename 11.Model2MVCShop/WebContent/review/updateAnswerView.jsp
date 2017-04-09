<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
<meta charset="EUC-KR">
	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Font ////////////////////////// -->
<link href="https://fonts.googleapis.com/css?family=Oxygen|Syncopate" rel="stylesheet">

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="/css/theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap custom Theme-->
<link rel="stylesheet" href="/css/custom-theme.css" >

<script type="text/javascript">
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

<body>

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End   /////////////////////////////////////-->

<!--  화면구성 div Start /////////////////////////////////////-->
<div class="container">
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
			<textarea class="form-control" name="answerContent" rows="4" cols="50">${review.answerContent}</textarea>
		</td>
	</tr>
	
	
</table>

<button class="btn btn-default">등록</button>
<button class="btn btn-default">취소</button>

</form>

</div>
<!--  화면구성 div End /////////////////////////////////////-->
<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>
</html>