<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
<%-- 
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
  --%>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
<!--  ///////////////////////// Font ////////////////////////// -->
<link href="https://fonts.googleapis.com/css?family=Oxygen|Syncopate" rel="stylesheet">

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="/css/theme.min.css" >
	<link rel="stylesheet" href="/css/custom-theme.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	

<!-- 
font-family: 'Advent Pro', sans-serif;
font-family: 'Syncopate', sans-serif;
 -->
<style>
</style>

</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End   /////////////////////////////////////-->
	
	<!-- MainSlide Start /////////////////////////////////////-->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img class="first-slide" src="/images/layer/mainSlider1.jpg" alt="First slide" style="opacity: 0.4;">
					<div class="container">
						<div class="carousel-caption">
							<h1>Example headline.</h1>
							<p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
							<p><a class="btn btn-lg btn-copper" href="#" role="button">Sign up today</a></p>
						</div>
					</div>
				</div>
				<div class="item">
					<img class="second-slide" src="/images/layer/mainSlider2.jpg" alt="Second slide" style="opacity: 0.4;">
					<div class="container">
						<div class="carousel-caption">
							<h1>Another example headline.</h1>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
							<p><a class="btn btn-lg btn-copper" href="#" role="button">Learn more</a></p>
						</div>
					</div>
				</div>
				<div class="item">
					<img class="third-slide" src="/images/layer/mainSlider3.jpg" alt="Third slide" style="opacity: 0.4;">
					<div class="container">
						<div class="carousel-caption">
							<h1>Example headline.</h1>
							<p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
							<p><a class="btn btn-lg btn-copper" href="#" role="button">Sign up today</a></p>
						</div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span	aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	<!-- MainSlide End   /////////////////////////////////////-->
	
	<!-- itemContent Start /////////////////////////////////////-->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h1>Hello, world!</h1>
					<p>...</p>
					<p><a class="btn btn-copper btn-lg" href="#" role="button">Learn more</a></p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h1>Hello, world!</h1>
					<p>...</p>
					<p><a class="btn btn-copper btn-lg" href="#" role="button">Learn more</a></p>
				</div>
			</div>
		</div>
	</div>
	<!-- itemContent End   /////////////////////////////////////-->
	
	<!-- ImageContent Start /////////////////////////////////////-->
	<div class="container-fluid">
		<!-- <div class="row imageContentBox" style="background:transparent url('images/layer/4394b2b689cfe3dc06f8109ce5e8b621.jpg') no-repeat center center /cover"> -->
		<div class="row imageContentBox" style="background:url('images/layer/4394b2b689cfe3dc06f8109ce5e8b621.jpg') no-repeat center center fixed ">
			<div class="imageCover">
				<div class="col-md-6">
				</div>
				<div class="col-md-6 imageContent">
						<h1>One more for good measure.</h1>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
			</div>
		</div>
		<div class="row imageContentBox" style="background:url('images/layer/5ab08837cb294ad24e77c30b55540e7a.jpg') no-repeat center center fixed">
			<div class="imageCover">
				<div class="col-md-6 imageContent">
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
						<h1>Another example headline</h1>
				</div>
				<div class="col-md-6">
				</div>
			</div>
		</div>
	</div>
	<!-- ImageContent End   /////////////////////////////////////-->
	
	<br/><br/><br/>
	
	<!-- itemContent Start /////////////////////////////////////-->
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="jumbotron">
					<h1>Hello, world!</h1>
					<p>...</p>
					<p><a class="btn btn-copper btn-lg" href="#" role="button">Learn more</a></p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="jumbotron">
					<h1>Hello, world!</h1>
					<p>...</p>
					<p><a class="btn btn-copper btn-lg" href="#" role="button">Learn more</a></p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="jumbotron">
					<h1>Hello, world!</h1>
					<p>...</p>
					<p><a class="btn btn-copper btn-lg" href="#" role="button">Learn more</a></p>
				</div>
			</div>
		</div>
	</div>
	<!-- itemContent End   /////////////////////////////////////-->

	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp" />
	<!-- footer end   /////////////////////////////////////-->
</body>

</html>