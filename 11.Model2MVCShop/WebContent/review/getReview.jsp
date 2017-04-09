<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
<meta charset="EUC-KR">
	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	$('button:contains("�亯���/����")').on('click',function(){
		self.location="/review/updateAnswerView/${review.reviewNo}";
	});
	$('button:contains("�ı����")').on('click',function(){
		self.location="/review/updateReviewView/${review.reviewNo}";
	});
	$('button:contains("����")').on('click',function(){
		event.preventDefault();
		history.back(1);
	});
});
</script>
<title>Insert title here</title> 
</head>
<body>

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End   /////////////////////////////////////-->

<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<div class="container">
	<div class="page-header">
		<h3 class="text-default">�ı� ����</h3>
		<h5 class="text-muted">${review.purchaseItem.prodName}</h5>
	</div>
	<div class="row">
		<div class="col-xs-1 col-md-3 "><b>��ǰ��</b></div>
		<div class="col-xs-1 col-md-3 "><b>������</b></div>
		<div class="col-xs-1 col-md-3 "><b>����</b></div>
		<div class="col-xs-1 col-md-3 "><b>�����</b></div>
	</div>
	<div class="row">
		<div class="col-xs-2 col-md-3">${review.purchaseItem.prodName}</div>
		<div class="col-xs-2 col-md-3">${review.buyer.userId}</div>
		<div class="col-xs-2 col-md-3">${review.grade}</div>
		<div class="col-xs-2 col-md-3">${review.regDate}</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-xs-4 col-md-2"><b>����</b><p class="pull-right">:</p></div>
		<div class="col-xs-8 col-md-4">${review.reviewTitle }</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-xs-4 col-md-2"><b>����</b><p class="pull-right">:</p></div>
		<div class="col-xs-8 col-md-4">
			<c:if test="${review.imageName != null}">
				<img src="images/reviewImages/${review.imageName}"><br/>
			</c:if>
			${review.reviewContent}
		</div>
	</div>
	<c:if test="${review.answerTitle != null}">
		<hr/>
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>�亯����</strong></div>
			<div class="col-xs-8 col-md-4">${review.answerTitle}</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>�亯����</strong></div>
			<div class="col-xs-8 col-md-4">${review.answerContent }</div>
		</div>
	</c:if>
	
	<div class="form-group">
		<div class="col-sm-offset-4	col-sm-4 text-center">
			<c:if test='${user.role=="admin"}'>
				<button class="btn btn-default">�亯���/����</button>
			</c:if>
			<c:if test='${user.role=="user" && empty review.answerTitle}'>
				<button class="btn btn-default">�ı����</button>
			</c:if>
			<button class="btn btn-default">����</button>
		</div>
	</div>

</div>
<!--  ȭ�鱸�� div End /////////////////////////////////////-->

<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>
</html>