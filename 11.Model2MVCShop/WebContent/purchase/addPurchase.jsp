<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchaseView?" method="post">

������ ���� ���Ű� �Ǿ����ϴ�.
<table class="table">
	<tr>
		<td width="104" class="ct_write">
			�����ھ��̵� <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td class="ct_write01">${purchase.buyer.userId}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���Ź��</td>
		<td class="ct_write01">${purchase.paymentOption}</td>
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
		<td width="104" class="ct_write">����������</td>
		<td class="ct_write01">${purchase.dlvyDate}</td>
	</tr>
</table>

</form>

</body>
</html>