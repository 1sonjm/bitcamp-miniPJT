<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function(){
	$('input[name="dlvyDate"]').datepicker({
		dateFormat: "yymmdd",
		minDate: 0
	});
	$('button:contains("����")').on("click",function(){
		$('form').attr('method','post').attr('action','/purchase/addPurchase').submit();
	});
	$('button:contains("���")').on("click",function(event){
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
	<div class="page-header text-center">
		<h3 class="text-info">��ǰ ����</h3>
	</div>

	<!-- form Start /////////////////////////////////////-->
	<form class="form-horizontal">
		<input type="hidden" name="purchaseProd.prodNo" value="${product.prodNo}" />
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
			<div class="col-sm-4">
				${product.prodNo}
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
			<div class="col-sm-4">
				${product.prodName}
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
			<div class="col-sm-4">
				
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
			<div class="col-sm-4">
				${product.prodDetail}
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">��������</label>
			<div class="col-sm-4">
				${product.manuDate}
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">����</label>
			<div class="col-sm-4">
				${product.price}
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">�������</label>
			<div class="col-sm-4">
				${product.regDate}
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
			<div class="col-sm-4">
				${user.userId}
			</div>
		</div>
		
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
			<div class="col-sm-4">
				<select name="paymentOption" class="form-control">
					<option value="1" selected="selected">���ݱ���</option>
					<option value="2">�ſ뱸��</option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="receiverName" maxLength="20" value="${user.userName}" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
			<div class="col-sm-4">
				<input 	type="text" class="form-control" name="receiverPhone" maxLength="20" value='${(user.addr==null)?"000-0000-0000":user.addr}' />
			</div>
		</div>
	
		<div class="form-group">
			<label for="password" class="col-sm-offset-1 col-sm-3 control-label">�������ּ� </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="dlvyAddr" maxLength="20" 	value='${(user.addr==null)?"����":user.addr}' />
			</div>
		</div>
		
		<div class="form-group">
			<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="dlvyRequest" maxLength="20" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="dlvyDate" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4	col-sm-4 text-center">
				<button class="btn btn-default">����</button>
				<button class="btn btn-default">���</button>
			</div>
		</div>
	</form>
	<!-- form End /////////////////////////////////////-->

</div>
<!--  ȭ�鱸�� div End /////////////////////////////////////-->

<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End   /////////////////////////////////////-->
</body>
</html>