<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seven Get Main</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" type="text/css" href="../resources/css/login.css" media="all">
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>
</head>
<body>


	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
	</div>		

	<div id="all">
		<div id="contect">
	
		<!-- 여기 안에다 작업하시면 돼요 -->	
			<div class="container2">
				<div id="regiHead">
					
				</div>
				<div id="regiMain">
					<form class="login" action="register">
							<table class="login">
								<tr>
									<td><input id="id" type="text" placeholder="아이디"></td>
									<td rowspan=2><input id="login" type="button" value="로그인"
										onClick="location.href='main';"></td>
									<!-- 일단 로그인 버튼 누르면 무조건 메인페이지로 이동하게 만들어뒀어요!! -->
								</tr>
								<tr>
									<td><input id="pw" type="text" placeholder="비밀번호"></td>
								</tr>
								<tr>
									<td colspan="2"><button id="facebook" onclick="alert('준비중'); return false;">
											<img src="../resources/img/f.png" class="face_logo">페이스북
											아이디로 로그인
										</button></td>
								</tr>
								<tr>
									<td colspan="2"><button id="guest" onclick="alert('손님'); return false;">
											비로그인으로 둘러보기</button></td>
								</tr>
								<tr>
									<td colspan="2"><button id="submit">회원가입</button></td>
									<!-- 회원가입 버튼 누르면 회원가입페이지로 넘어가게 수정 완료. -->
								</tr>
							</table>

					</form>
				</div>
			</div>

		</div>      
	</div>



</body>
</html>