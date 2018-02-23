<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = null;
	if(session.getAttribute("id") != null){
	id = (String)session.getAttribute("id");
	}
	System.out.println(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7get</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/session.css" media="all"> -->
</head>
<body>

	<div id="wrap">

		<header id="top">

			<div class="container1">

				<div class="title">
					<a href="main"><img src="../resources/img/logo.png" /></a>
				</div>

				<div class="top_left">
					<a href="main">검색</a> <div></div>
					<a href="void(0);" onclick="alert('준비 중입니다.');return false;">Q&A</a> <div></div>
				</div>	
				
				<%if(id == null){ %>
 				<div class="top_right">
					<a href="login">로그인</a> <div></div> 
					<a href="#" onclick="alert('로그인 해주세요.'); return false;">MyPage</a> <div></div>
				</div>	
			 	<%}else{ %>
				<div class="top_right">
					<a href="logOut">로그아웃</a> <div></div> 
					<a href="mypage" onclick="">MyPage</a> <div></div>
				</div>
				<%} %>
			 

			</div>

		</header>

	</div>

</body>
</html>
