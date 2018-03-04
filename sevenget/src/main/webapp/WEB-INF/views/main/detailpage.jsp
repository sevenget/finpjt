<%@page import="model.company.CompanyBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 분석 페이지</title>

<link rel="stylesheet" type="text/css"
	href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" type="text/css"
	href="../resources/css/loading.css " media="all" flush="false">
<link rel="stylesheet" type="text/css"
	href="../resources/css/detail.css" media="all">
<link rel="stylesheet" type="text/css"
	href="../resources/css/portside.css" media="all">
<link rel="stylesheet" type="text/css"
	href="../resources/css/lightbox.css" media="all">
<link rel="stylesheet" type="text/css"
	href="../resources/css/review.css" media="all">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript">
	function openContent(cid) {

		$('.mw_layer').addClass('open');
		alert(cid)
		$.ajax({
			type : 'get',
			url : 'review',
			data : cid,
			success : function(resultText) {
				$('#layer').html(resultText);
			}
		})
	}
	
	jQuery(function($) {

		var layerWindow = $('.mw_layer');

		// ESC Event
		$(document).keydown(function(event) {
			if (event.keyCode != 27)
				return true;
			if (layerWindow.hasClass('open')) {
				layerWindow.removeClass('open');
			}
			return false;
		});

		// Hide Window
		layerWindow.find('>.bg').mousedown(function(event) {
			layerWindow.removeClass('open');
			return false;
		});
	});

	/*    function review_list() {
	 window.open("review", "_blank",
	 "width=950,height=500,resizable=1,scrollbars=1");
	 } */
	function fLoadData() {
		$.ajax({
			//type: "POST",
			url : "loading",//loadContent
			data : "cid=${cid}",
			success : function(resultText) {
				$('#loadData').html(resultText);
			},
			error : function() {
				alert("호출 실패 detailpage");
			}
		});
	}

	$(document).ready(function() {
		$('#viewLoading').hide();

		$('#viewLoading').ajaxStart(function() {
			$('#viewLoading').css('position', 'absolute');
			$('#viewLoading').css('left', $('#loadData').offset().left);
			$('#viewLoading').css('top', $('#loadData').offset().top);
			$('#viewLoading').css('width', $('#loadData').css('width'));
			$('#viewLoading').css('height', $('#loadData').css('height'));

			$(this).show();
		})
		$('img.interested').click(
						function() {
							if ("${id}" == "Guest") {
								alert("관심기업 등록 및 해지는 로그인 이후 사용이 가능합니다");
								return false;
							}

							if ($(this).attr('src') == '../resources/img/whiteheart2.png') {
								$(this).attr('src','../resources/img/colorheart2.png')
								$('#interestedText').html('포함')
								$('#interestedNum').html(parseInt($('#interestedNum').html()) + 1)
								$('span.nothing').load('regInter?cid='	+ $(this).attr('data-cid'))
							} else {
								$(this).attr('src','../resources/img/whiteheart2.png')
								$('#interestedText').html('외에')
								$('#interestedNum').html(parseInt($('#interestedNum').html()) - 1)
								$('span.nothing').load('canInter?cid='+ $(this).attr('data-cid'))
							}
						})

	$('form[action="review"]').submit(function(){
		if ($(this).find('input[type="text"]').val() == "") {
			alert("리뷰를 입력해주세요.");
			return false;
		} else {
			alert("리뷰가 등록되었습니다.");
		}
	});
	function addrep() {
		repform.submit();
	}
	})
</script>

<style type="text/css">
.mw_layer {
	display: none;
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	z-index: 10000;
	width: 100%;
	height: 100%
}

.mw_layer.open {
	display: block
}

.mw_layer .bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50)
}

#layer {
	position: absolute;
	top: 40%;
	left: 35%;
	width: 950px;
	height: 500px;
	margin: -150px 0 0 -194px;
	padding: 28px 28px 0 28px;
	border: 2px solid #555;
	background: #fff;
	font-size: 12px;
	font-family: Tahoma, Geneva, sans-serif;
	color: #767676;
	line-height: normal;
	white-space: normal
}
</style>

