<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Font ////////////////////////// -->
<link href="https://fonts.googleapis.com/css?family=Advent+Pro|Syncopate" rel="stylesheet">

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
<script type="text/javascript">
$(function(){
	$('button:contains("����")').on('click',function(){
		self.location="/purchase/updatePurchaseView?tranNo="+${purchase.tranNo};
	});
	$('button:contains("���")').on('click',function(event){
		event.preventDefault();
		history.back(1);
	});
});
</script>
<title>���Ż���ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

</head>

<body bgcolor="#ffffff" text="#000000">

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif"	width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���Ż���ȸ</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
		</td>
	</tr>
</table>

<table class="table">
	<tr>
		<td width="104" class="ct_write">
			��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
					${purchase.purchaseProd.prodNo}</td>
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�����ھ��̵� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td class="ct_write01">${purchase.buyer.userId}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���Ź��</td>
		<td class="ct_write01">
			${(purchase.paymentOption=="0")?"���ݰŷ�":"�ſ뱸��"}
		</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������̸�</td>
		<td class="ct_write01">${purchase.receiverName}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�����ڿ���ó</td>
		<td class="ct_write01">${purchase.receiverPhone}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������ּ�</td>
		<td class="ct_write01">${purchase.dlvyAddr}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���ſ�û����</td>
		<td class="ct_write01">${purchase.dlvyRequest}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��������</td>
		<td class="ct_write01">${purchase.dlvyDate}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�ֹ���</td>
		<td class="ct_write01">${purchase.orderDate}</td>
	</tr>
</table>

<button class="btn btn-default">����</button>
<button class="btn btn-default">���</button>

</body>
</html>