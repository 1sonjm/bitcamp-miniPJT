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

<script type="text/javascript">
$(function(){
	$('button:contains("등록")').on('click',function(){
		$('form').attr('action','/review/updateAnswer/${review.reviewNo}').submit();
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
		readOnly: true
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
	<div class="row">
		<div class="col-xs-1 col-md-3 "><b>제품명</b></div>
		<div class="col-xs-1 col-md-3 "><b>구매자</b></div>
		<div class="col-xs-1 col-md-3 "><b>평점</b></div>
		<div class="col-xs-1 col-md-3 "><b>등록일</b></div>
	</div>
	<div class="row">
		<div class="col-xs-2 col-md-3">${review.purchaseItem.prodName}</div>
		<div class="col-xs-2 col-md-3">${review.buyer.userId}</div>
		<div class="col-xs-2 col-md-3">
			<div id="rateYo"></div>
		</div>
		<div class="col-xs-2 col-md-3">${review.regDate}</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-xs-4 col-md-2"><b>제목</b><p class="pull-right">:</p></div>
		<div class="col-xs-8 col-md-4">${review.reviewTitle }</div>
	</div>
	<div class="row">
		<div class="col-xs-4 col-md-2"><b>내용</b><p class="pull-right">:</p></div>
		<div class="col-xs-8 col-md-4">
			<c:if test="${review.imageName != null}">
				<img src="images/reviewImages/${review.imageName}"><br/>
			</c:if>
			${review.reviewContent}
		</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-xs-4 col-md-2"><b>답변 제목</b><p class="pull-right">:</p></div>
		<div class="col-xs-8 col-md-4"><input type="text" class="form-control" name="answerTitle" value="${review.answerTitle}"></div>
	</div>
	<div class="row">
		<div class="col-xs-4 col-md-2"><b>답변 내용</b><p class="pull-right">:</p></div>
		<div class="col-xs-8 col-md-4"><textarea name="answerContent" rows="4" cols="50">${review.answerContent}</textarea></div>
	</div>

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