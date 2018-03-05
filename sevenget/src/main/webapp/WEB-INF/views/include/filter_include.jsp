<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<c:forEach items="${filterMap}" var="filter">
<script>
	$(function(){
		
		if($('td[name=${filter.key}]').attr('data-get')=='F'){
			$('td[name=${filter.key}]').attr('data-get', '${filter.value}')
			if('${filter.value}'=='T'){
				$('td[name=${filter.key}]').css('background-color', '#8772bf');
				$('td.filter').append('<input type="hidden" name= ${filter.key} value="T"/>');
				if(parseInt($('span.filter_apply').html())<14)
					$('span.filter_apply').html(parseInt($('span.filter_apply').html())+1)
			}
			
		} else if($('td[name=${filter.key}]').attr('data-loss')=='F'){
			$('td[name=${filter.key}]').attr('data-loss', '${filter.value}')
			if('${filter.value}'=='T'){
				$('td[name=${filter.key}]').css('background-color', '#8772bf');
				$('td.filter').append('<input type="hidden" name= ${filter.key} value="X"/>');
				if(parseInt($('span.filter_apply').html())<14)
					$('span.filter_apply').html(parseInt($('span.filter_apply').html())+1)
			}
		}
	})
</script>
</c:forEach>

<script type="text/javascript">
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

	$(function() {
		$('td').click(function() {
			if ($(this).attr('data-get') == "F") {
				$(this).css('background-color', '#8772bf');
				$(this).attr('data-get', "T")
				$('td.filter').append('<input type="hidden" name='+$(this).attr('name')+' value="T"/>');
				if(parseInt($('span.filter_apply').html())<14)
					$('span.filter_apply').html(parseInt($('span.filter_apply').html())+1)
			} else if ($(this).attr('data-loss') == "F") {
				$(this).css('background-color', '#8772bf');
				$(this).attr('data-loss', "T")
				$('td.filter').append('<input type="hidden" name='+$(this).attr('name')+' value="X"/>');
				if(parseInt($('span.filter_apply').html())<14)
					$('span.filter_apply').html(parseInt($('span.filter_apply').html())+1)
			} else if ($(this).attr('data-get') == "T") {
				$(this).css('background-color', '#a4a4a4');
				$(this).attr('data-get', "F")
				$('td.filter').children('input[name='+$(this).attr('name')+']').remove()
				if(parseInt($('span.filter_apply').html())>0)
					$('span.filter_apply').html(parseInt($('span.filter_apply').html())-1)
			} else if ($(this).attr('data-loss') == "T") {
				$(this).css('background-color', '#a4a4a4');
				$(this).attr('data-loss', "F")
				$('td.filter').children('input[name='+$(this).attr('name')+']').remove()
				if(parseInt($('span.filter_apply').html())>0)
					$('span.filter_apply').html(parseInt($('span.filter_apply').html())-1)
			}
		})

		$('.filter').click(function() {
			$('.mw_layer').addClass('open');
		})
	});
</script>
<style>
table.search_filter {
	margin: 5px auto !important;
	width: 700px !important;
	height: 60px !important;
	border-radius: 3px;
	text-align: center;
	margin-top: 10px;
	color: white;
}

table.search_filter th {
	width: 140px;
	background-color: #654ea3;
	margin-right:5px;
}

table.search_filter td {
	border-radius: 2px;
	width: 80px;
	background-color: #a4a4a4;
}

table.search_filter td:last-child{
	background-color: #ebecee;
	color:#654ea3;
	font-size:2em;
}

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
	left: 38%;
	width: 800px;
	height: 380px;
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

	<div class="mw_layer">
		<div class="bg"></div>

		<div id="layer">
			<table class="search_filter">
				<tr>
					<th>이건 꼭 득</th>
					<td data-get="F" name="dateget" >연애</td>
					<td data-get="F" name="marryget">결혼</td>
					<td data-get="F" name="babyget">육아</td>
					<td data-get="F" name="houseget">내집마련</td>
					<td data-get="F" name="relationget">인간관계</td>
					<td data-get="F" name="dreamget">꿈</td>
					<td data-get="F" name="hopeget">희망</td>
					<td style="background-color:none;"><b>>7점</b></td>
				</tr>
			</table>
			<table class="search_filter">
				<tr>
					<th>이건 포기 못 해</th>
					<td data-loss="F" name="dateloss">연애</td>
					<td data-loss="F" name="marryloss">결혼</td>
					<td data-loss="F" name="babyloss">육아</td>
					<td data-loss="F" name="houseloss">내집마련</td>
					<td data-loss="F" name="relationloss">인간관계</td>
					<td data-loss="F" name="dreamloss">꿈</td>
					<td data-loss="F" name="hopeloss">희망</td>
					<td><b>>4점</b></td>
				</tr>
			</table>
		<br>
			<b>- 예시 -</b><br><br>
			꿈, 희망, 내집마련 등 다른 것을 포기하더라도 반드시 연애를 하고 싶다면 <br><b style="color:#654ea3">'이건 꼭 득'</b>에서 연애를 클릭하시면 됩니다.
		<br>
		<br>
			연애가 다른 것을 포기할 정도는 아니지만 없으면 안돼라는 분은 <br><b style="color:#654ea3">'이건 포기 못해'</b>에서 연애를 클릭하시면 됩니다.
		</div>
		
		


	</div>

</body>
</html>