<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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


<!-- jQuery UI CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI JS-->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function(){
	$('button:contains("������� �̵�")').on("click",function(){
		$('form').attr('method','post').attr('action','/product/listProduct?menu=search').submit();
	});
	$('button:contains("�ֹ����� ����")').on("click",function(event){
		$('form').attr('method','get').attr('action','/purchase/listPurchase').submit();
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
	<div class="page-header text-center">
			<h3 class=" text-info">��ǰ ���� �Ϸ�</h3>
			<h5 class="text-muted">���������� ��ǰ�� <strong class="text-info">����</strong>�Ǿ����ϴ�.</h5>
		</div>
	<div class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
			<div class="col-sm-4">
				${purchase.buyer.userId}
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
			<div class="col-sm-4">
				${purchase.paymentOption}
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
			<div class="col-sm-4">
				${purchase.receiverName}
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
			<div class="col-sm-4">
				${purchase.receiverPhone}
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
			<div class="col-sm-4">
				${purchase.dlvyAddr}
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
			<div class="col-sm-4">
				${purchase.dlvyRequest}
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">����������</label>
			<div class="col-sm-4">
				${purchase.dlvyDate}
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-4	col-sm-4 text-center">
				<button type="button" class="btn btn-default">������� �̵�</button>
				<button type="button" class="btn btn-default">�ֹ����� ����</button>
			</div>
		</div>
	</div>
</div>
<!--  ȭ�鱸�� div End /////////////////////////////////////-->

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- ToolBar End   /////////////////////////////////////-->
</body>
</html>