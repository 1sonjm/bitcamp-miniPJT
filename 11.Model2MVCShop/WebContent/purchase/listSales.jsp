<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
<meta charset="EUC-KR">
	
<!-- 참조 : http://getbootstrap.com/css/	 참조 -->
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


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
	.popupImg{
		width: 350px;
	}
	.listProdImg{
		width: 100px;
	}
	.ui-tooltip {
		max-width: 400px;
	}
</style>

<!--	///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
function fncGetList(currentPage) {
	$('#currentPage').val(currentPage);
	$('form').attr('method','post').attr('action','/purchase/listSales').submit();
	//원래 list는 get으로 해줘야겠지만.. controller에서 param받아서 다시 model로 돌려주는게 귀찮으니 post로 하는중
}
$(function(){
	$('.prodItem td:nth-child(1) a').on('click',function(){
		self.location="/purchase/getPurchase?tranNo="+$(this).parents('tr').attr('tranNo');
	});
	$('.prodItem td:nth-child(2) a').on('click',function(){
		self.location="/user/getUser?userId="+$(this).text().trim();
	});
	$('.prodItem td:nth-child(5):contains("구매완료")').on('click',function(){
		self.location="/purchase/updateTranCode/${user.role}?tranNo="+$(this).parent().attr('tranNo');
	});
});
</script>
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End	 /////////////////////////////////////-->

<!--	화면구성 div Start /////////////////////////////////////-->
<div class="container">
	<div class="page-header text-info">
		 <h3>전체 판매 목록</h3>
	</div>
	
	<form>
		<input type="hidden" id="currentPage" name="currentPage" value="${search.currentPage}"/>
		<!--	table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped" >
			<thead>
				<tr>
					<td>No</td>
					<td>회원ID</td>
					<td>회원명</td>
					<td>전화번호</td>
					<td>배송현황</td>
				</tr>
			</thead>
			<tbody>
			
			<c:set var="i" value="0"/>
			<c:forEach items="${list}" var="purchase" begin="0" step="1">
				<c:set var="i" value="${i+1}"/>
				<tr class="prodItem" tranNo="${purchase.tranNo}">
					<td align="center">
						<a>${i}</a>
					</td>
					<td align="left">
						<a>${purchase.buyer.userId}</a>
					</td>
					<td align="left">${purchase.receiverName}</td>
					<td align="left">${purchase.receiverPhone}</td>
					<c:if test="${purchase.tranCode=='구매완료'}">
						<td align="left">
							<a>${purchase.tranCode}</a>
						</td>
					</c:if>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<!--	table End /////////////////////////////////////-->
	
	
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator.jsp"/>
	<!-- PageNavigation End... -->
	</form>
</div>

<!--	화면구성 div End /////////////////////////////////////-->

<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>

</html>