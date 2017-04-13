<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--	///////////////////////// JSTL	////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>


<meta charset="EUC-KR">
<!-- ���� : http://getbootstrap.com/css/	 ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--	///////////////////////// Font ////////////////////////// -->
<link href="https://fonts.googleapis.com/css?family=Oxygen|Syncopate" rel="stylesheet">

<!--	///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="/css/theme.min.css" >
<link rel="stylesheet" href="/css/custom-theme.css" >
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

<!--	///////////////////////// CSS ////////////////////////// -->
<style>
</style>
<!--	///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	$(function(){
		$('input[name="dlvyDate"]').datepicker({
			dateFormat: "yymmdd",
			minDate: 0
		});
		$('button:contains("����")').on('click',function(){
			$('form').attr('method','post').attr('action','/purchase/updatePurchase?tranNo=${purchase.tranNo}').submit();
		});
		$('button:contains("���")').on('click',function(event){
			event.preventDefault();
			history.back(1);
		});
	});
</script>
</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
	
<!--	ȭ�鱸�� div Start /////////////////////////////////////-->

<div class="container">

	<div class="page-header text-center">
		<h3 class=" text-info">�ֹ� ����</h3>
	</div>

	<!-- form Start /////////////////////////////////////-->
	<form class="form-horizontal">
		<input type="hidden" name="prodNo" value="${product.prodNo}"/>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
			<div class="col-sm-4">
				<input 	type="text" class="form-control" name="buyerId" value='${purchase.buyer.userId}'>
			</div>
		</div>
	
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">���Ź�� </label>
			<div class="col-sm-4">
				<select name="paymentOption" class="form-control">
					<option value="1" ${purchase.paymentOption=="1"?"selected":""}>���ݱ���</option>
					<option value="2" ${purchase.paymentOption=="2"?"selected":""}>�ſ뱸��</option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="receiverName" value="${purchase.receiverName}">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="price" maxlength="5" value="${purchase.receiverPhone}">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">������ �ּ�</label>
			<div class="col-sm-4">
				<input	type="text" class="form-control" name="fileName" value="${purchase.dlvyAddr}"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
			<div class="col-sm-4">
				<input	type="text" class="form-control" name="fileName" value="${purchase.dlvyRequest}"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">����������</label>
			<div class="col-sm-4">
				<input	type="text" readonly class="form-control" name="dlvyDate" value="${purchase.dlvyDate}" />
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4	col-sm-4 text-center">
				<button type="button" class="btn btn-default">����</button>
				<button type="button" class="btn btn-default">���</button>
			</div>
		</div>
	</form>
	<!-- form End /////////////////////////////////////-->
</div>
<!--	ȭ�鱸�� div end /////////////////////////////////////-->
	
<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->

</body>

</html>
