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
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title> 
<script type="text/javascript">
$(function(){
	$("button:contains('����')").click(function(event) {
		event.preventDefault();
		history.back(1);
	});
	$("button:contains('����')").click(function(){
		$('form').attr('action','/purchase/addPurchaseView?prodNo=${product.prodNo}').submit();
	})
})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
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
					<td width="105">${product.prodNo}</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td class="ct_write01">${product.prodName}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�̹��� <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td class="ct_write01">
			<img alt="����" src="/images/uploadFiles/${product.fileName}" width="300"/>
		</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td class="ct_write01">${product.prodDetail}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��������</td>
		<td class="ct_write01">${product.manuDate }</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����</td>
		<td class="ct_write01">${product.price }</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���</td>
		<td class="ct_write01">${product.prodStock }</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������</td>
		<td class="ct_write01">${product.regDate }</td>
	</tr>
</table>
</form>
<c:if test='${product.prodStock!=0}'>
	<button class="btn btn-default">����</button>
</c:if>

<button class="btn btn-default">����</button>

<script type="text/javascript">
$(function(){
	$("tr[id^=review]").on("click" , function() {
	//$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
		//var userId = $(this).text().trim();
		var reviewNoID = $(this).attr('id');
		//alert(reviewNoID.substring(6));
		$.ajax("/review/getJsonReview/"+reviewNoID.substring(6),{
			//url : "/review/getJsonReview/"+userId ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData , status) {
				//alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
				
				var displayValue = "<td></td><td>����</td><td calspan='2'>"
									+JSONData.review.reviewContent+"</td></tr>"
				//alert(displayValue);
				//$("h3").remove();
				$( "#"+reviewNoID ).html(displayValue);
				//$( "#"+userId+"" ).html(displayValue);
			}
		});
	});
	
	var reviewNo = 0;
	$('button[id^=answer]').click(function(){
		reviewNo = $(this).attr('id').substring(6);
		var answerForm = '<div name="answerForm">'
										+'�亯 ����<input type="text" class="form-control" name="answerTitle"><br/>'
										+'�亯����<br/><textarea name="answerContent" rows="4" cols="50"></textarea>'
										+'<button class="btn btn-default" name="answerApply">�ۼ�</button></div>';
		$(this).parent().html(answerForm);
	});
	$(document).on('click','button[name=answerApply]',function(){
		$.ajax("/review/updateAnswer/"+reviewNo
					+"?answerTitle="+$('input[name="answerTitle"]').val()
					+"&answerContent="+$('textarea[name="answerContent"]').val(),{
					method:"POST",
					dataType:"json",
					headers: {
						"Accept" : "application/json"
					},
					/* data:{
						answerTitle:$('input[name="answerTitle"]').val(),
						answerContent:$('textarea[name="answerContent"]').val()
					}, */
					success: function(JSONData){
						$('div[name=answerForm]').remove();
					}
		});
	});
});

</script>

<c:if test="${!empty reviewList}">
<table class="table listReview">
	<tr>
		<td>����</td>
		<td>������ID</td>
		<td>����</td>
		<td>�������</td>
		<td></td>
	</tr>
	<c:forEach var="review" items="${reviewList}" begin="0" step="1">
		<tr>
			<td>
				<c:if test="${review.imageName} != null">
					<img src="" width="50">
				</c:if>
			</td>
			<td>${review.buyer.userId}</td>
			<td>
				<a href="/review/getReview/${review.reviewNo}">
					${review.reviewTitle}
				</a>
			</td>
			<td>${review.regDate}</td>
			<td>
			<c:if test="${empty review.answerTitle && user.role=='admin'}">
				<button class="btn btn-default" id="answer${review.reviewNo}">�亯���</button>
			</c:if>
			</td>
		</tr>
		<tr id="review${review.reviewNo}">
			<td colspan="5">
				<p>����Ȯ��</p>
			</td>
		</tr>
		<c:if test="${!empty review.answerTitle}">
			<tr>
				<td></td>
				<td>��></td>
				<td>
					<a href="/review/getReview/${review.reviewNo}">
						${review.answerTitle}
					</a>
				</td>
				<td></td>
			</tr>
		</c:if>
	</c:forEach>
</table>
</c:if>

</body>
</html>