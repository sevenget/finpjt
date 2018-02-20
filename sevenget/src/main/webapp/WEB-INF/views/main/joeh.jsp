<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<script type='text/javascript' src='../resources/js/jquery.js'></script>
<script>
function fLoadData()
{
	$.ajax({
		//type: "POST",
		url: "loading",//loadContent
		data: "",
		success: function(resultText)
		{
			$('#loadData').html(resultText);
		},
		error: function() {
			alert("호출 실패");
		}
	});
}


$(document).ready(function($)
{
	$('#viewLoading').hide();

	$('#viewLoading')
	.ajaxStart(function()
	{
		$('#viewLoading').css('position', 'absolute');
		$('#viewLoading').css('left', $('#loadData').offset().left);
		$('#viewLoading').css('top', $('#loadData').offset().top);
		$('#viewLoading').css('width', $('#loadData').css('width'));
		$('#viewLoading').css('height', $('#loadData').css('height'));

		$(this).show();
		//$(this).fadeIn(500);
	})
/* 	.ajaxStop(function()
	{
		$(this).hide();
		$(this).fadeOut(500);
	}); */
});
		
</script>

<style>
/* 로딩 이미지의 위치와 투명도 조절 */
	div#viewLoading {
		text-align: center;
		padding-top: 70px;
		background: #FFFFF0;
		filter: alpha(opacity=60);
		opacity: alpha*0.6;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" type="text/css" href="../resources/css/loading.css " media="all" flush="false">
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>
</head>
<body>

	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
	</div>

	<div id="all">
		<div id=contect">

			<!-- 여기 안에다 작업하시면 돼요 -->
			<div class="container2">
			
				<div></div>

				<a href="detailpage">상세페이지 이동</a> <br />
				<a href="login">로그인페이지 이동</a> <br /> 
				<a href="mypage">마이페이지 이동</a> <br /> 
				<a href="mypage2">7포,리뷰페이지 이동</a> <br /> 
				<a href="main">메인페이지 이동</a>

				
				<!-- <img src="../resources/img/plots/radarchart.png" /> -->

				<!-- <div class="loading-container">
					<div class="loading"></div>
					<div id="loading-text">loading</div>
				</div> -->
				
				
				<%-- <%@include file="/WEB-INF/views/svg/radarSVG.jsp"%> --%>



<!-- 로딩문구를 보여주는 것은 이탈율(Bounce rate)을 낮추고 페이지뷰를 높이는 효과도 있으므로 작지만 사용자에게 직관적인 인터페이스 구현에 신경쓰는 것이 매우 좋다 하겠다. -->


	<div style="margin-top:20px;">
		구구단 1단<br />
		<input type="button" value="호출" onClick="fLoadData()"  />
	</div>

	<div id="loadData" style="width:500px; height: 200px; margin-top:20px; border:1px solid #CCCCCC; background:#EFEFEF;"></div>

	<div id="viewLoading">
		<img src="../resources/img/viewLoading.gif" />
	</div> 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			</div>
		</div>
	</div>



</body>
</html>