</head>
<body>
	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
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
									<!-- 버튼 클릭시 로딩 화면 5초/R작동, 결과출력 -->

									<a onClick="fLoadData()">
										<div id="loadData" style="width: 502px; height: 400px; margin-top: 20px; background: #EFEFEF; display: table;">
											<p class="pp">정보를 호출하시려면 클릭하세요</p>
										</div>
									</a>

									<!--  <div style="margin-top: 20px; display:inline;">
                              <input type="button" value="호출" onClick="fLoadData()" />
                           </div> -->
								</div>
							</div>

							<div class="c_info">

								<div class="c_head_name">
									<div class="c_heart">
										${id }님
										<c:if test="${isInterested=='T'}">
											<span id="interestedText">포함</span>
										</c:if>
										<c:if test="${isInterested=='F'}">
											<span id="interestedText">외에</span>
										</c:if>
										<span id="interestedNum">${ interTimes }</span>명의 관심기업
										<c:if test="${isInterested=='T'}">
											<img class="interested"
												src="../resources/img/colorheart2.png"
												data-cid="${company.cid}" />
										</c:if>
										<c:if test="${isInterested=='F'}">
											<img class="interested"
												src="../resources/img/whiteheart2.png"
												data-cid="${company.cid}" />
										</c:if>
									</div>
								</div>

								<!-- 상세 정보  들어가는 곳 -->
								<div class="c_information">
									<div class="c_logo">
										<img src="../resources/img/logos/${company.logo }">
									</div>
									<div class="c_content">
										<p class="c_group">기업명</p>
										<p class="c_gc">
											<!-- IT/웹/통신 -->
											${company.cname}
										</p>
									</div>

									<div class="c_content">
										<p class="c_group">산업군</p>
										<p class="c_gc">
											<!-- IT/웹/통신 -->
											${company.industry}
										</p>
									</div>
									<div class="c_content">
										<p class="c_group">사원수</p>
										<p class="c_gc">
											<!-- 2500명 -->
											${company.employee}명
										</p>
									</div>
									<div class="c_content">
										<p class="c_group">매출액</p>
										<p class="c_gc">
											<!-- 9248억 (2015) -->
											${company.sales}
										</p>
									</div>
									<div class="c_content1">
										<div class="c_group_div">
											<p class="c_group">본사</p>
										</div>
										<p class="c_gc1">
											<!-- 제주특별자치도 제주시 첨단로 242 -->
											${company.location}
										</p>
									</div>
								</div>
							</div>

							<div class="c_result">
								<!-- <p class="marks">"</p> -->
								<img src="../resources/img/marks1.png" class="marks">
								<p class="get">
									<c:if test="${company.dateGet=='T'}">
										<nobr>데이트</nobr>
									</c:if>
									<c:if test="${company.marryGet=='T'}">
										<nobr>결혼</nobr>
									</c:if>
									<c:if test="${company.babyGet=='T'}">
										<nobr>육아</nobr>
									</c:if>
									<c:if test="${company.houseGet=='T'}">
										<nobr>내집마련</nobr>
									</c:if>
									<c:if test="${company.relationGet=='T'}">
										<nobr>인간관계</nobr>
									</c:if>
									<c:if test="${company.dreamGet=='T'}">
										<nobr>꿈</nobr>
									</c:if>
									<c:if test="${company.hopeGet=='T'}">
										<nobr>희망</nobr>
									</c:if>
								</p>
								<p class="ex">을 득하고,</p>
								<p class="lose">
									<c:if test="${company.dateGet=='F'}">
										<nobr>데이트</nobr>
									</c:if>
									<c:if test="${company.marryGet=='F'}">
										<nobr>결혼</nobr>
									</c:if>
									<c:if test="${company.babyGet=='F'}">
										<nobr>육아</nobr>
									</c:if>
									<c:if test="${company.houseGet=='F'}">
										<nobr>내집마련</nobr>
									</c:if>
									<c:if test="${company.relationGet=='F'}">
										<nobr>인간관계</nobr>
									</c:if>
									<c:if test="${company.dreamGet=='F'}">
										<nobr>꿈</nobr>
									</c:if>
									<c:if test="${company.dateGet=='F'}">
										<nobr>희망</nobr>
									</c:if>
								</p>
								<p class="ex">를 포기하였습니다.</p>
								<!-- <p class="marks">"</p> -->
								<img src="../resources/img/marks2.png" class="marks">
							</div>

						</div>

					</div>
						

				<div class="reviewHolder">
					<p class="head_rv">
						<a href="#layer" onclick="openContent('${comapny.cid}')">리뷰</a>
					</p>

					<hr width="915px" color="#aaa" size="1" class="dt_hr">
					<br />
					

					<div class="c_review review_short">
					         총 리뷰 수 : ${fn:length(reviewList)} <button onclick="openContent('${comapny.cid}')">전체 리뷰 보기</button>
						<jsp:include page="../include/review_short_include.jsp"></jsp:include>
					</div>
					<div class="c_review">
						<form action="review" method="get">
							<div class="c_write">
								<input type="hidden" name="cid" value="${company.cid}">
								<input type="text" placeholder=" 리뷰 작성하기(50자 이내)" class="cr_write" maxlength="50" name="content"> <input type="submit"
									value="리뷰입력1" class="cr_btn">
							</div>
						</form>
					
					</div>


					<!-- light box -->

					<div class="mw_layer">

						<div class="bg"></div>

						<div id="layer" class="review_long">
							<%@ include file="/WEB-INF/views/include/review_long_include.jsp"%>
						</div>

					</div>






				</div>
				<div id="nothing"></div>
			</div>

		</div>
	</div>
	</div>


</body>
</html>