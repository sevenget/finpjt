<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7get-Search</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css?ver=0 " media="all" flush="false">
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src = "http://malsup.github.com/jquery.cycle2.js"></script>
<script src = "../resources/js/search.js"></script>
<link rel="stylesheet" href="../resources/css/searchMain.css" >
</head>
<body>
	<div id="head">
		<%@ include file="/WEB-INF/views/include/header2.jsp" %>
	</div>		
	<div id="all">
		<div id=contect">
	
		
		
		<!-- 여기 안에다 작업하시면 돼요 -->	
		<div id = "searchHolder">
			
			<!-- 검색 -->
			<div class="search_filter">
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
					<div class="rh_head">
						<span class="resulttitle">&emsp;기업</span>
					</div>
					
					<hr width="915px" color="#aaa" size="1" class="dt_hr">
				<c:forEach var="company" items="${ companylist }">
					<form>
						<table>
							<tr>
								<td class="companylogo" rowspan=4><img src="../resources/img/logos/${company.logo}"></td>
								<td class="companytitle" rowspan=4>${company.cname }</td>
								<td colspan=4></td>
								<td rowspan=4><img src="../resources/img/colorheart.jpg"></td>
							</tr>
							<tr>
								<td>${company.industry}</td>
								<td>사원수 ${company.employee}명</td>
								<td rowspan=2>${company.sales}</td>
								<td class="c_get"> 내 집 마련, 꿈, 희망 득
							</tr>
							<tr>
								<td colspan=2 class="c_address">${company.location}</td>
								<td class="c_lose">연애, 결혼, 출산, 인관관계 포기</td>
							</tr>
							<tr>
								<td colspan=4></td>
							</tr>
						</table>
					</form>
					<hr width="888px" color="#aaa" size="1" class="dt_hr">
					</c:forEach>
					
				</div>
				
				<div id="infoHolder">
					 <!-- 배너 광고 -->
					 <div class="info_ad">
						<a href="void(0);" onclick="alert('준비중 입니다.');return false;"><img src="../resources/img/ad1.png"></a>
					</div>
					
					<!-- 회원정보 -->
					<div class="infoContHolder">
						<div class="infocontholder_2">

								<p class="head_member">로그인</p>
								<hr width="285px" color="#aaa" size="1" class="hr_member">
								
							
								<input type="text" class="login_id" placeholder="아이디" >
								<input type="password" class="login_pw" placeholder="비밀번호" maxlength="20">
								<input type="button" value="로그인" class="login_btn" >
								<div class="face_btn">
									<img src="../resources/img/f.png">
									<p>페이스북 로그인</p>
								</div>
								<input type="button" value="회원가입" class="join_btn" onClick="location.href='register';">
		
	
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
<div></div>
</body>
</html>