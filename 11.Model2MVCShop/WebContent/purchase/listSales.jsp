<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

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


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
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
	//���� list�� get���� ����߰�����.. controller���� param�޾Ƽ� �ٽ� model�� �����ִ°� �������� post�� �ϴ���
}
$(function(){
	$('.prodItem td:nth-child(1) a').on('click',function(){
		self.location="/purchase/getPurchase?tranNo="+$(this).parents('tr').attr('tranNo');
	});
	$('.prodItem td:nth-child(2) a').on('click',function(){
		self.location="/user/getUser?userId="+$(this).text().trim();
	});
	$('.prodItem td:nth-child(5):contains("���ſϷ�")').on('click',function(){
		self.location="/purchase/updateTranCode/${user.role}?tranNo="+$(this).parent().attr('tranNo');
	});
});
</script>
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End	 /////////////////////////////////////-->

<!--	ȭ�鱸�� div Start /////////////////////////////////////-->
<div class="container">
	<div class="page-header text-info">
		 <h3>��ü �Ǹ� ���</h3>
	</div>
	
	<form>
		<input type="hidden" id="currentPage" name="currentPage" value="${search.currentPage}"/>
		<!--	table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped" >
			<thead>
				<tr>
					<td>No</td>
					<td>ȸ��ID</td>
					<td>ȸ����</td>
					<td>��ȭ��ȣ</td>
					<td>�����Ȳ</td>
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
					<c:if test="${purchase.tranCode=='���ſϷ�'}">
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

<!--	ȭ�鱸�� div End /////////////////////////////////////-->

<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>

</html>