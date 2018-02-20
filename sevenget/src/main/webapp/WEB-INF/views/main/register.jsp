<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seven Get Register</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all">
<link rel="stylesheet" type="text/css" href="../resources/css/register.css" media="all">
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>
</head>
<body>

<script type="text/javascript">
	/* 이미지 드래그 앤 드랍 */

	function allowDrop(ev){
		ev.preventDefault();
	}
	
	function drag(ev){
		ev.dataTransfer.setData("content", ev.target.id);
	}
	
	function drop(ev,id){
		if(null == $(id).find("img").attr("src")){
			ev.preventDefault();
			var image = ev.dataTransfer.getData("content");
			ev.target.appendChild(document.getElementById(image));
		}else{
			alert("겹쳐지기X");
		}
	}
	/* --------------------------------------------------------------------------- */
	
	/* 회원가입 유효성 검사 */
	function check() {
		var forms = document.getElementById("form_1");
		
		if (forms.name.value == "" || forms.name.value.length <= 1) {
			alert('이름을 제대로 입력하세요.');
			forms.id.focus();
			return false;
		}
		
		if (forms.birth.value == "" || forms.birth.value.length != 6 ) {
			alert('생년월일을 제대로 입력하세요.');
			forms.birth.focus();
			return false;
		}
		
		if (forms.mail.value == "" || forms.mail.value.length <= 1) {
			alert('이메일 주소를 확인해주세요.');
			forms.mail.focus();
			return false;
		}
		
		if (forms.userId.value == "" || forms.userId.value.length <= 5) {
			alert('아이디는 6글자 이상 입력해주세요.');
			forms.userId.focus();
			return false;
		}

		if (forms.pw.value == "" || forms.pw.value.length <= 7) {
			alert('비밀번호는 8글자 이상 입력해주세요.');
			forms.pw.focus();
			return false;
		} else if (forms.pw.value != forms.pwc.value) {
			alert('비밀번호를 다시 확인하세요.');
			forms.pwc.focus();
			return false;
		}

		var rank1 = $("#rank1").find("img").attr("id");
		var rank2 = $("#rank2").find("img").attr("id");
		var rank3 = $("#rank3").find("img").attr("id");
		var rank4 = $("#rank4").find("img").attr("id");
		var rank5 = $("#rank5").find("img").attr("id");
		var rank6 = $("#rank6").find("img").attr("id");
		var rank7 = $("#rank7").find("img").attr("id");
		
		/* alert("rank1 = "+rank1+"\nrank2 = "+rank2+"\nrank3 = "+rank3+"\nrank4 = "+rank4+"\nrank5 = "+rank5+"\nrank6 = "+rank6+"\nrank7 = "+rank7); */

		if(rank1 == null || rank2 == null || rank3 == null || rank4 == null || rank5 == null || rank6 == null || rank7 == null){
			alert("7가지 중요도 선정을 해주세요.");
			return false;
		}
		
		return true;
	}
	
