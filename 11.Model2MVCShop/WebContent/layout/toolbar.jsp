<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
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
						<input type="text" class="form-control col-lg-8" placeholder="Search">
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
							<li><a href="#">AddProductView</a></li>
							<li><a href="#">History</a></li>
							<li class="divider"></li>
							<li><a href="#">ListProduct</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Account<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">GetUser</a></li>
							<li class="divider"></li>
							<li><a href="#">ListUser</a></li>
						</ul>
					</li>
					<c:if test="${user!=null}">
						<li><a href="#">Log Out</a></li>
					</c:if>
					<c:if test="${user==null}">
						<li><a href="#">Log In</a></li>
					</c:if>
				</ul>
			</div>
		</div>
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
	 		if("${user.role=='admin'}"){
	 			$(self.location).attr("href","/product/listProduct?menu=manage");	
	 		}else{
	 			$(self.location).attr("href","/product/listProduct?menu=search");
	 		}
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
		$( ".navbar-header:contains('Model2MVCShop')").on("click" , function() {
			$(self.location).attr("href","/index.jsp")
		});
	});
</script>