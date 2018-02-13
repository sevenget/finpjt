<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" type="text/css" href="../resources/css/detail.css" media="all"> <!-- 이거 css명 작업하시는 css 파일명으로 바꾸세요 안 그럼 저랑 꼬여요..!  -->
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
			
				
				<div class="left">
					<%@ include file="/WEB-INF/views/include/portside.jsp"%>
	 			</div>
	 			
	 			
	 			<div class="right">
	 			<!-- 여기 안에다 작업하시면 돼요 -->
	 			
	 				<div class="7po"> <!-- 저는 오른쪽 화면에서 위와 아래, 두 개로 나뉘는 거라 div 두개로 나눈 거예요 -->
	 				<!-- class 명 지정해서 css 가서 width, height 값 지정해주고 float:left; 전에 설계하신대로 3개로 만들 수 있을 거예요
	 				border:1px solid red; 이거 추가해서 작업하면 더 보기 편해요 -->
	 					<h4>7포</h4>	
	 					<hr width="915px" color="#aaa" size="1" class="hr"> <!-- 구분선 -->
	 				</div>
	 				
	 				
	 				
	 				<div class="review">
						<h4>리뷰</h4>
						<hr width="915px" color="#aaa" size="1" class="hr">	 				
	 				</div>
	 			
	 			
	 			</div>

			</div>

		</div>
	</div>



</body>
</html>