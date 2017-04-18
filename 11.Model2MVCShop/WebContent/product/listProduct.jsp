<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
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

<!-- jQEditRangeSlider 사용 import-->
<link rel="stylesheet" href="/css/jQRangeSlider-classic.css" type="text/css" />
<script src="/javascript/jQEditRangeSlider-min.js"></script>
<script src="/javascript/jquery.mousewheel.min.js"></script>
	
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
		$("#currentPage").val(currentPage);
		$('form').submit();
	}
	
	$(function(){
		$('.glyphicon.glyphicon-sort-by-alphabet-alt').on('click',function(){
			$('#SortingTarget').val('prodName');
			$('#SortingDESC').val('1');
			$('form').submit();
		});
		$('.glyphicon.glyphicon-sort-by-alphabet').on('click',function(){
			$('#SortingTarget').val('prodName');
			$('#SortingDESC').val('0');
			$('form').submit();
		});
		$('.glyphicon.glyphicon-sort-by-order-alt').on('click',function(){
			$('#SortingTarget').val('price');
			$('#SortingDESC').val('1');
			$('form').submit();
		});
		$('.glyphicon.glyphicon-sort-by-order').on('click',function(){
			$('#SortingTarget').val('price');
			$('#SortingDESC').val('0');
			$('form').submit();
		});
		
		
		$('.prodItem .updateProduct').on('click',function(){
			self.location ="/product/updateProductView?prodNo="+$(this).parents('tr').attr('sendValue');
		});
		$('.prodItem .getProduct').on('click',function(){
			self.location ="/product/getProduct?prodNo="+$(this).parents('tr').attr('sendValue');
		});
		$('.prodItem a[sendValue]:contains("배송하기")').on('click',function(){
			self.location ="/purchase/updateTranCodeByProd?prodNo="+$(this).parents('tr').attr('sendValue');
		});
	});
	
	$( function() {
		$( "#serchMenu" ).accordion({
			collapsible: true,
			active: false
		});
	});
	
	$( function(){
		$( document ).tooltip({
			items: "[prodImg]",
			content: function() {
				if ($(this).is("[prodImg]") ) {
					return "<img class='popupImg' src='/images/uploadFiles/"+$(this).attr('prodImg')+"'>";
				}
			}
		});
	});
	
	

	//제품 정보 보기
	$(function(){
		$( ".glyphicon.glyphicon-info-sign" ).on("click" , function() {
			var prodNo = $(this).parents('tr').attr('sendValue');
			//alert(prodNo);
			$.ajax("/product/getJsonProduct/"+prodNo,{
				method : "GET" ,
				dataType : "json" ,
				/* headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, */
				success : function(JSONData , status) {
					//alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
					$( '.modal-title' ).html(JSONData.product.prodName);
					$( '.modal-body' ).html(
						'<img width="250px" src="/images/uploadFiles/'+JSONData.product.fileName+'">'
						+'<div class="caption">'
							+'<p>'+JSONData.product.prodDetail+'<br/>등록일:'+JSONData.product.regDate+'</p>'
						+'</div>'
					);
					$( '.modal-footer' ).html(
						'<a id="productInfo" class="btn btn-primary" role="button" sendValue="'+JSONData.product.prodNo+'">상세정보</a>'
						+'<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'
					);
				}
			});
		});
		$(document).on('click', '#productInfo', function(){
			self.location ="/product/getProduct?prodNo="+$('#productInfo').attr('sendValue');
		});
	});

	//제품 목록 호출
	$(function(){
		$( ".pagination a" ).on("click" , function() {
			var page = $(this).attr('targetPage');
			//alert(page);
			//$("#currentPage").val(page);
			$.ajax("/product/listJsonProduct/",{
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data:{
					currentPage:page,
					sortingTarget:$('#SortingTarget').val(),
					sortingDESC:$('#SortingDESC').val(),
					viewSoldItem:$('[name="viewSoldItem"]').val(),
					searchCondition:$('[name="searchCondition"]').val(),
					searchKeyword:$('[name="searchKeyword"]').val(),
					searchValueLow:$('[name="searchValueLow"]').val(),
					searchValueHigh:$('[name="searchValueHigh"]').val()
				},
				success : function(J , status) {
					//alert(J.list[0].prodNo+"/"+J.list[1].prodNo+"/"+J.list[2].prodNo);
					//$( "tbody tr" ).remove();
					for(var i=0;i<J.list.length;i++){
						//alert(J.list[i].prodNo);
						$($('.prodItem')[i]).attr('sendValue',J.list[i].prodNo);
						$($('.table_index')[i]).html(i+1);
						$($('.table_price')[i]).html(J.list[i].price);
						$($('.table_prodStock')[i]).html(J.list[i].prodStock);
						$($('.table_prodTranCode')[i]).html(J.list[i].prodTranCode);
						$($('.updateProduct, .getProduct')[i]).html(J.list[i].prodName);

						if('${param.menu=="manage"}'){
							$($('.table_regDate')[i]).html(J.list[i].regDate);
						}else{
							$($('.table_image')[i]).attr('src','/images/uploadFiles/'+J.list[i].fileName)
							$($('.table_image')[i]).attr('name',J.list[i].fileName)
							$($('.table_image')[i]).attr('prodImg',J.list[i].fileName);
						}
					}
				}
			});
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
		 <h3>물품목록조회</h3>
	</div>
	
	<form method="post" action="/product/listProduct?menu=${param.menu}">
							
	
		<!-- 검색 Start /////////////////////////////////////-->
		<input type="hidden" id="currentPage" name="currentPage" value="${search.currentPage}"/>
		<input type="hidden" id="SortingTarget" name="SortingTarget" value="${empty search.sortingTarget?'':search.sortingTarget}">
		<input type="hidden" id="SortingDESC" name="SortingDESC" value="${search.sortingDESC}">
		<div class="row">
			<div class="col-md-4 text-left">
				<p class="text-primary">
				전체 <kbd>${resultPage.totalCount}</kbd> 건수, 현재 <kbd>${search.currentPage}</kbd> 페이지
				</p>
			</div>
			<div class="col-md-8 text-right">
				<div>1000원 단위로 입력<div id="slider"></div></div>
				<button type="button" type="button" class="btn btn-primary" data-toggle="collapse" data-target="#searchFrame">조건 검색</button>
				<div id="searchFrame" class="collapse">
					<div class="card card-block">
					<div class="form-inline pull-right">
						<div class="form-group" id="keywordPlace">
							<c:if test='${param.menu=="manage"}'>
								<label for="default" class="btn btn-default">구매물품 보기
									<input type="checkbox" id="default" class="badgebox" name="viewSoldItem" ${search.viewSoldItem?'checked':''}>
								</label>
							</c:if>
							<select name="searchCondition" class="form-control">
								<c:if test='${param.menu=="manage"}'>
									<option value="0" ${search.sortingTarget=="0" ? "selected" : ""}>상품번호</option>
								</c:if>
								<option value="1" ${search.searchCondition=="1" ? "selected" : ""}>상품명</option>
								<option value="2" ${search.searchCondition=="2" ? "selected" : ""}>상품가격</option>
							</select>
							<input type="text" class="form-control" name="searchKeyword" placeholder="검색어" value="${search.searchKeyword}">
						</div>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="form-group" id="chkValue">
							<input type="hidden" name="searchValueLow" value="${empty search.searchValueLow?'0':search.searchValueLow}">
							<input type="hidden" name="searchValueHigh" value="${empty search.searchValueHigh?'0':search.searchValueHigh}">
						</div>
						<button type="button" class="btn btn-default">검색</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		</form>
		<!--	검색 end /////////////////////////////////////-->
		<!-- 슬라이드 setting js -->
		<script type="text/javascript">
			//autocomplte 동적 생성
			$( function() {
				var searchKeywordItems = [];
				$(document).ready(function(){
					getListProduct();
				});
				$('select[name="searchCondition"]').change(function(){
					getListProduct()
				})
				
				function getListProduct(){
					$.ajax("/product/getJsonListProduct",{
						method:"GET",
						dataType:"json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success: function(JSONData){

							var maxProdPrice = 0;
							for(var i=0;i<JSONData.productList.length;i++){
								searchKeywordItems.push(JSONData.productList[i].prodName);
								var targetValue = JSONData.productList[i].price;
								if(targetValue>maxProdPrice){
									maxProdPrice = targetValue;
								}
							}

							var minVal = "${empty search.searchValueLow?'0':search.searchValueLow}";
							var maxVal = "${empty search.searchValueHigh?'0':search.searchValueHigh}";
							$("#slider").editRangeSlider({
								bounds:{min: 0, max: maxProdPrice},//제품별 가격 최대치 뽑아넣어주면 동적이지
								defaultValues:{min: minVal, max: maxVal},
								wheelMode: "zoom",
								wheelSpeed: 30,
								step: 1000,
							});
						}
					});
				}
				$( 'input[name="searchKeyword"]' ).autocomplete({
					source: searchKeywordItems
				});
			});
			
			$('input[name="viewSoldItem"], .btn.btn-default:contains("검색")').on('click',function(){
				var dateValues = $('#slider').editRangeSlider('values');
				var min = dateValues.min.toString();
				var max = dateValues.max.toString();
				$('input[name="searchValueLow"]').val( min );
				$('input[name="searchValueHigh"]').val( max );
				$('#currentPage').val(1);
				$('form').submit();
			});
			
		</script>
		
<!--	table Start /////////////////////////////////////-->
<table class="table table-hover table-striped" >
	<thead>
		<tr>
			<td>No</td>
			<c:if test='${param.menu=="search"}'>
				<td>사진</td>
			</c:if>
			<td>상품명
				<c:if test="${search.sortingDESC}">
					<span class="glyphicon glyphicon-sort-by-alphabet" aria-hidden="true"></span>
				</c:if>
				<c:if test="${!search.sortingDESC}">
					<span class="glyphicon glyphicon-sort-by-alphabet-alt" aria-hidden="true"></span>
				</c:if>
			</td>
			<td>가격
				<c:if test="${search.sortingDESC}">
					<span class="glyphicon glyphicon-sort-by-order" aria-hidden="true"></span>
				</c:if>
				<c:if test="${!search.sortingDESC}">
					<span class="glyphicon glyphicon-sort-by-order-alt" aria-hidden="true"></span>
				</c:if>
			</td>
			<td>재고</td>
			<c:if test='${param.menu=="manage"}'>
				<td>등록일</td>
			</c:if>
			<td>현재상태</td>
			<td>간략 정보보기</td>
		</tr>
	</thead>
	<tbody>
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}" begin="0" step="1">
		<c:set var="i" value="${i+1}"/>
		<tr class="prodItem" sendValue="${product.prodNo}">
			<td class="table_index" align="center">${i}</td>
			<c:if test='${param.menu!="manage"}'>
				<td>
					<img name="${product.fileName}" src="/images/uploadFiles/${product.fileName}"
						class="table_image ui-corner-all listProdImg" prodImg="${product.fileName}">
				</td>
			</c:if>
			<td align="left">
				<c:if test='${param.menu=="manage"}'>
					<span class="updateProduct">
						${product.prodName}
					</span>
				</c:if>
				<c:if test='${param.menu!="manage"}'>
					<span class="getProduct">
						${product.prodName}
					</span>
				</c:if>
			</td>
			<td class="table_price" align="left">${product.price}</td>
			<td class="table_prodStock" align="left">${product.prodStock}</td>
			<c:if test='${param.menu=="manage"}'>
				<td class="table_regDate" align="left">${product.regDate}</td>
			</c:if>
			<td class="table_prodTranCode" align="left">
				${product.prodTranCode}
				<c:if test='${param.menu=="manage" && product.prodTranCode=="구매완료"}'>
					<a>배송하기</a>
				</c:if>
			</td>
			<td><a data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<!--	table End /////////////////////////////////////-->
	
	<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-sm">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Modal Header</h4>
			</div>
			<div class="modal-body">
				
			</div>
			<div class="modal-footer">
			
			</div>
		</div>

	</div>
</div>
	
	
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator.jsp"/>
	<!-- PageNavigation End... -->
</div>

<!--	화면구성 div End /////////////////////////////////////-->

<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>

</html>