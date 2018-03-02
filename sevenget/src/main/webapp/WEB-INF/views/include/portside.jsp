<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/mypage_portside.css" media="all"> <!-- 이거 css명 작업하시는 css 파일명으로 바꾸세요 안 그럼 저랑 꼬여요..!  -->
<title>Insert title here</title>
<script type="text/javascript">
	function find_id() {
		window.open("http://www.jobkorea.co.kr/", "_blank");
	}
</script>

</head>
<body>
	
	<div id="portside">
	
	<div id="portside1">
		
		<div class="info">
			<p class="head_member" align="center">회원 정보</p>
			<hr width="285px" color="#aaa" size="1" class="hr">
		
			<div class="ficture"> 
				<c:forEach items="${member}" var="mem" >
					<img style="width:135px; height:180px;" src="../resources/img/memPicture/${mem.picture}">
				</c:forEach>   
			</div>
		
			<div class="membership">
				<c:forEach items="${member}" var="iid" >
				
				<p class="font"> ${iid.id}</p>
				<p class="font"> ${iid.name}</p>
				<p class="font"> ${iid.birth}</p>
				<c:set var="gender" value="${iid.gender}"></c:set>
				<c:choose>
					<c:when test="${gender eq 'M'}">
						<p class="font">남자</p>
					</c:when>
					<c:otherwise>
						<p class="font">여자</p>
					</c:otherwise>
				</c:choose>
				<p class="font"> ${iid.address}</p>			 
				</c:forEach>
				<input type="button" value="정보 수정" onclick="location.href='${path}/seven/main/update'">
			</div>
		</div>
		<div><!-- 관심 분야 점수 -->
			<p class="head_member1" align="center" >관심 분야 점수</p>
			<hr width="285px" color="#aaa" size="1" class="hr">
			
			<div class="ins_div">
				<div class="ins_p"><p class="ml">연애</p></div>
				<div class="ins_p"><p class="ml">결혼</p></div>
				<div class="ins_p"><p class="ml">출산</p></div>
				<div class="ins_p"><p>내집마련</p></div>
				<div class="ins_p"><p>인간관계</p></div>
				<div class="ins_p"><p class="ml2">꿈</p></div>
				<div class="ins_p"><p>희망직업</p></div>
			</div>
			
			<!-- <h3 align="center" style="margin-top: 5px; margin-bottom: 5px;">관심 분야 점수</h3> -->
			<%-- <c:forEach items="${member}" var="iid" >
			<img style="width:60px; height: 60px; margin-top: 5px; margin-left:25px; float: left;" src="../resources/img/date1.jpg">  <h2 class="font" style=" float: left; margin-right: 80px; margin-top: 15px; margin-bottom: 0px;"> ${iid.dateCon}</h2>
			<img style="width:60px; height: 60px; margin-top: 5px; float: left;" src="../resources/img/marry1.jpg"><h2 class="font"> ${iid.marryCon}</h2><br>
			<img style="width:60px; height: 60px; margin-top: 5px; margin-left:25px; float: left;" src="../resources/img/baby1.jpg"><h2 class="font" style=" float: left; margin-right: 80px; margin-top: 15px; margin-bottom: 0px;"> ${iid.babyCon}</h2>
			<img style="width:60px; height: 60px; margin-top: 5px; float: left;" src="../resources/img/house1.jpg"><h2 class="font"> ${iid.houseCon}</h2><br>
			<img style="width:60px; height: 60px; margin-top: 5px; margin-left:25px; float: left;" src="../resources/img/relation1.jpg"><h2 class="font" style=" float: left; margin-right: 80px; margin-top: 15px; margin-bottom: 0px;"> ${iid.relationCon}</h2>
			<img style="width:60px; height: 60px; margin-top: 5px; float: left;" src="../resources/img/dream1.jpg"><h2 class="font"> ${iid.dreamCon}</h2><br>
			<img style="width:60px; height: 60px; margin-top: 5px; margin-left:25px; float: left;" src="../resources/img/hope1.png"><h2 class="font" style=" float: left; margin-right: 80px; margin-top: 15px; margin-bottom: 0px;"> ${iid.hopeCon}</h2>
			</c:forEach>   --%>
		</div>
		
	</div> 	
	
<!-- 	<div id="portside2"> 
		<div class="ad1">
			<a href="void(0);" onclick="alert('준비 중입니다.');return false;"><img src="../resources/img/ad1.png"></a>
		</div>
	</div> -->
	
	<div id="portside2"> 
		<div class="ad2">
			<a href="void(0);" onclick="alert('준비 중입니다.');return false;"><img src="../resources/img/ad2.png"></a>
		</div>
	</div>
	
	<div id="portside2"> 
		<div class="ad3">
			<a onclick="find_id();"><img src="../resources/img/ad33.png"></a>
	</div>
	
	</div>
	
	</div>

</body>
</html>