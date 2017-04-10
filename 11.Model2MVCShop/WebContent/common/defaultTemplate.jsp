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
<style type="text/css">

</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

</script>
</head>

<!--============================================================================-->

<body>

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End   /////////////////////////////////////-->

<!--  화면구성 div Start /////////////////////////////////////-->
<div class="container">
	<div class="page-header text-center">
		<h3 class=" text-info">상품등록</h3>
	</div>
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>재고</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodStock }</div>
	</div>
	
	<!-- form Start /////////////////////////////////////-->
	<form class="form-horizontal">
		<input type="hidden" name="prodNo" value=""/>
		
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
			<div class="col-sm-4">
				<input 	type="text" class="form-control" name="prodName" value="" maxLength="20">
			</div>
		</div>
		
		<div class="form-group">
			<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
			<div class="col-sm-4">
				<div class="input-group" style="z-index: -1;">
					<input type="text" class="form-control" name="price" maxlength="5">
					<div class="input-group-addon">원</div>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
			<div class="col-sm-4">
				<input	type="file" class="form-control" name="fileName"/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4	col-sm-4 text-center">
				<button class="btn btn-default">수정</button>
				<button class="btn btn-default">취소</button>
			</div>
		</div>
	</form>
	<!-- form End /////////////////////////////////////-->

	<!-- if need Paging -->
	<!-- PageNavigation Start //////////////// -->
	<jsp:include page="../common/pageNavigator.jsp"/>
	<!-- PageNavigation End   //////////////// -->
	
	
</div>
<!--  화면구성 div End /////////////////////////////////////-->

<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>

</html>