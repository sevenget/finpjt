<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" type="text/css" href="../resources/css/loading.css " media="all" flush="false">
<link rel="stylesheet" type="text/css" href="../resources/css/detail.css" media="all"> <!-- 이거 css명 작업하시는 css 파일명으로 바꾸세요 안 그럼 저랑 꼬여요..!  -->
<link rel="stylesheet" type="text/css" href="../resources/css/portside.css" media="all"> <!-- 이거 css명 작업하시는 css 파일명으로 바꾸세요 안 그럼 저랑 꼬여요..!  -->
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
	 				
	 				<div class="sevenpo"> 
	 					<p class="head_rv">7포</p>	
	 					<hr width="915px" color="#aaa" size="1" class="dt_hr">
	 					
	 					
	 					<div class="company">
	 						<div class="graph">
	 							<div class="graph_img">
	 								<img src="../resources/img/ggradar.png" />
	 								
	 								<!-- <img src="../resources/img/graph.png"> -->  
	 							</div>
	 						</div>
	 					
	 						<div class="c_info">
	 							
	 							<div class="c_heart">♥</div>
	 							<div class="c_name">(주)카카오</div>
	 							<div class="c_information">
	 								<!-- 상세 정보  들어가는 곳 -->
	 							</div>
	 							
	 						</div>
	 					
	 						<div class="c_result">
	 							<!-- <p class="marks">"</p> -->
	 							<img src="../resources/img/marks1.png" class="marks" width:>
	 							<p class="get">내 집 마련, 꿈, 희망</p>
	 							<p class="ex">을 득하고, </p>
	 							<p class="lose">연애, 결혼, 출산, 인간관계</p>
	 							<p class="ex">를 포기하였습니다.</p>
	 							<!-- <p class="marks">"</p> -->
	 							<img src="../resources/img/marks2.png" class="marks">
	 						</div>
	 					
	 					</div>
	 					
	 				</div>	
	 				
	 				
	 				<div class="review">
						<p class="head_rv">리뷰</p>
						<hr width="915px" color="#aaa" size="1" class="dt_hr">	 
						
						<div class="c_review">
							
							<div class="review1">
								<p class="cr_view">"기술직이 자신의 능력만큼 대우 받을 수 있는 회사. 대한민국에서 만족스러운 수준의 워라벨."</p>
								<p class="cr_date">2018/02/07</p>
							</div>
							
							<div class="review2">
								<p class="cr_view">"개발자가 그나마 다른 회사에 비해 HOW에 집중 할 수 있다."</p>
								<p class="cr_date">2018/01/14</p>
							</div>
						
						    <div class="review3">
								<p class="cr_view">"국내에서 IT관련 모든 직군을 경험해 볼 수 있는 몇 안되는 좋은 회사 입니다."</p>
								<p class="cr_date">2018/01/11</p>
							</div>
							
						</div>
						
						<div class="c_write">
							<input type="text" placeholder=" 리뷰 작성하기(50자 이내)" class="cr_write" maxlength="50"></label>
							<input type="button" value="리뷰입력" class="cr_btn"></label>
						</div>
										
	 				</div>
	 			
	 			
	 			</div>

			</div>

		</div>
	</div>



</body>
</html>