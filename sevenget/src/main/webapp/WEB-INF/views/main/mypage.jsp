<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <% 
	String k = request.getParameter("cake");
	System.out.println(k);
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7Get - MyPage</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css"
	media="all">
<link rel="stylesheet" type="text/css" href="../resources/css/RightPage.css?ver=111"
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
							<p class="right_title">나에게 추천하는 기업</p>
							<hr width="250px" color="#aaa"
								size="1" class="hr">
							<!-- 구분선 -->
							<ol>
								<c:if test="${fn:length(recommendList)==0}">
									<li class="cl_p">추천기업이 없습니다</li>
								</c:if>
								<c:forEach items="${recommendList}" var="recommend" begin="0" end="2">
									<h4><a href="./detailpage?cid=${recommend.cid}"><li>${recommend.cname}</li></a></h4>
								</c:forEach>
							</ol>
						</div>
						<div class="recent">
							<p class="right_title">최근 검색 키워드</p>
							<hr width="250px" color="#aaa"
								size="1" class="hr">
							<ol>
								<c:if test="${fn:length(recentKeywords)==0}">
									<li class="cl_p">최근 검색 키워드가 없습니다<a></a></li>
								</c:if>
								<c:forEach items="${recentKeywords}" var="keyword" begin="0" end="2">
								<li class="cl_p">${keyword.keyword}</li>
								</c:forEach>
							</ol>
						</div>
						<div class="most">
							<p class="right_title">최다 검색 키워드</p>
							<hr width="250px" color="#aaa"
								size="1" class="hr">
							<ol>
								<c:if test="${fn:length(recentKeywords)==0}">
									<li class="cl_p">검색 키워드가 없습니다<a></a></li>
								</c:if>
								<c:forEach items="${mostSearched}" var="keyword" begin="0" end="2">
								<li class="cl_p">${keyword.keyword}(${keyword.searchNum}회)</li>
								</c:forEach>
							</ol>
						</div>
						
						<div class="clist_div">

							<p class="right_title1">관심 기업 리스트</p>
							<hr id="line4" width="850px" color="#aaa" size="1" class="hr">
						</div>
						<!-- 관심 기업 리스트 표 -->
						
						
						
						<!-- <div id=btnHolder1 style="clear: both; margin-top: 150px; margin-left: 100px;">
							<button id='btnPrev'  >&lt;</button>
						</div> -->
						<div id="interComp">
							<jsp:include page="../include/interComp.jsp" />
						</div>
						<!-- <div id=btnHolder2 style="margin-left:10px; margin-top: 150px;">
							<button id='btnNext'>&gt;</button>
						</div> -->

					</div> <!--rightTop  -->
				</div> <!-- right -->

			</div><!-- container2 -->

		</div><!-- contect -->
	</div>



</body>
</html>