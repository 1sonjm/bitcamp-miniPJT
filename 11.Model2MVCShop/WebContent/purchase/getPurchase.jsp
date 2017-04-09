<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="EUC-KR">
<!-- ���� : http://getbootstrap.com/css/   ���� -->
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


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	</style>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function(){
		$('button:contains("����")').on('click',function(){
			self.location="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}";
		});
		$('button:contains("����")').on('click',function(event){
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

	<div class="container">
		<div class="page-header">
			<h3 class=" text-info">���ų��� ����ȸ</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���Ź��</strong></div>
			<div class="col-xs-8 col-md-4">${(purchase.paymentOption=="0")?"���ݰŷ�":"�ſ뱸��"}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.dlvyAddr}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���ſ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.dlvyRequest}</div>
		</div>
		<div class="row">
				<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.dlvyDate}</div>
		</div>
		<div class="row">
				<div class="col-xs-4 col-md-2 "><strong>�ֹ���</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
				<div class="col-md-12 text-center">
					<c:if test="${purchase.buyer.userId == user.userId}">
						<button class="btn btn-default">����</button>
					</c:if>	
					<button class="btn btn-default">����</button>
				</div>
		</div>
	</div>
<!--  ȭ�鱸�� div end   /////////////////////////////////////-->
<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>

</html>