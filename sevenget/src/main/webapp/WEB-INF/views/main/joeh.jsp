<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<script type='text/javascript' src='../resources/js/jquery.js'></script>
<script>
	function fLoadData() {
		$.ajax({
			//type: "POST",
			url : "loading",//loadContent
			data : "",
			success : function(resultText) {
				$('#loadData').html(resultText);
			},
			error : function() {
				alert("호출 실패");
			}
		});
	}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" type="text/css"
	href="../resources/css/loading.css " media="all" flush="false">
<link rel="stylesheet" type="text/css"
	href="../resources/css/barchart.css " media="all" flush="false">
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>
</head>
<body>

	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
	</div>

	<div id="all">
		<div id="contect">
			${ id }<br /> ${member }
			<!-- 여기 안에다 작업하시면 돼요 -->
			<div class="container2">

				<div></div>

				<a href="detailpage">상세페이지 이동</a> <br /> <a href="login">로그인페이지
					이동</a> <br /> <a href="mypage">마이페이지 이동</a> <br /> <a href="mypage2">7포,리뷰페이지
					이동</a> <br /> <a href="main">메인페이지 이동</a> <a href="review">상세페이지
					이동</a> <br />


				<!-- <img src="../resources/img/plots/radarchart.png" /> -->

				<!-- <div class="loading-container">
					<div class="loading"></div>
					<div id="loading-text">loading</div>
				</div> -->


				<%-- <%@include file="/WEB-INF/views/svg/radarSVG.jsp"%> --%>



				<!-- 로딩문구를 보여주는 것은 이탈율(Bounce rate)을 낮추고 페이지뷰를 높이는 효과도 있으므로 작지만 사용자에게 직관적인 인터페이스 구현에 신경쓰는 것이 매우 좋다 하겠다. -->


				<!-- 버튼 클릭시 로딩 화면 5초/R작동, 결과출력 -->

				<!-- <div id="loadData"
					style="width: 500px; height: 400px; margin-top: 20px; border: 1px solid #CCCCCC; background: #EFEFEF; display: inlne;">
				</div>
				<div style="margin-top: 20px; display: inline;">
					<input type="button" value="호출" onClick="fLoadData()" />
				</div> -->



				<!-- barchart -->



				<script>
					(function($) {
						"use strict";
						$(function() {
							function animated_contents() {
								$(".zt-skill-bar > div ").each(
										function(i) {
											var $this = $(this), skills = $this
													.data('width');

											$this.css({
												'width' : skills + '%'
											});

										});
							}

							if (jQuery().appear) {
								$('.zt-skill-bar').appear().on('appear',
										function() {
											animated_contents();
										});
							} else {
								animated_contents();
							}
						});
					}(jQuery));
					
					
					
					$( ".zt-skill-bar > div " ).each(
							(function(){ $( "#block1" ).animate( { width: "90%" }, { queue: false, duration: 3000 }) .animate({ fontSize: "24px" }, 1500 ) .animate({ borderRightWidth: "15px" }, 1500 ); });
							);

				</script>
				
<div class="zt-span6 last">
<h3><strong>진행율 바</strong></h3>
<div class="zt-skill-bar"><div data-width="${10*10}" style="">연애<span>88%</span></div></div>
<div class="zt-skill-bar"><div data-width="${10*8}" style="">결혼<span>92%</span></div></div>
<div class="zt-skill-bar"><div data-width="${10*7}" style=";">출산및육아<span>82%</span></div></div>
<div class="zt-skill-bar"><div data-width="${10*5}" style=";">내집마련<span>85%</span></div></div>
<div class="zt-skill-bar"><div data-width="${10*3}" style=";">인간관계<span>60%</span></div></div>
<div class="zt-skill-bar"><div data-width="${10*6}" style=";">꿈<span>60%</span></div></div>
<div class="zt-skill-bar"><div data-width="${10*1}" style=";">희망<span>60%</span></div></div>

</div>




</body>
</html>