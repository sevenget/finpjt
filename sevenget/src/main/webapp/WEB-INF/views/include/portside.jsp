<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/portside.css" media="all"> <!-- 이거 css명 작업하시는 css 파일명으로 바꾸세요 안 그럼 저랑 꼬여요..!  -->
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
			<p class="head_member">회원 정보</p>
			<hr width="285px" color="#aaa" size="1" class="hr">
		
			<div class="ficture">
				사진  
			</div>
		
			<div class="membership">
<<<<<<< HEAD
				<c:forEach items="${id}" var="iid" >
					<p class="font">${iid.id}</p><br>
				<p class="font">${iid.name }</p>
				<p class="font">${iid.birth }</p>
				<p class="font">${iid.email }</p>
				</c:forEach>  
=======
				<p>홍길동</p><br>
				<p class="font">1990/02/10</p>
				<p class="font">쾌도대학교 졸업</p>			
>>>>>>> branch 'master' of https://github.com/sevenget/finpjt.git
			</div>
		</div>
	</div> 	
	
	<div id="portside2"> 
		<div class="ad1">
			<a href="void(0);" onclick="alert('준비 중입니다.');return false;"><img src="../resources/img/ad1.png"></a>
		</div>
	</div>
	
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
	
	<div id="portside2"> 
		<div class="ad4">
			<a href="#"><img src="../resources/img/ad4.png"></a>
		</div>
	</div>
	
	
	</div>

</body>
</html>