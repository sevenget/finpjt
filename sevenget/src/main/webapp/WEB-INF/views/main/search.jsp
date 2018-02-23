<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7get-Search</title>
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src = "../resources/js/search.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" href="../resources/css/searchMain.css" >
</head>
<body>
	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
	</div>		
	<div id="all">
		<div id=contect">
	
		
		
		<!-- 여기 안에다 작업하시면 돼요 -->	
		<div id = "searchHolder">
			
			<!-- 검색 -->
			<div>
				<form action="search">
						<table>
							<tr>
								<td> 
									<select>
										<option>&nbsp&nbsp통합</option>
										<option>&nbsp&nbsp기업</option>
										<option>&nbsp&nbsp채용</option>								
									</select>
									<nobr>
										<input name="keyword" type="text">
										<img id="searchBtn" src = "../resources/img/searchBtn.png">
									</nobr>
								</td>
								<td class="filter"> 필터</td>
							</tr>
						</table>
					</form>
				</div>
		</div>

			<div class="container2">	
				
				
				<!-- 기업 정보 -->
			
				<div id="resultHolder">
					<jsp:include page="/WEB-INF/views/include/searchBody.jsp"></jsp:include>
				</div>
				
				<div id="infoHolder">
					 <!-- 배너 광고 -->
					 <div class="info_ad">
						<a href="void(0);" onclick="alert('준비중 입니다.');return false;"><img src="../resources/img/ad1.png"></a>
					</div>
					
					<!-- 회원정보 -->
					<div class="infoContHolder">
						<div class="infocontholder_2">

								<p class="head_member">회원 정보</p>
								<hr width="285px" color="#aaa" size="1" class="hr_member">
						
								<div class="ficture">
									<img src="../resources/img/johnpic.jpg">
								</div>
							
								<div class="membership">
									<p>홍길동</p><br>
									<p class="font">1990/02/10</p>
									<p class="font">쾌도대학교 졸업</p>			
								</div>
								
								<input type="button" value="MyPage" class="MyPage_btn" onclick="location.href='mypage';">
						</div>
					</div>
						<!-- 
						<table>
							<tr>
								<td rowspan=3><img src="../resources/img/johnpic.jpg" onClick="location.href='mypage';"></td>
								<td class="myinfo">이름</td>
								<td class="myinfoCont">정주온</td>
							</tr>
							<tr>
								<td class="myinfo">성별</td>
								<td class="myinfoCont">남</td>		
							</tr>
							<tr>
								<td class="myinfo">나이</td>
								<td class="myinfoCont">28</td>		
							</tr>
						</table>
						 -->
						<!-- <img src="dd"> --><!-- 개인 중요도 plot 넣을 자리 -->
				</div>
			</div>
		</div>
	</div>
<div></div>
</body>
</html>