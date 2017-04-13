<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
//autocomplte 悼利 积己
$( function() {
	var searchProductItems = [];
	$(document).ready(function(){
		$.ajax("/product/getJsonListProduct",{
			method:"GET",
			dataType:"json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success: function(JSONData){
				for(var i=0;i<JSONData.productList.length;i++){
					searchProductItems.push(JSONData.productList[i].prodName);
				}
			}
		});
	});
	$( 'input[name="searchKeyword"]' ).autocomplete({
		source: searchProductItems
	});
	$('input[name="searchKeyword"]').keydown(function (key) {
				if(key.keyCode == 13){//虐啊 13捞搁 角青 (浚磐绰 13)
					$('form').attr('action','/product/listProduct?menu=search&searchCondition=1').attr('method','post').submit();
				}
		});

});
</script>

<!-- ToolBar Start /////////////////////////////////////-->
<nav>
	<div class="navbar navbar-inverse">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-inverse-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">
				<span><img alt="Brand" src="/images/layer/1491480052_home.png" width="20px"></span>
				Model2MVCShop
			</a>
		</div>
		<div class="navbar-collapse collapse navbar-inverse-collapse">
			<form class="navbar-form navbar-left">
					<input type="text" class="form-control col-lg-8" placeholder="ProductName" name="searchKeyword">
			</form>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${user.role=='user'}">
					<li><a href="#">ListPurchase</a></li>
				</c:if>
				<c:if test="${user.role=='admin'}">
					<li><a href="#">ListSalse</a></li>
				</c:if>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Product<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">ListProduct</a></li>
						<li><a href="#">History</a></li>
						<c:if test="${user.role=='admin'}">
						<li class="divider"></li>
						<li><a href="#">AddProductView</a></li>
						</c:if>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Account<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">GetUser</a></li>
						<c:if test="${user.role=='admin'}">
						<li class="divider"></li>
						<li><a href="#">ListUser</a></li>
						</c:if>
					</ul>
				</li>
				<c:if test="${!empty user}">
					<li><a href="#">Log Out</a></li>
				</c:if>
				<c:if test="${empty user}">
					<li><a href="#">Log In</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
<!-- ToolBar End /////////////////////////////////////-->

<script type="text/javascript">
	$(function() {

		//============= logon Event  贸府 =============	
		$("a:contains('Log In')").on("click" , function() {
			$(self.location).attr("href","/user/loginView.jsp");
		}); 
		
		//============= logout Event  贸府 =============	
		$("a:contains('Log Out')").on("click" , function() {
			$(self.location).attr("href","/user/logout");
		}); 
		
		//============= ListUser Event  贸府 =============	
		//==> DOM Object GET 3啊瘤 规过 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a:contains('ListUser')").on("click" , function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/user/listUser"
		}); 
		
		//=============  GetUser Event  贸府 =============	
		$( "a:contains('GetUser')" ).on("click" , function() {
			//==> DOM Object GET 3啊瘤 规过 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});

		//=============  AddProductView Event  贸府 =============	
		$( "a:contains('AddProductView')" ).on("click" , function() {
			$(self.location).attr("href","/product/addProductView.jsp");
		});

		//=============  ListProduct Event  贸府 =============	
		$( "a:contains('ListProduct')" ).on("click" , function() {
			$(self.location).attr("href","/product/listProduct?menu=${user.role=='admin'?'manage':'search'}");
		});
		
		//=============  ListPurchase Event  贸府 =============	
		$( "a:contains('ListPurchase')").on("click" , function() {
			$(self.location).attr("href","/purchase/listPurchase")
		});
		
		//=============  ListSalse Event  贸府 =============	
		$( "a:contains('ListSalse')").on("click" , function() {
			$(self.location).attr("href","/purchase/listSales")
		});
		
		//=============  History Event  贸府 =============	
		$( "a:contains('History')").on("click" , function() {
			window.open("/history.jsp",
					"popWin",
					"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
			//dialog肺 官操磊 jquery ui 巴档 宝满瘤 框流咯瘤聪
		});
		
		//=============  ListSalse Event  贸府 =============	
		$( ".navbar-brand").on("click" , function() {
			$(self.location).attr("href","/index.jsp")
		});
	});
</script>