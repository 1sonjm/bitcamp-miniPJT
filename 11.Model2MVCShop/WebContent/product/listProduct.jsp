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
		
		
		$('input[name="viewSoldItem"], button.btn-info:contains("�˻�")').on('click',function(){
			$('#currentPage').val(1);
			$('form').submit();
		});
		$('.prodItem .updateProduct').on('click',function(){
			self.location ="/product/updateProductView?prodNo="+$(this).attr('sendValue');
		});
		$('.prodItem .getProduct').on('click',function(){
			self.location ="/product/getProduct?prodNo="+$(this).attr('sendValue');
		});
		$('.prodItem a[sendValue]:contains("����ϱ�")').on('click',function(){
			self.location ="/purchase/updateTranCodeByProd?prodNo="+$(this).parent().attr('sendValue');
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
	
	//autocomplte ���� ����
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
				data:{
					searchCondition:$('input[name="searchCondition"]').val(),
					searchKeyword:$('input[name="searchKeyword"]').val(),
					searchValueLow:$('input[name="searchValueLow"]').val(),
					searchValueHigh:$('input[name="searchValueHigh"]').val()
				},
				success: function(JSONData){
					for(var i=0;i<JSONData.productList.length;i++){
						searchKeywordItems.push(JSONData.productList[i].prodName);
					}
				}
			});
		}
		$( 'input[name="searchKeyword"]' ).autocomplete({
			source: searchKeywordItems
		});
	});
	
	//��ǰ ���� ����
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
							+'<p>'+JSONData.product.prodDetail+'<br/>�����:'+JSONData.product.regDate+'</p>'
						+'</div>'
					);
					$( '.modal-footer' ).html(
						'<a id="buyProduct" class="btn btn-primary" role="button" sendValue="'+JSONData.product.prodNo+'">����</a>'
						+'<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'
					);
				}
			});
		});
		$(document).on('click', '#buyProduct', function(){
			self.location ="/product/updateProductView?prodNo="+$('#buyProduct').attr('sendValue');
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
		 <h3>��ǰ�����ȸ</h3>
	</div>
	
	<form method="post" action="/product/listProduct?menu=${param.menu}">
	
		<!-- �˻� Start /////////////////////////////////////-->
		<input type="hidden" id="currentPage" name="currentPage" value="${search.currentPage}"/>
		<input type="hidden" id="SortingTarget" name="SortingTarget" value="${empty search.sortingTarget?'':search.sortingTarget}">
		<input type="hidden" id="SortingDESC" name="SortingDESC" value="${search.sortingDESC}">
		<div class="row">
			<div class="col-md-4 text-left">
				<p class="text-primary">
				��ü <kbd>${resultPage.totalCount}</kbd> �Ǽ�, ���� <kbd>${search.currentPage}</kbd> ������
				</p>
			</div>
			<div class="col-md-8 text-right">
				<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#searchFrame">���� �˻�</button>
				<div id="searchFrame" class="collapse">
					<div class="card card-block">
					<div class="form-inline pull-right">
						<div class="form-group" id="keywordPlace">
							<c:if test='${param.menu=="manage"}'>
								<label for="default" class="btn btn-default">���Ź�ǰ ����
									<input type="checkbox" id="default" class="badgebox" name="viewSoldItem" ${search.viewSoldItem?'checked':''}>
								</label>
							</c:if>
							<select name="searchCondition" class="form-control">
								<c:if test='${param.menu=="manage"}'>
									<option value="0" ${search.sortingTarget=="0" ? "selected" : ""}>��ǰ��ȣ</option>
								</c:if>
								<option value="1" ${search.searchCondition=="1" ? "selected" : ""}>��ǰ��</option>
								<option value="2" ${search.searchCondition=="2" ? "selected" : ""}>��ǰ����</option>
							</select>
							<input type="text" class="form-control" name="searchKeyword" placeholder="�˻���" value="${search.searchKeyword}">
						</div>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="form-group" id="chkValue">
							<label for="searchValueLow">���ݺ�</label>
							<input type="text" class="form-control" name="searchValueLow" style="width: 100px;"
									value="${empty search.searchValueLow?'0':search.searchValueLow}">
							<label for="searchValueHigh">~</label>
							<input type="text" class="form-control" name="searchValueHigh" style="width: 100px;"
									value="${empty search.searchValueHigh?'0':search.searchValueHigh}">
							<!-- seekbar�ڷ� : http://stackoverflow.com/questions/27060099/seekbar-with-range-of-two-values-min-and-max -->
						</div>
						<button class="btn btn-default">�˻�</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		</form>
		<!--	�˻� end /////////////////////////////////////-->
		
		
	<!--	table Start /////////////////////////////////////-->
	<table class="table table-hover table-striped" >
		<thead>
		<tr>
			<td>No</td>
			<c:if test='${param.menu=="search"}'>
				<td>����</td>
			</c:if>
			<td>��ǰ��
				<c:if test="${search.sortingDESC}">
					<span class="glyphicon glyphicon-sort-by-alphabet" aria-hidden="true"></span>
				</c:if>
				<c:if test="${!search.sortingDESC}">
					<span class="glyphicon glyphicon-sort-by-alphabet-alt" aria-hidden="true"></span>
				</c:if>
			</td>
			<td>����
				<c:if test="${search.sortingDESC}">
					<span class="glyphicon glyphicon-sort-by-order" aria-hidden="true"></span>
				</c:if>
				<c:if test="${!search.sortingDESC}">
					<span class="glyphicon glyphicon-sort-by-order-alt" aria-hidden="true"></span>
				</c:if>
			</td>
			<td>���</td>
			<c:if test='${param.menu=="manage"}'>
				<td>�����</td>
			</c:if>
			<td>�������</td>
			<td>���� ��������</td>
		</tr>
	</thead>
		<tbody>
		
		<c:set var="i" value="0"/>
		<c:forEach var="product" items="${list}" begin="0" step="1">
			<c:set var="i" value="${i+1}"/>
			<tr class="prodItem" sendValue="${product.prodNo}">
				<td align="center">${i}</td>
				<c:if test='${param.menu=="search"}'>
					<td>
						<img name="${product.fileName}" src="/images/uploadFiles/${product.fileName}"
							class="ui-corner-all listProdImg" prodImg="${product.fileName}">
					</td>
				</c:if>
				<td align="left">
					<c:if test='${param.menu=="manage"}'>
						<span class="updateProduct" sendValue="${product.prodNo}">
							${product.prodName}
						</span>
					</c:if>
					<c:if test='${param.menu=="search"}'>
						<span class="getProduct" sendValue="${product.prodNo}">
							${product.prodName}
						</span>
					</c:if>
				</td>
				<td align="left">${product.price}</td>
				<td align="left">${product.prodStock}</td>
				<c:if test='${param.menu=="manage"}'>
					<td align="left">${product.regDate}</td>
				</c:if>
				<td align="left">
					${product.prodTranCode}
					<c:if test='${param.menu=="manage" && product.prodTranCode=="���ſϷ�"}'>
						<a sendValue="${product.prodNo}">����ϱ�</a>
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

<!--	ȭ�鱸�� div End /////////////////////////////////////-->

<!-- Footer Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Footer End /////////////////////////////////////-->
</body>

</html>