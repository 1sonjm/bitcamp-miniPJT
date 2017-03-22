<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" 
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style type="text/css">
.form-group input[type="checkbox"] {
    display: none;
}

.form-group input[type="checkbox"] + .btn-group > label span {
    width: 10px;
}

.form-group input[type="checkbox"] + .btn-group > label span:first-child {
    display: none;
}
.form-group input[type="checkbox"] + .btn-group > label span:last-child {
    display: inline-block;   
}

.form-group input[type="checkbox"]:checked + .btn-group > label span:first-child {
    display: inline-block;
}
.form-group input[type="checkbox"]:checked + .btn-group > label span:last-child {
    display: none;   
}
#keywordPlace input { width: 150px; }
#keywordPlace input:focus { width: 200px; }
</style>

<title>${param.menu=="manage"?"상품관리":"상품 목록조회"}</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script type="text/javascript">
function fncGetList(currentPage){
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();
}
function fncSorting(sortingTarget,isASC){
	document.getElementById("searchSortingOption").value = sortingTarget+","+isASC;
	document.detailForm.submit();
}
function fncViewSoldItem(){
	document.getElementById("currentPage").value = 1;
	document.detailForm.submit();
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<div style="width:98%; margin-left:10px;">
<form name="detailForm" action='/listProduct.do?&menu=${param.menu}' method="post">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						${param.menu=="manage"?"상품관리":"상품 목록조회"}
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table><br/>

<div class="form-inline pull-right">
	<div class="form-group" id="keywordPlace">
		<c:if test='${param.menu=="manage"}'>
			<div class="[ form-group ]">
				<input type="checkbox" name="viewSoldItem" id="fancy-checkbox-info" 
					onclick="fncViewSoldItem()" autocomplete="off" ${viewSoldItem eq true?"checked":""}/>
				<div class="[ btn-group ]">
					<label for="fancy-checkbox-info" class="[ btn btn-info ]">
						<span class="[ glyphicon glyphicon-ok ]"></span>
						<span> </span>
					</label>
					<label for="fancy-checkbox-info" class="[ btn btn-default active ]">
						구매물품 보기
					</label>
				</div>
			</div>&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
		<select name="searchCondition" class="form-control">
			<c:if test='${param.menu=="manage"}'>
				<option value="0" ${searchCondition=="0" ? "selected" : ""}>상품번호</option>
			</c:if>
			<option value="1" ${searchCondition=="1" ? "selected" : ""}>상품명</option>
			<option value="2" ${searchCondition=="2" ? "selected" : ""}>상품가격</option>
		</select>
		<input type="text" class="form-control" name="searchKeyword" placeholder="검색어">
	</div>&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="form-group" id="chkValue">
		<label for="searchValueLow">가격비교</label>
		<input type="text" class="form-control" name="searchValueLow" placeholder="최소 가격" style="width: 100px;">
		<label for="searchValueHigh">~</label>
		<input type="text" class="form-control" name="searchValueHigh" placeholder="최대 가격" style="width: 100px;">
		<!-- seekbar자료 : http://stackoverflow.com/questions/27060099/seekbar-with-range-of-two-values-min-and-max -->
	</div>
	<button class="btn btn-default" onclick="javascript:fncGetList('1');">검색</button>
</div>
<p>전체 <kbd>${resultPage.totalCount}</kbd> 건수, 현재 <kbd>${search.currentPage}</kbd> 페이지</p><br/>
<input type="hidden" name="searchSortingOption" name="searchSortingOption" value="${search.searchSortingOption}">
<table class="table table-hover">
	<thead>
		<tr>
			<c:if test='${param.menu=="manage"}'>
				<td class="ct_list_b" width="100">No</td>
			</c:if>
			<c:if test='${param.menu=="search"}'>
				<td class="ct_list_b" width="50">사진</td>
			</c:if>
			<td class="ct_list_b" width="150">상품명
				<a href="javascript:fncSorting('prodName','1')">↓</a>
				<a href="javascript:fncSorting('prodName','0')">↑</a>
			</td>
			<td class="ct_list_b" width="150">가격
				<a href="javascript:fncSorting('price','1')">↓</a>
				<a href="javascript:fncSorting('price','0')">↑</a>
			</td>
			<c:if test='${param.menu=="manage"}'>
				<td class="ct_list_b">등록일</td>
			</c:if>
			<td class="ct_list_b">현재상태</td>
		</tr>
	</thead>
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}" begin="0" step="1">
		<tr class="ct_list_pop">
			<c:if test='${param.menu=="search"}'>
				<td class="ct_line02">
					<img alt="사진" src="./images/uploadFiles/${product.fileName}" width="100"/>
				</td>
			</c:if>
			<c:set var="i" value="${i+1}"/>
			<c:if test='${param.menu=="manage"}'>
				<td align="center">${i}</td>
			</c:if>
				<td align="left">
					<c:if test='${product.proTranCode=="판매중"}'>
						<a href='/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}'>
						${product.prodName}</a>
					</c:if>
					<c:if test='${product.proTranCode!="판매중"}'>
						<a href='/getProduct.do?prodNo=${product.prodNo}&menu=soldout'>
						${product.prodName}
						</a>
					</c:if>
				</td>
			<td align="left">${product.price}</td>
			<c:if test='${param.menu=="manage"}'>
				<td align="left">${product.regDate}</td>
			</c:if>
			<td align="left">
				${product.proTranCode}
				<c:if test='${param.menu=="manage" && product.proTranCode=="구매완료"}'>
					<a href="/updateTranCodeByProd.do?prodNo=${product.prodNo}">배송하기</a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value="${search.currentPage}"/>
			<jsp:include page="../common/pageNavigator.jsp"/>
		</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