</script>


	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
	</div>		

	<div id="all">
		<div id="contect">
	
		<!-- 여기 안에다 작업하시면 돼요 -->	
			<div class="container2">
				<div id="regiHead">
					<h3 id="header">칠득에 오신것을 환영합니다.</h3>
				</div>
				<div id="regiMain1">
					<h3 align="center">필수 기입란</h3><hr id="line1" width="500px" color="#aaa" size="1" class="hr">
					
				<form id="form_1" name="form_1" action="" method="get" onsubmit="return check()">
					
					<table class="table_abs" >
						<tr>
							<td>이름</td>
							<td class="input_td"><input id="name" name="name" class="table_input" type="text" placeholder="이름"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td class="input_td"><input id="birth" name="birth" class="table_input" type="text" placeholder="생년월일(예시. 920101)" maxlength="6"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td class="input_td"><input id="mail" name="mail" class="table_input" type="email" placeholder="이메일"></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td class="input_td"><input id="userId" name="userId" class="table_input" type="text" placeholder="아이디(6자 이상)"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td class="input_td"><input id="pw" name="pw" class="table_input" type="password" placeholder="비밀번호(8자 이상)"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td class="input_td"><input id="pwc" name="pwc" class="table_input" type="password" placeholder="비밀번호 확인"></td>
						</tr>
						<tr>
							<td colspan="2"><input id="submit" class="table_input" type="submit" value="회원가입"></td>
						</tr>
						<tr>
							<th colspan="2"><span>또는</span></th>
						</tr>
						<tr>
							<td colspan="2"><button id="facebook" class="table_input" onclick="alert('준비중');">페이스북으로 1초만에 가입</button></td>
						</tr>
					</table>
					
					</form>
					
				</div>
				
				<div id="regiMain2">
					<h3 align="center">7가지 중요도 선정(부가 기입란)</h3><hr id="line1" width="500px" color="#aaa" size="1" class="hr">
					<div id="rankTable" style="position: absolute; top:31%;">
						<form id="form_2" action="">
							<div id="rank1" class="rank" ondrop="drop(event,this)" ondragover="allowDrop(event)"><span class="rank_by">1순위</span></div>
							<div id="rank2" class="rank" ondrop="drop(event,this)" ondragover="allowDrop(event)"><span class="rank_by">2순위</span></div>
							<div id="rank3" class="rank" ondrop="drop(event,this)" ondragover="allowDrop(event)"><span class="rank_by">3순위</span></div>
	
							<div id="rank4" class="rank" ondrop="drop(event,this)" ondragover="allowDrop(event)"><span class="rank_by">4순위</span></div>
							<div id="rank5" class="rank" ondrop="drop(event,this)" ondragover="allowDrop(event)"><span class="rank_by">5순위</span></div>
							<div id="rank6" class="rank" ondrop="drop(event,this)" ondragover="allowDrop(event)"><span class="rank_by">6순위</span></div>
							<div id="rank7" class="rank" ondrop="drop(event,this)" ondragover="allowDrop(event)"><span class="rank_by">7순위</span></div>
						</form>
					</div>
					
					<!-- 7가지 선택사항 -->
					
					<div id="choose" style="position: absolute; top:65%;">
						<div class="box" id="box1" ondrop="drop(event,this)" ondragover="allowDrop(event)">
							<img id="job" class="logo" src="../resources/img/job.jpg" draggable="true" ondragstart="drag(event)">
						</div>

						<div class="box" id="box2" ondrop="drop(event,this)" ondragover="allowDrop(event)">
							<img id="love" class="logo" src="../resources/img/love.jpg" draggable="true" ondragstart="drag(event)">
						</div>

						<div class="box" id="box3" ondrop="drop(event,this)" ondragover="allowDrop(event)">
							<img id="home" class="logo" src="../resources/img/home.jpg" draggable="true" ondragstart="drag(event)">
						</div>

						<div class="box" id="box4" ondrop="drop(event,this)" ondragover="allowDrop(event)">
							<img id="dream" class="logo" src="../resources/img/dream.jpg" draggable="true" ondragstart="drag(event)">
						</div>

						<div class="box" id="box5" ondrop="drop(event,this)" ondragover="allowDrop(event)">
							<img id="human" class="logo" src="../resources/img/human.jpg" draggable="true" ondragstart="drag(event)">
						</div>

						<div class="box" id="box6" ondrop="drop(event,this)" ondragover="allowDrop(event)">
							<img id="child" class="logo" src="../resources/img/child.jpg" draggable="true" ondragstart="drag(event)">
						</div>

						<div class="box" id="box7" ondrop="drop(event,this)" ondragover="allowDrop(event)">
							<img id="marry" class="logo" src="../resources/img/marry.jpg" draggable="true" ondragstart="drag(event)">
						</div>
					</div>
				</div>
				
			
		</div>
	</div>


</body>
</html>
