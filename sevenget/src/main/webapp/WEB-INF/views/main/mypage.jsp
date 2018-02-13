<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" type="text/css" href="../resources/css/RightPage.css"
	media="all">
<!-- 이거 css명 작업하시는 css 파일명으로 바꾸세요 안 그럼 저랑 꼬여요..!  -->
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
					<%@ include file="/WEB-INF/views/include/portside.jsp" %>
				
				</div>

				<div class="right">
					<div class="rightTop">
						<!-- 여기 안에다 작업하시면 돼요 -->

						<div class="recommend">
							<!-- 저는 오른쪽 화면에서 위와 아래, 두 개로 나뉘는 거라 div 두개로 나눈 거예요 -->
							<!-- class 명 지정해서 css 가서 width, height 값 지정해주고 float:left; 전에 설계하신대로 3개로 
							  만들 수 있을 거예요  border:1px solid red; 이거 추가해서 작업하면 더 보기 편해요 -->
							<h4 style="margin-left: 50px;">나에게 추천하는 기업</h4>
							<hr style="margin-left: 30px;" width="230px" color="#aaa"
								size="1" class="hr">
							<!-- 구분선 -->
							<h4 style="padding-left: 60px">1.</h4>
							<h4 style="padding-left: 60px">2.</h4>
							<h4 style="padding-left: 60px">3.</h4>
						</div>
						<div class="recent">
							<h4 style="padding-left: 110px;">최근 검색 기업 리스트</h4>
							<hr style="margin-left: 90px;" width="250px" color="#aaa"
								size="1" class="hr">
							<h4 style="padding-left: 130px">1.</h4>
							<h4 style="padding-left: 130px">2.</h4>
							<h4 style="padding-left: 130px">3.</h4>
						</div>
						<div class="most">
							<h4 style="padding-left: 70px;">최다 검색 기업 리스트</h4>
							<hr style="margin-left: 50px;" width="260px" color="#aaa"
								size="1" class="hr">
							<h4 style="padding-left: 90px">1.</h4>
							<h4 style="padding-left: 90px">2.</h4>
							<h4 style="padding-left: 90px">3.</h4>
						</div>
						<div style="margin-top: 130px; clear: both">

							<h4 style="padding-left: 50px">관심 기업 리스트</h4>
							<hr id="line4" width="840px" color="#aaa" size="1" class="hr"
								style="margin-left: 30px">
						</div>
						<!-- 관심 기업 리스트 표 -->
						<div style="clear: both;">
						<table style="border:1px solid red ; float:left; margin-left:50px;">
							<tr>
								<td style="width: 220px; height: 150px;" >
									aaa
								</td>
							</tr>
						</table>
						
						<table style="border:1px solid red; float:left; margin-left:50px;">
							<tr >
								<td style="width: 220px; height: 150px;">
								
								</td>
							</tr>
						</table>
						
						<table style="border:1px solid red; float:left; margin-left:50px;">
							<tr >
								<td style="width: 220px; height: 150px;">
								
								</td>
							</tr>
						</table>
						
						</div>
						
						<!-- 2번째 줄 -->
						<div style="clear: both; margin-top: 10px;">
						<table style="border:1px solid red ; float:left; margin-left:50px;">
							<tr>
								<td style="width: 220px; height: 150px;" >
									
								</td>
							</tr>
						</table>
						
						<table style="border:1px solid red; float:left; margin-left:50px;">
							<tr >
								<td style="width: 220px; height: 150px;">
								
								</td>
							</tr>
						</table>
						
						<table style="border:1px solid red; float:left; margin-left:50px;">
							<tr >
								<td style="width: 220px; height: 150px;">
								
								</td>
							</tr>
						</table>
						
						</div>

					</div> <!--rightTop  -->
				</div> <!-- right -->

			</div><!-- container2 -->

		</div><!-- contect -->
	</div>



</body>
</html>