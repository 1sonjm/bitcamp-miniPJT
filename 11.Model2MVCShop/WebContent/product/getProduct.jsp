<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="EUC-KR">
<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Font ////////////////////////// -->
<link href="https://fonts.googleapis.com/css?family=Oxygen|Syncopate" rel="stylesheet">

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


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	</style>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function(){
		$("button:contains('����')").click(function(event) {
			event.preventDefault();
			history.back(1);
		});
		$("button:contains('����')").click(function(){
			$('form').attr('method','post').attr('action','/purchase/addPurchaseView?prodNo=${product.prodNo}').submit();
		})
	})
	</script>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End   /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

	<div class="container">
		<div class="page-header">
			<h3 class=" text-info">��ǰ����ȸ</h3>
		</div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"><img alt="����" src="/images/uploadFiles/${product.fileName}"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.price }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodStock }</div>
		</div>
		
		<hr/>
		
		<div class="row">
				<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
				<div class="col-md-12 text-center">
					<c:if test="${product.prodStock!=0 || user.role=='user'}">
						<button class="btn btn-default" type="button">����</button>	
					</c:if>
					
					<button class="btn btn-default" type="button">����</button>
				</div>
		</div>
		
		<br/>
		
	<!--  �ı��� div Start /////////////////////////////////////-->
	
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
											+'<button class="btn btn-default" name="answerApply" type="button">�ۼ�</button></div>';
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
						<button type="button" class="btn btn-default" id="answer${review.reviewNo}">�亯���</button>
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
		<!--  �ı��� div end   /////////////////////////////////////-->
	</div>
<!--  ȭ�鱸�� div end   /////////////////////////////////////-->
<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>

</html>