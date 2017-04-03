<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" 
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<title>구매 목록조회</title>

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
	$('.ct_list_pop td:nth-child(5):contains("구매완료")').css('color','blue').on('click',function(){
		self.location="/purchase/updateTranCode/${user.role}?tranNo="+$(this).parent().find('td:nth-child(1) a').attr('sendValue');
	});
});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listSales" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0" >
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<p>전체 <kbd>${resultPage.totalCount}</kbd> 건수, 현재 <kbd>${search.currentPage}</kbd> 페이지</p>
<table class="table table-condensed">
	<thead>
		<tr>
			<td class="ct_list_b" width="100">No</td>
			<td class="ct_list_b" width="150">회원ID</td>
			<td class="ct_list_b" width="150">회원명</td>
			<td class="ct_list_b">전화번호</td>
			<td class="ct_list_b">배송현황</td>
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
		<c:if test="${purchase.tranCode=='구매완료'}">
			<td align="left">
				${purchase.tranCode}
			</td>
		</c:if>
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

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>