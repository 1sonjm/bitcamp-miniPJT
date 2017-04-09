<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	function fncAddProduct(){
		//Form ��ȿ�� ����
	 	var name = document.detailForm.prodName.value;
		var detail = document.detailForm.prodDetail.value;
		var manuDate = document.detailForm.manuDate.value;
		var price = document.detailForm.price.value;

		if(name == null || name.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		document.detailForm.action='/product/addProduct';
		document.detailForm.submit();
	}

	function resetData(){
		document.detailForm.reset();
	}

	$(function(){
		$($("button")[0]).on("click",function(){
			fncAddProduct();
		});
		$($("button")[1]).on("click",function(){
			$("form")[0].reset();
		});
		$('input[name="manuDate"]').datepicker({
			dateFormat: "yymmdd",
			minDate: -30
		});
	});
</script>		

</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End   /////////////////////////////////////-->


<!--	ȭ�鱸�� div Start /////////////////////////////////////-->

	<div class="container">
	
		<div class="page-header text-center">
			<h3 class=" text-info">��ǰ���</h3>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			<input type="hidden" name="prodNo" value="${product.prodNo}"/>
			
			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
				<div class="col-sm-4">
					<input 	type="text" class="form-control" name="prodName" value="${product.prodName}" placeholder="${product.prodName}" maxLength="20">
				</div>
			</div>
		
			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������ </label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="prodDetail" value="${product.prodDetail}" placeholder="${product.prodDetail}" maxLength="10">
				</div>
			</div>
			
			<div class="form-group">
				<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="manuDate" readonly>
				</div>
			</div>
			
			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<div class="input-group" style="z-index: -1;">
						<input type="text" class="form-control" name="price" maxlength="5">
						<div class="input-group-addon">��</div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
				<div class="col-sm-4">
					<input	type="file" class="form-control" name="fileName"/>
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

<!--	ȭ�鱸�� div end /////////////////////////////////////-->

<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End   /////////////////////////////////////-->
	
</body>

</html>