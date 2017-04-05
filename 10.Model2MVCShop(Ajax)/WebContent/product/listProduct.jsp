<%@ page contentType="text/html; charset=euc-kr" %>

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
	
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<style type="text/css">
/* Hiding the checkbox, but allowing it to be focused */
.badgebox
{
    opacity: 0;
}

.badgebox + .badge
{
    /* Move the check mark away when unchecked */
    text-indent: -999999px;
    /* Makes the badge's width stay the same checked and unchecked */
	width: 27px;
}

.badgebox:focus + .badge
{
    /* Set something to make the badge looks focused */
    /* This really depends on the application, in my case it was: */
    
    /* Adding a light border */
    box-shadow: inset 0px 0px 5px;
    /* Taking the difference out of the padding */
}

.badgebox:checked + .badge
{
    /* Move the check mark back when checked */
	text-indent: 0;
}
#keywordPlace input { width: 150px; }
#keywordPlace input:focus { width: 200px; }
</style>

<title>${param.menu=="manage"?"��ǰ����":"��ǰ �����ȸ"}</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script type="text/javascript">
function fncGetList(currentPage){
	$("#currentPage").val(currentPage);
	$('form').submit();
}

$(function(){
	$('td.ct_list_b:contains("��ǰ��") a:contains("��")').on('click',function(){
		$('#SortingTarget').val('prodName');
		$('#SortingDESC').val('1');
		$('form').submit();
	});
	$('td.ct_list_b:contains("��ǰ��") a:contains("��")').on('click',function(){
		$('#SortingTarget').val('prodName');
		$('#SortingDESC').val('0');
		$('form').submit();
	});
	$('td.ct_list_b:contains("����") a:contains("��")').on('click',function(){
		$('#SortingTarget').val('price');
		$('#SortingDESC').val('1');
		$('form').submit();
	});
	$('td.ct_list_b:contains("����") a:contains("��")').on('click',function(){
		$('#SortingTarget').val('price');
		$('#SortingDESC').val('0');
		$('form').submit();
	});
	
	
	$('input[name="viewSoldItem"], button:contains("�˻�")').on('click',function(){
		$('#currentPage').val(1);
		$('form').submit();
	});
	$('.ct_list_pop td:nth-child(3) .updateProduct').css("color" , "red").on('click',function(){
		self.location ="/product/updateProductView?prodNo="+$(this).attr('sendValue');
	});
	$('.ct_list_pop td:nth-child(3) .getProduct').css("color" , "red").on('click',function(){
		self.location ="/product/getProduct?prodNo="+$(this).attr('sendValue');
	});
	$('tr.ct_list_pop td a:contains("����ϱ�")').on('click',function(){
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
	$( ".ct_list_pop td:nth-child(1)" ).on("dblclick" , function() {
		var prodNo = $(this).parent().attr('sendValue');
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
				
				var displayValue = '<div class="productContent">'
										+'<div class="col-sm-6 col-md-4">'
											+'<div class="thumbnail">'
												+'<img src="/images/uploadFiles/'+JSONData.product.fileName+'">'
												+'<div class="caption">'
													+'<h3>'+JSONData.product.prodName+'</h3>'
													+'<p>'+JSONData.product.prodDetail+'<br/>�����:'+JSONData.product.regDate+'</p>'
													+'<p><a id="buyProduct" class="btn btn-primary" role="button" sendValue="'+JSONData.product.prodNo+'">����</a></p>'
												+'</div>'
											+'</div>'
										+'</div>'
									'</div>'
				$('div.productContent').remove();
				$( "#"+prodNo ).html(displayValue);
			}
		});
	});
	$(document).on('click', '#buyProduct', function(){
		alert("/product/updateProductView?prodNo="+$(this).attr('sendValue'));
		self.location ="/product/updateProductView?prodNo="+$('#buyProduct').attr('sendValue');
	});
});
</script>
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
</head>

<body bgcolor="#ffffff" text="#000000">


<div style="width:98%; margin-left:10px;">
<form name="detailForm" action='/product/listProduct?menu=${param.menu}' method="post">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						${param.menu=="manage"?"��ǰ����":"��ǰ �����ȸ"}
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table><br/>
<div id="serchMenu">
	<h3>��ǰ �˻�</h3>
	<div>
		<div class="form-inline pull-right">
			<div class="form-group" id="keywordPlace">
				<c:if test='${param.menu=="manage"}'>
					<label for="default" class="btn btn-default">���Ź�ǰ ����
						<input type="checkbox" id="default" class="badgebox" name="viewSoldItem" ${search.viewSoldItem?'checked':''}>
						<span class="badge">&check;</span>
					</label>
				</c:if>
				<select name="searchCondition" class="form-control">
					<c:if test='${param.menu=="manage"}'>
						<option value="0" ${search.searchCondition=="0" ? "selected" : ""}>��ǰ��ȣ</option>
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

<p>��ü <kbd>${resultPage.totalCount}</kbd> �Ǽ�, ���� <kbd>${search.currentPage}</kbd> ������</p><br/>
<input type="hidden" id="SortingTarget" name="SortingTarget" 
		value="${empty search.sortingTarget?'':search.sortingTarget}">
<input type="hidden" id="SortingDESC" name="SortingDESC" 
		value="${search.sortingDESC}">
<table class="table table-hover">
	<thead>
		<tr>
			<td class="ct_list_b" width="100">No</td>
			<c:if test='${param.menu=="search"}'>
				<td class="ct_list_b" width="50">����</td>
			</c:if>
			<td class="ct_list_b" width="150">��ǰ��
				<a>��</a>
				<a>��</a>
			</td>
			<td class="ct_list_b" width="150">����
				<a>��</a>
				<a>��</a>
			</td>
			<td class="ct_list_b" width="150">���</td>
			<c:if test='${param.menu=="manage"}'>
				<td class="ct_list_b">�����</td>
			</c:if>
			<td class="ct_list_b">�������</td>
		</tr>
	</thead>
	
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}" begin="0" step="1">
		<tr class="ct_list_pop" sendValue="${product.prodNo}">
			<c:set var="i" value="${i+1}"/>
			<td align="center">${i}</td>
			<c:if test='${param.menu=="search"}'>
				<td class="ct_line02">
					<img name="${product.fileName}" src="/images/uploadFiles/${product.fileName}" alt="St. Stephen" 
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
		</tr>
		<tr>
			<td id="${product.prodNo}" colspan="10" bgcolor="D6D7D6" height="1"></td>
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
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>