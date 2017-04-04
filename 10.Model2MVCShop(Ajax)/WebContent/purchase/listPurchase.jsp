<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/javascript/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" 
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="/javascript/jquery-ui-1.12.1.custom/jquery-ui.css">
<script src="/javascript/jquery-ui-1.12.1.custom/jquery-ui.js"></script>

<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetList(currentPage) {
	$('#currentPage').val(currentPage);
	$('form').submit();
}

$(function(){
	$('.ct_list_pop td:nth-child(1) a').css('color','red').on('click',function(){
		self.location="/purchase/getPurchase?tranNo="+$(this).attr('sendValue');
	});
	$('.ct_list_pop td:nth-child(2) a').css('color','red').on('click',function(){
		self.location="/user/getUser?userId="+$(this).text().trim();
	});
	$('.ct_list_pop td:nth-child(6):contains("���ſϷ�")').css('color','blue').on('click',function(){
		self.location="/purchase/updatePurchaseView?tranNo="+$(this).attr('sendValue');
	});
	$('.ct_list_pop td:nth-child(6):contains("��ۿϷ�")').css('color','blue').on('click',function(){
		self.location="/review/addReviewView/"+$(this).attr('sendValue');
	});
	
});


$(function(){
	$( "#deliveryCheck-confirm" ).dialog({
		autoOpen: false,
		resizable: false,
		height: "auto",
		width: 400,
		modal: true,
		open: function(event, ui) {
			$(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
		},
		buttons: {
			"��": function() {
				self.location="/purchase/updateTranCode/${user.role}?tranNo="+$('.ct_list_pop td:nth-child(6):contains("�����")').attr('sendValue');
			},
			"�ƴϿ�": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$('.ct_list_pop td:nth-child(6):contains("�����")').on( "click", function() {
		$( "#deliveryCheck-confirm" ).dialog( "open" );
	});
});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<div id="deliveryCheck-confirm" title="Empty the recycle bin?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>��ǰ�� �����Ͻð� ��ۿϷ� �Ͻðڽ��ϱ�?</p>
</div>

<div style="width: 98%; margin-left: 10px;">
<form name="detailForm" action="/purchase/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0" >
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<p>��ü <kbd>${resultPage.totalCount}</kbd> �Ǽ�, ���� <kbd>${search.currentPage}</kbd> ������</p>
<table class="table table-condensed">
	<thead>
		<tr>
			<td class="ct_list_b" width="100">No</td>
			<td class="ct_list_b" width="150">ȸ��ID</td>
			<td class="ct_list_b" width="150">ȸ����</td>
			<td class="ct_list_b">��ȭ��ȣ</td>
			<td class="ct_list_b">�����Ȳ</td>
			<td class="ct_list_b">��������</td>
		</tr>
	</thead>
	<c:set var="i" value="0"/>
	<c:forEach items="${list}" var="purchase" begin="0" step="1">
	<tr class="ct_list_pop">
		<td align="center">
			<c:set var="i" value="${i+1}"/>
			<a sendValue="${purchase.tranNo}">${i}</a>
		</td>
		<td align="left">
			<a>${purchase.buyer.userId}</a>
		</td>
		<td align="left">${purchase.receiverName}</td>
		<td align="left">${purchase.receiverPhone}</td>
		<td align="left">���� ${purchase.tranCode} �Դϴ�.</td>
		<%-- <c:if test="${!purchase.createReview}"> --%>
			<td align="left" sendValue="${purchase.tranNo}">
				${purchase.tranCode}
			</td>
		<%-- </c:if> --%>
	</tr>
	</c:forEach>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>