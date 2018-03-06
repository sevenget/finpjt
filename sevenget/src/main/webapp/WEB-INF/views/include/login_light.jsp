<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
		jQuery(function($) {
			
		var layerWindow = $('.mw_login');

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
		
	$(function() {
		$('.login_button').click(function() {
			$('.mw_login').addClass('open');
		})
	});
</script>

<style>
.mw_login {
	display: none;
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	z-index: 10000;
	width: 100%;
	height: 100%
}

.mw_login.open {
	display: block
}

.mw_login .bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50)
}

#layer3 {
	position: absolute;
	top: 40%;
	left: 38%;
	width: 800px;
	height: 430px;
	margin: -150px 0 0 -194px;
	padding: 28px 28px 0 28px;
	border: 2px solid #555;
	background: #ebecee;
	font-size: 18px;
	font-family: Tahoma, Geneva, sans-serif;
	color: #767676;
	line-height: normal;
	white-space: normal;
	text-align:center;
}
</style>


</head>
<body>
	<div class="mw_login">
		<div class="bg"></div>
		<form id="login_form" class="login1" action="loginCheck">
			<table class="login">
				<tr>
					<td><input id="id" name="id" type="text" placeholder="아이디"></td>
					<td rowspan=2><input id="login" type="submit" value="로그인"></td>
				</tr>
				<tr>
					<td><input id="pw" name="pw" type="password"
						placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td colspan="2"><button id="facebook"
							onclick="alert('준비중'); return false;">
							<img src="../resources/img/f.png" class="face_logo">페이스북
							아이디로 로그인
						</button></td>
				</tr>
				<tr>
					<td colspan="2"><button id="guest"
							onclick="location.href='loginCheck?id=Guest&pw=Guest'; return false;">
							비로그인으로 둘러보기</button></td>
				</tr>
				<tr>
					<td colspan="2"><button id="submit"
							onclick="location.href='register'; return false;">회원가입</button></td>
					<!-- 회원가입 버튼 누르면 회원가입페이지로 넘어가게 수정 완료. -->
				</tr>
			</table>
		</form>
	</div>
</body>
</html>