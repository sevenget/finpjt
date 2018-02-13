<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7get-Search</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all" flush="false">
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src = "http://malsup.github.com/jquery.cycle2.js"></script>
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
					<table>
						<tr>
							<td> 
							<select>
								<option>&nbsp&nbsp통합</option>
								<option>&nbsp&nbsp기업</option>
								<option>&nbsp&nbsp채용</option>								
							</select>
							<input type="text">
							<img id="searchBtn" src = "../resources/img/searchBtn.png">
							</td>
							<td class="filter"> 필터</td>
						</tr>
					</table>
				</div>
			<div class="container2">
				<div class="cycle-slideshow" data-cycle-fx=scrollHorz data-cycle-timeout=5000 data-cycle-pager-fx=scrollVert>
					<img class="advSlides" src="../resources/img/joinus.png">
					<img class="advSlides" src="../resources/img/granpaback.jpg">
					<img class="advSlides" src="../resources/img/words.jpg">
					<img class="advSlides" src="../resources/img/mountain.jpg">
					<div class="cycle-pager"></div>
				</div>
				<div id="resultHolder">
					
					<span class="resulttitle">&emsp;기업</span>
					<hr>
					<form>
						<table>
							<tr>
								<td class="companylogo" rowspan=4><img src="../resources/img/logos/kakao.png"  onClick="location.href='mypage2';"></td>
								<td class="companytitle" rowspan=4>카카오(주)</td>
								<td colspan=4></td>
								<td rowspan=4><img src="../resources/img/colorheart.jpg"></td>
							</tr>
							<tr>
								<td>IT/웹/통신</td>
								<td>사원수 2500명</td>
								<td rowspan=2>매출액 9248억(2015)</td>
								<td> 내 집 마련, 꿈, 희망 득
							</tr>
							<tr>
								<td colspan=2>제주특별자치도 제주시 첨단로 242</td>
								<td>연애, 결혼, 출산, 인관관계 포기</td>
							</tr>
							<tr>
								<td colspan=4></td>
							</tr>
						</table>
					</form>
				</div>
				<div id="infoHolder">
					<div>
						<img src="../resources/img/worabel.jpg">
					</div>
					<div class="infoContHolder">
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
						<!-- <img src="dd"> --><!-- 개인 중요도 plot 넣을 자리 -->
					</div>
				</div>
			</div>
		</div>
	</div>
<div></div>
</body>
</html>