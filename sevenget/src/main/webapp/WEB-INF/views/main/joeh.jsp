<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" type="text/css" href="../resources/css/loading.css " media="all" flush="false">
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>
</head>
<body>


	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
	</div>		

	<div id="all">
		<div id=contect">
	
		<!-- 여기 안에다 작업하시면 돼요 -->	
			<div class="container2">
				<div></div>
				
				
				<img src="../resources/img/plots/ggradar.png" />
				<img alt="../resources/img/plotsggradar.png" src="../resources/img/plots/wordcloud.png" />
				
				<a href="detailpage">상세페이지 이동</a>
				<a href="login">로그인페이지 이동</a>
				<a href="mypage">마이페이지 이동</a>
				<a href="mypage2">7포,리뷰페이지 이동</a>
				<a href="main">메인페이지 이동</a>
				




				<div class="loading-container">
					<div class="loading"></div>
					<div id="loading-text">loading</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>