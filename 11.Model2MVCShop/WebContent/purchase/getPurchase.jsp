<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="EUC-KR">
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Font ////////////////////////// -->
<link href="https://fonts.googleapis.com/css?family=Oxygen|Syncopate" rel="stylesheet">

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="/css/theme.min.css" >
<link rel="stylesheet" href="/css/custom-theme.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	</style>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function(){
		$('button:contains("수정")').on('click',function(){
			self.location="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}";
		});
		$('button:contains("이전")').on('click',function(event){
			event.preventDefault();
			history.back(1);
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
		<div class="page-header">
			<h3 class=" text-info">구매내역 상세조회</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>물품번호</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자아이디</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매방법</strong></div>
			<div class="col-xs-8 col-md-4">${(purchase.paymentOption=="0")?"현금거래":"신용구매"}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자이름</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자연락처</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자주소</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.dlvyAddr}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매요청사항</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.dlvyRequest}</div>
		</div>
		<div class="row">
				<div class="col-xs-4 col-md-2 "><strong>배송희망일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.dlvyDate}</div>
		</div>
		<div class="row">
				<div class="col-xs-4 col-md-2 "><strong>주문일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
				<div class="col-md-12 text-center">
					<c:if test="${purchase.buyer.userId == user.userId}">
						<button class="btn btn-default">수정</button>
					</c:if>	
					<button class="btn btn-default">이전</button>
				</div>
		</div>
	</div>
<!--  화면구성 div end   /////////////////////////////////////-->
<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>

</html>