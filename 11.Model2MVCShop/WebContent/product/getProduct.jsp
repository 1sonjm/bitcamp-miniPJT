<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="EUC-KR">
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	</style>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function(){
		$("button:contains('이전')").click(function(event) {
			event.preventDefault();
			history.back(1);
		});
		$("button:contains('구매')").click(function(){
			$('form').attr('method','post').attr('action','/purchase/addPurchaseView?prodNo=${product.prodNo}').submit();
		})
	})
	</script>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End   /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->

	<div class="container">
		<div class="page-header">
			<h3 class=" text-info">상품상세조회</h3>
		</div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4"><img alt="사진" src="/images/uploadFiles/${product.fileName}"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>재고</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodStock }</div>
		</div>
		
		<hr/>
		
		<div class="row">
				<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
				<div class="col-md-12 text-center">
					<c:if test="${product.prodStock!=0 || user.role=='user'}">
						<button class="btn btn-default" type="button">구매</button>	
					</c:if>
					
					<button class="btn btn-default" type="button">이전</button>
				</div>
		</div>
		
		<br/>
		
	<!--  후기목록 div Start /////////////////////////////////////-->
	
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
					
					var displayValue = "<td></td><td>내용</td><td calspan='2'>"
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
											+'답변 제목<input type="text" class="form-control" name="answerTitle"><br/>'
											+'답변내용<br/><textarea name="answerContent" rows="4" cols="50"></textarea>'
											+'<button class="btn btn-default" name="answerApply" type="button">작성</button></div>';
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
				<td>사진</td>
				<td>구매자ID</td>
				<td>제목</td>
				<td>등록일자</td>
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
						<button type="button" class="btn btn-default" id="answer${review.reviewNo}">답변등록</button>
					</c:if>
					</td>
				</tr>
				<tr id="review${review.reviewNo}">
					<td colspan="5">
						<p>내용확인</p>
					</td>
				</tr>
				<c:if test="${!empty review.answerTitle}">
					<tr>
						<td></td>
						<td>┕></td>
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
		<!--  후기목록 div end   /////////////////////////////////////-->
	</div>
<!--  화면구성 div end   /////////////////////////////////////-->
<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>

</html>