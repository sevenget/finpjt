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
		
		if (forms.userId.value == "" || forms.userId.value.length <= 3) {
			alert('아이디는 4글자 이상 입력해주세요.');
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
		
		if (forms.name.value == "" || forms.name.value.length <= 1) {
			alert('이름을 제대로 입력하세요.');
			forms.name.focus();
			return false;
		}
		if (!isNaN(Number(forms.name.value))) {
			alert('이름에 숫자를입력할 수 없습니다.')
			forms.name.value = "";
			forms.name.focus();
			return false;
		}
		
		if (forms.birth.value == "" || forms.birth.value.length != 6 ) {
			alert('생년월일을 제대로 입력하세요.');
			forms.birth.focus();
			return false;
		}
		if (isNaN(Number(forms.birth.value))) {
			alert('생년월일에 문자를 입력할 수 없습니다.')
			forms.birth.value = "";
			forms.birth.focus();
			return false;
		}
		
		if (forms.mail.value == "" || forms.mail.value.length <= 1) {
			alert('이메일 주소를 확인해주세요.');
			forms.mail.focus();
			return false;
		}
		
		

		var rank1 = $("#rank1").find("img").attr("id");
		var rank2 = $("#rank2").find("img").attr("id");
		var rank3 = $("#rank3").find("img").attr("id");
		var rank4 = $("#rank4").find("img").attr("id");
		var rank5 = $("#rank5").find("img").attr("id");
		var rank6 = $("#rank6").find("img").attr("id");
		var rank7 = $("#rank7").find("img").attr("id");
		
		$("#ranking1").val(rank1);
		$("#ranking2").val(rank2);
		$("#ranking3").val(rank3);
		$("#ranking4").val(rank4);
		$("#ranking5").val(rank5);
		$("#ranking6").val(rank6);
		$("#ranking7").val(rank7);
		
		/* alert("rank1 = "+rank1+"\nrank2 = "+rank2+"\nrank3 = "+rank3+"\nrank4 = "+rank4+"\nrank5 = "+rank5+"\nrank6 = "+rank6+"\nrank7 = "+rank7); */

		alert("rank1 = "+$("#ranking1").val()+"\nrank2 = "+$("#ranking2").val()+"\nrank3 = "+$("#ranking3").val()+"\nrank4 = "+$("#ranking4").val()+"\nrank5 = "+$("#ranking5").val()+"\nrank6 = "+$("#ranking6").val()+"\nrank7 = "+$("#ranking7").val());
		if(rank1 == null || rank2 == null || rank3 == null || rank4 == null || rank5 == null || rank6 == null || rank7 == null){
			alert("7가지 중요도 선정을 해주세요.");
			return false;
		}
		
		return true;
		
	}
	
	function checkId() {
		var forms = document.getElementById("form_1");
		var id = forms.userId.value;
		var url = "./checkID?userId=" + forms.userId.value;

		if (id.length <= 2) {
			alert('아이디는 4글자 이상 입력해주세요.');
			forms.userId.focus();
			return false;
		}
		window.open(url, "ID_Check"," location=no,toolbar=no,status=no,menubar=no,top=150,left=150"
						+ "scrollbars=no,resizable=no,width=400,height=200");
	}
	
</script>


	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
	</div>		

	<div id="all">
		<div id="contect">
	<form id="form_1" name="form_1" action="" method="get" onsubmit="return check()">
		<!-- 여기 안에다 작업하시면 돼요 -->	
			<div class="container2">
				<div id="regiHead">
					<h3 id="header">칠득에 오신것을 환영합니다.</h3>
				</div>
				<div id="regiMain1">
					<h3 align="center">필수 기입란</h3><hr id="line1" width="500px" color="#aaa" size="1" class="hr">
					
				
					
					<table class="table_abs" >
						<tr>
							<td>아이디</td>
							<td class="input_td"><input id="userId" name="userId" class="table_input" type="text" placeholder="아이디(4자 이상)"></td>
							<td class="" ><input type="button" value="중복확인"
													onclick="checkId(this.form)"></td>
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
							<td>이름</td>
							<td class="input_td"><input id="name" name="name" class="table_input" type="text" placeholder="이름"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td class="input_td"><input id="birth" name="birth" class="table_input" type="text" placeholder="생년월일(예시. 920101)" maxlength="6"></td>
						</tr>
						<tr>
							<td>주 소</td>
							<td class="input_td"><input id="addr" name="addr" class="table_input" type="text" placeholder="주소 입력"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td class="input_td"><input id="mail" name="mail" class="table_input" type="email" placeholder="이메일"></td>
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
					
					<script>
						function checking(id){
							var id = document.getElementById(id);
							id.attr("style","backgound-color:red;");
						}
					</script>
					
				</div>
				
				<div id="regiMain2">
					<h3 align="center">7가지 중요도 점수 매칭</h3><hr id="line1" width="500px" color="#aaa" size="1" class="hr">
					<div>
						<div>
							<img src="../resources/img/dream.jpg">
							<table>
								<tr>
									<td>
										<input id="dream1" name="dream" type="radio" value="1" checked="checked"
										onchange="checking(this);">1
									</td>
									<td><input id="dream2" name="dream" type="radio" value="2">2
									<td><input id="dream3" name="dream" type="radio" value="3">3
									<td><input id="dream4" name="dream" type="radio" value="4">4
									<td><input id="dream5" name="dream" type="radio" value="5">5
									<td><input id="dream6" name="dream" type="radio" value="6">6
									<td><input id="dream7" name="dream" type="radio" value="7">7
									<td><input id="dream8" name="dream" type="radio" value="8">8
									<td><input id="dream9" name="dream" type="radio" value="9">9
									<td><input id="dream10" name="dream" type="radio" value="10">10
								</td>
							</table>
						</div>
						<div>
							<input type="hidden" name="rank2"><img src="../resources/img/marry.jpg">
						</div>
						<div>
							<input type="hidden" name="rank3"><img src="../resources/img/love.jpg">
						</div>
						<div>
							<input type="hidden" name="rank4"><img src="../resources/img/human.jpg">
						</div>
						<div>
							<input type="hidden" name="rank5"><img src="../resources/img/home.jpg">
						</div>
						<div>
							<input type="hidden" name="rank6"><img src="../resources/img/job.jpg">
						</div>
						<div>
							<input type="hidden" name="rank7"><img src="../resources/img/child.jpg">
						</div>
					</div>
					<!-- 7가지 선택사항 -->
					
					
					
				</div>
				
			
		</div>
</form>
	</div>


</body>
</html>
