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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
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

<!--	///////////////////////// CSS ////////////////////////// -->
<style>
</style>

<!--	///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	function fncAddProduct(){
		//Form 유효성 검증
	 	var name = $('input[name="prodName"]').val();
		var detail = $('input[name="prodDetail"]').val();
		var manuDate = $('input[name="manuDate"]').val();
		var price = $('input[name="price"]').val();

		if(name == null || name.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		//alert($('input[name="fileName"]')[0].files.length);
		///if($('input[name="fileName"]')[0].files.length > 3){
		//	alert("3개의 이미지만 추가할 수 있습니다.");
		//}else{
			$('form').attr('method','post').attr('action','/product/addProduct').submit();
		//}
	}

	$(function(){
		$("button:contains('수정')").on("click",function(){
			fncAddProduct();
		});
		$("button:contains('취소')").on("click",function(){
			$("form")[0].reset();
		});
		$('input[name="manuDate"]').datepicker({
			dateFormat: "yymmdd",
			minDate: -30
		});
		
		$(document).on('click', '.number-spinner button', function () {    
			var btn = $(this),
				oldValue = btn.closest('.number-spinner').find('input').val().trim(),
				newVal = 0;

			switch(btn.attr('data-dir')){
			    case '1up':
				    newVal = parseInt(oldValue) + 1;
			        break;
			    case '10up':
				    newVal = parseInt(oldValue) + 10;
			        break;
			    case '1down':
			        newVal = parseInt(oldValue) - 1;
			        break;
			    case '10down':
			        newVal = parseInt(oldValue) - 10;
			        break;
			}
			if (newVal < 1) {
				newVal = 1;
			}
			btn.closest('.number-spinner').find('input').val(newVal);
		});
	});
	
</script>		

</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End   /////////////////////////////////////-->


<!--	화면구성 div Start /////////////////////////////////////-->

	<div class="container">
	
		<div class="page-header text-center">
			<h3 class=" text-info">상품등록</h3>
		</div>

		<!-- form Start /////////////////////////////////////-->

		<form class="form-horizontal">
			
			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4">
					<input 	type="text" class="form-control" name="prodName" maxLength="20">
				</div>
			</div>
		
			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보 </label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="prodDetail" maxLength="10">
				</div>
			</div>
			
			<div class="form-group">
				<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" class="form-control" name="manuDate" readonly="readonly">
						<div class="input-group-addon"><img src="../images/ct_icon_date.gif" width="15" height="15" /></div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" class="form-control" name="price" maxlength="5">
						<div class="input-group-addon">원</div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">재고</label>
				<div class="col-sm-4">
					<div class="input-group number-spinner">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default" data-dir="10down">-10</button>
							<button type="button" class="btn btn-default" data-dir="1down">-1</button>
						</span>
						<input type="text" class="form-control text-center" name="prodStock" value="1" maxlength="5">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default" data-dir="1up">+1</button>
							<button type="button" class="btn btn-default" data-dir="10up">+10</button>
						</span>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" name="uploadfile" multiple accept="image/jpg,image/jpeg,image/png">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4	col-sm-4 text-center">
					<button class="btn btn-default" type="button">수정</button>
					<button class="btn btn-default" type="button">취소</button>
				</div>
			</div>
		</form>
		<!-- form End /////////////////////////////////////-->
	</div>

<!--	화면구성 div end /////////////////////////////////////-->

<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End   /////////////////////////////////////-->
	
</body>

</html>