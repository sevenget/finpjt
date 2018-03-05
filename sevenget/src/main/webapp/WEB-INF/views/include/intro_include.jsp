<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<script type="text/javascript">
		jQuery(function($) {
			
		var layerWindow = $('.mw_layer2');

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
		$('.intro_getloss').click(function() {
			$('.mw_layer2').addClass('open');
		})
	});
</script>
<style>
.mw_layer2 {
	display: none;
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	z-index: 10000;
	width: 100%;
	height: 100%
}

.mw_layer2.open {
	display: block
}

.mw_layer2 .bg {
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

	<div class="mw_layer2">
		<div class="bg"></div>
	
		<div id="layer">
			전문가 평가와 임직원 및 일반 이용자 평가를 분석해 7가지 지표를 <br>각 항목 별로 10점 만점 기준의 점수가 부여됩니다.
			<h3>
			<br>
			이 점수를 직관적으로 이해하실 수 있도록 <br>
			7점 이상은 <b>얻을 가능성이 높다는 의미에서 <span  style="color:#654ea3">'득'</span></b>으로,<br>
			4점 미만은 <b>포기해야 할 가능성이 높다는 의미에서<span  style="color:#654ea3"> '포'</span></b><br>
			로 표시하였습니다.
			</h2>
			
								- 예시 -<br>
			7Get 회사의 연애가 득이라면 연애 점수가 7점 이상으로서 다녔을 때 <br>
			연애를 하고 있었다면 더 잘할 수 있고, <b>연인이 없었다면 생길 가능성</b>이 높다는 것을 의미합니다.
		
			<br>
			<br>
			연애가 포라면 연애 점수가 4점 미만이며 다녔을 때 <br><b>있었던 연인과도 헤어질 가능성</b>이 높고 새로운 사람을 만날 가능성 또한 낮다는 의미입니다.
			<br>
			<br>
		</div>
		
		


	</div>

</body>
</html>