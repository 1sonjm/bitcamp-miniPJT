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

<!-- rateYo! Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.2.0/jquery.rateyo.min.css">
<!-- rateYo! Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.2.0/jquery.rateyo.min.js"></script>

<!-- Bootstrap custom Theme-->
<link rel="stylesheet" href="/css/custom-theme.css" >

<script type="text/javascript" src="../javascript/calendar.js">
</script>
<script type="text/javascript">
$(function(){
	$('button:contains("등록")').on('click',function(){
		$('form').attr('action','/review/updateReview/${review.reviewNo}').submit();
	});
	$('button:contains("취소")').on('click',function(){
		$('form')[0].reset();
	});
});

//rateYo!
$(function () {
	$("#rateYo").rateYo({
		rating: "${review.grade}",
		starWidth: "40px",
		fullStar: true,
		onSet: function (rating, rateYoInstance) {
			$('input[name="grade"]').val(rating);
		}
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
		<td>제품명</td>
		<td>구매자</td>
		<td>평점</td>
		<td>등록일</td>
	</tr>
	<tr>
		<td>${review.purchaseItem.prodName}</td>
		<td>${review.buyer.userId}</td>
		<td>
			<div id="rateYo"></div>
			<input type="hidden" name="grade"/>
		</td>
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
			<textarea class="form-control" name="reviewContent" rows="4" cols="50">${review.reviewContent}</textarea>
		</td>
	</tr>
</table>

<button type="button" class="btn btn-default">등록</button>
<button type="button" class="btn btn-default">취소</button>

</form>

</div>
<!--  화면구성 div End /////////////////////////////////////-->
<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>
</html>