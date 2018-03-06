<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7get - Main</title>
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src = "http://malsup.github.com/jquery.cycle2.js"></script>
<script>
$(function(){
		$('#searchHolder form').submit(function(){
			$('div.search_ad').hide('slow');
			$('')
		});
		
		$('#searchBtn').click(function(){
			$('#searchHolder form').submit();
		});
});
</script>

<link rel="stylesheet" type="text/css" href="../resources/css/session.css?ver=17" media="all" flush="false">
<link rel="stylesheet" href="../resources/css/searchMain.css?ver=55" >


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
								<td class = "filter"> 필터</td>
								<td class = "filter_apply"><b><span class="filter_apply">0</span></b>개 적용중</td>
							</tr>
						</table>
					</form>
				</div>
		</div>

			<div class="container2">	
				<!-- 광고 -->
				<div class="search_ad">
					<div class="cycle-slideshow" data-cycle-fx=scrollHorz data-cycle-timeout=5000 data-cycle-pager-fx=scrollVert>
						<img class="advSlides" src="../resources/img/joinus.png">
						<img class="advSlides" src="../resources/img/granpaback.jpg">
						<img class="advSlides" src="../resources/img/words.jpg">
						<img class="advSlides" src="../resources/img/mountain.jpg">
						<div class="cycle-pager"></div>
					</div>
				</div>
				
				<!-- 기업 정보 -->
				<div id="resultHolder">
					<jsp:include page="/WEB-INF/views/include/searchBody.jsp"></jsp:include>
				</div>
				<div id="infoHolder1">
					 <!-- 배너 광고 -->
					 <div class="info_ad">
						<a href="void(0);" onclick="alert('준비중 입니다.');return false;"><img src="../resources/img/ad1.png"></span></a>
					</div>
					
					<!-- 회원정보 -->
					<div class="infoContHolder">
						<jsp:include page="/WEB-INF/views/include/info_include.jsp"></jsp:include>
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