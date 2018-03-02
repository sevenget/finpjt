<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <% 
	String k = request.getParameter("cake");
	System.out.println(k);
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css"
	media="all">
<link rel="stylesheet" type="text/css" href="../resources/css/RightPage.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="../resources/css/portside.css" media="all">
<!-- 이거 css명 작업하시는 css 파일명으로 바꾸세요 안 그럼 저랑 꼬여요..!  -->
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>

<script>

	/* 디비먼저 하고나서 수정 */
	/*  $(function(){
		// 앞 버튼에 click 이벤트 등록
		var page = 1;
		$('#btnHolder1').click(function(){
			if(page=1){
				return;
			}else{
				page = page - 1
				//ajax로 interComp 영역 업로드
				$('#interComp').load(
						'http://localhost:8090/vs/include/interComp?page='+page)
			}
			
		})
	}) */
	
	$(function(){
		$('#btnHolder1').click(function(){
			
		})
	})
		
</script>

</head>
<body>


	<div id="head">
		<jsp:include page="../include/header.jsp" flush="false" />
	</div>

	<div id="all">
		<div id="contect">

			<!-- 여기 안에다 작업하시면 돼요 -->
			<div class="container2">


				<div class="left">
					<jsp:include page="../include/portside.jsp" flush="false" />
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

							<h4 style="padding-left: 400px">관심 기업 리스트</h4>
							<hr id="line4" width="885px" color="#aaa" size="1" class="hr"
								style="margin-left: 30px">
						</div>
						<!-- 관심 기업 리스트 표 -->
						
						
						
						<div id=btnHolder1 style="clear: both; margin-top: 150px; margin-left: 100px;">
							<button id='btnPrev'  >&lt;</button>
						</div>
						<div id="interComp" style="float: left;">
							<jsp:include page="../include/interComp.jsp" />
						</div>
						<div id=btnHolder2 style="margin-left:10px; margin-top: 150px;">
							<button id='btnNext'>&gt;</button>
						</div>

					</div> <!--rightTop  -->
				</div> <!-- right -->

			</div><!-- container2 -->

		</div><!-- contect -->
	</div>



</body>
</html>