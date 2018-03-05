<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7Get - Register</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all">
<link rel="stylesheet" type="text/css" href="../resources/css/register.css?ver=1" media="all">
<link rel="stylesheet" type="text/css" href="../resources/css/score.css" media="all">
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>
</head>
<body>


<script type="text/javascript">
	/* 이미지 드래그 앤 드랍 */

	/* function allowDrop(ev){
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
	} */
	
	/* --------------------------------------------------------------------------- */
	
	/* 회원가입 유효성 검사 */
	 function check() {
		var forms = document.getElementById("form_1");
		
		if (forms.id.value == "" || forms.id.value.length <= 3) {
			alert('아이디는 4글자 이상 입력해주세요.');
			forms.id.focus();
			return false;
		}

		if (forms.password.value == "" || forms.password.value.length <= 7) {
			alert('비밀번호는 8글자 이상 입력해주세요.');
			forms.password.focus();
			return false;
		} else if (forms.password.value != forms.pwc.value) {
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
		
		if (forms.email.value == "" || forms.email.value.length <= 1) {
			alert('이메일 주소를 확인해주세요.');
			forms.email.focus();
			return false;
		}
		
		/* var url = "./insertUser?id="+forms.id.value
		+"&password="+forms.password.value
		+"&name="+forms.name.value
		+"&birth="+forms.birth.value
		+"&gender="+forms.gender.value
		+"&address="+forms.address.value
		+"&email="+forms.email.value
		+"&dream="+forms.dream.value
		+"&love="+forms.love.value
		+"&marry="+forms.marry.value
		+"&human="+forms.human.value
		+"&child="+forms.child.value
		+"&home="+forms.home.value
		+"&job="+forms.job.value;
		
		location.href=url; */
		return true;
		
	} 
	/* 아이디 중복확인 */
 	function checkId() {
		var forms = document.getElementById("form_1");
		var id = forms.id.value;
		var url = "./checkID?id=" + forms.id.value;

		if (id.length <= 2) {
			alert('아이디는 4글자 이상 입력해주세요.');
			forms.id.focus();
			return false;
		}
		window.open(url, "ID_Check"," location=no,toolbar=no,status=no,menubar=no,top=150,left=150"
						+ "scrollbars=no,resizable=no,width=400,height=200");
	} 
	/* ---------------------------------------------------------------------------------------  */
	
	
		/* $(val).parent().css('background-color', '#8772bf'); */
		/* $(this).parent().css('background-color', '#8772bf');
		$("input[type=radio]:not(:checked)").css('background-color', '#a4a4a4'); */
		 
		$(document).ready(function() {
			  $("input[type=radio]").click(function() {
			    // Get the storedValue
			    var previousValue = $(this).data('storedValue');
			    // if previousValue = true then
			    //     Step 1: toggle radio button check mark.
			    //     Step 2: save data-StoredValue as false to indicate radio button is unchecked.
			    if (previousValue) {
			      $(this).prop('checked', !previousValue);
			      $(this).data('storedValue', !previousValue);
			    }
			    // If previousValue is other than true
			    //    Step 1: save data-StoredValue as true to for currently checked radio button.
			    //    Step 2: save data-StoredValue as false for all non-checked radio buttons.
			    else{
			      $(this).data('storedValue', true);
			      $(this).parent().css('background-color', '#8772bf');
			      $("input[type=radio]:not(:checked)").data("storedValue", false);
			      $("input[type=radio]:not(:checked)").parent().css('background-color', 'white'); 
			    }
			  });
			});
		
</script>


	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
	</div>		

	<div id="all">
		<div id="contect">
	<form id="form_1" name="form_1" action="insertUser" method="post" onsubmit="return check()">
		<!-- 여기 안에다 작업하시면 돼요 -->	
			<div class="container2">
				<div id="regiHead">
					<h3 id="header">칠득에 오신 것을 환영합니다.</h3>
				</div>
				
				<div id="regiMain1">
					<!-- <h3 align="center">회원정보 기입란</h3> -->
					<p class="regi_head">회원정보 기입란</p>
					<hr id="line1" width="500px" color="#aaa" size="1" class="hr">
					
				
					<!--  테이블 1-->
					<table class="table_abs" >
						<tr>
							<td>아이디</td>
							<td class="input_td"><input id="id" name="id" class="table_input" type="text" placeholder="  아이디(4자 이상)"></td>
							<td class="" ><input type="button" value="중복확인"
													onclick="checkId(this.form)" class="overlap_btn"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td class="input_td"><input id="password" name="password" class="table_input" type="password" placeholder=" 비밀번호(8자 이상)"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td class="input_td"><input id="pwc" name="pwc" class="table_input" type="password" placeholder=" 비밀번호 확인"></td>
						</tr>
					
						<tr>
							<td>이름</td>
							<td class="input_td"><input id="name" name="name" class="table_input" type="text" placeholder=" 이름"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td class="input_td"><input id="birth" name="birth" class="table_input" type="text" placeholder=" 생년월일(예시. 920101)" maxlength="6"></td>
						</tr>	
						<tr>
							<td>성 별</td>
							<td class="input_td">
								<select name="gender" style="width:100px;height:30px;" class="selectbox">
									<option value="M">남자
									<option value="F">여자
								</select>
							</td>
						</tr>
						<tr>
							<td>주 소</td>
							<td class="input_td"><input id="address" name="address" class="table_input" type="text" placeholder=" 주소 입력"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td class="input_td"><input id="email" name="email" class="table_input" type="text" placeholder=" 이메일(예시. abc@naver.com)"></td>
						</tr>
					</table>	
						
						<div class="r_btn_div1">
							<input id="submit" class="table_input" type="submit" value="회원가입">
						</div>
						
						<div class="r_btn_div2"><p class="p_or">또는</p></div>
						
						<div class="r_btn_div3">
							<button id="facebook" class="table_input" onclick="alert('준비중');"><img src="../resources/img/f.png" class="face_logo1">페이스북으로 1초만에 가입</button>
						</div>
					
					<!--  테이블 1-->
					
				</div>
				
				
		
		<div id="regiMain2">
					<!-- <h3 align="center">7가지 중요도 점수 매칭</h3> -->
					<p class="regi_head2">7가지 중요도 점수 매칭</p>
					<hr id="line1" width="500px" color="#aaa" size="1" class="hr">
		
		<div class="score_hd">
			<p class="score_head">(점수)</p>
		</div>
		<div class="mw_layer">
		<!-- <div class="bg"></div> -->

		
		<div id="layer">
		
		<!--  테이블 2-8-->
			<!-- <table class="table table_dateCon">
				<tr>
					<th><img src="../resources/img/love.jpg"></th>
					<td style="background-color:#8772bf"><input name="dateCon" type="radio" value="1" checked="checked">1점</td>
					<td><input name="dateCon" type="radio" value="2">2점</td>
					<td><input name="dateCon" type="radio" value="3">3점</td>
					<td><input name="dateCon" type="radio" value="4">4점</td>
					<td><input name="dateCon" type="radio" value="5">5점</td>
					<td><input name="dateCon" type="radio" value="6">6점</td>
					<td><input name="dateCon" type="radio" value="7">7점</td>
					<td><input name="dateCon" type="radio" value="8">8점</td>
					<td><input name="dateCon" type="radio" value="9">9점</td>
					<td><input name="dateCon" type="radio" value="10">10점</td>
				</tr>
			</table> -->
			
			<div id="sc_div">
			
				<div class="check-colours">

					<div>
						<input  class="check-colour" name="dateCon" type="radio" value="1" checked="checked" id="d1">
						<label class="check-colour sc" for="d1"><p class="sc_num">1</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="dateCon" type="radio" value="2" id="d2">
						<label class="check-colour sc" for="d2"><p class="sc_num">2</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="dateCon" type="radio" value="3" id="d3">
						<label class="check-colour sc" for="d3"><p class="sc_num">3</p></label>
					</div>
						
					<div>	
						<input class="check-colour" name="dateCon" type="radio" value="4" id="d4">
						<label class="check-colour sc" for="d4"><p class="sc_num">4</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="dateCon" type="radio" value="5" id="d5">
						<label class="check-colour sc" for="d5"><p class="sc_num">5</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="dateCon" type="radio" value="6" id="d6">
						<label class="check-colour sc" for="d6"><p class="sc_num">6</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="dateCon" type="radio" value="7" id="d7">
						<label class="check-colour sc" for="d7"><p class="sc_num">7</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="dateCon" type="radio" value="8" id="d8">
						<label class="check-colour sc" for="d8"><p class="sc_num">8</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="dateCon" type="radio" value="9" id="d9">
						<label class="check-colour sc" for="d9"><p class="sc_num">9</p></label>
					</div>	
					
					<div>
					<input  class="check-colour" name="dateCon" type="radio" value="10" id="d10">
						<label class="check-colour sc" for="d10"><p class="sc_num">10</p></label>
					</div>	
					
				</div>	
				<p class="sc_head">연애</p>	
			</div>	
			
			
			
			<!-- <table class="table table_marryCon">
				<tr>
					<th><img src="../resources/img/marry.jpg"></th>
					<td style="background-color:#8772bf"><input name="marryCon" type="radio" value="1" checked="checked">1점</td>
					<td><input name="marryCon" type="radio" value="2">2점</td>
					<td><input name="marryCon" type="radio" value="3">3점</td>
					<td><input name="marryCon" type="radio" value="4">4점</td>
					<td><input name="marryCon" type="radio" value="5">5점</td>
					<td><input name="marryCon" type="radio" value="6">6점</td>
					<td><input name="marryCon" type="radio" value="7">7점</td>
					<td><input name="marryCon" type="radio" value="8">8점</td>
					<td><input name="marryCon" type="radio" value="9">9점</td>
					<td><input name="marryCon" type="radio" value="10">10점</td>
				</tr>
			</table> -->
			
			<div id="sc_div">
				<div class="check-colours">

					<div>
						<input  class="check-colour" name="marryCon" type="radio" value="1" checked="checked" id="m1">
						<label class="check-colour sc" for="m1"><p class="sc_num">1</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="marryCon" type="radio" value="2" id="m2">
						<label class="check-colour sc" for="m2"><p class="sc_num">2</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="marryCon" type="radio" value="3" id="m3">
						<label class="check-colour sc" for="m3"><p class="sc_num">3</p></label>
					</div>
						
					<div>	
						<input class="check-colour" name="marryCon" type="radio" value="4" id="m4">
						<label class="check-colour sc" for="m4"><p class="sc_num">4</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="marryCon" type="radio" value="5" id="m5">
						<label class="check-colour sc" for="m5"><p class="sc_num">5</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="marryCon" type="radio" value="6" id="m6">
						<label class="check-colour sc" for="m6"><p class="sc_num">6</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="marryCon" type="radio" value="7" id="m7">
						<label class="check-colour sc" for="m7"><p class="sc_num">7</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="marryCon" type="radio" value="8" id="m8">
						<label class="check-colour sc" for="m8"><p class="sc_num">8</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="marryCon" type="radio" value="9" id="m9">
						<label class="check-colour sc" for="m9"><p class="sc_num">9</p></label>
					</div>	
					
					<div>
					<input  class="check-colour" name="marryCon" type="radio" value="10" id="m10">
						<label class="check-colour sc" for="m10"><p class="sc_num">10</p></label>
					</div>	
				</div>		
				<p class="sc_head">결혼</p>
			</div>	
			
			
			<!-- <table class="table table_babyCon">
				<tr>
					<th><img src="../resources/img/child.jpg"></th>
					<td style="background-color:#8772bf"><input name="babyCon" type="radio" value="1" checked="checked">1점</td>
					<td><input name="babyCon" type="radio" value="2">2점</td>
					<td><input name="babyCon" type="radio" value="3">3점</td>
					<td><input name="babyCon" type="radio" value="4">4점</td>
					<td><input name="babyCon" type="radio" value="5">5점</td>
					<td><input name="babyCon" type="radio" value="6">6점</td>
					<td><input name="babyCon" type="radio" value="7">7점</td>
					<td><input name="babyCon" type="radio" value="8">8점</td>
					<td><input name="babyCon" type="radio" value="9">9점</td>
					<td><input name="babyCon" type="radio" value="10">10점</td>
				</tr>
			</table> -->
			
			<div id="sc_div">
				<div class="check-colours">

					<div>
						<input  class="check-colour" name="babyCon" type="radio" value="1" checked="checked" id="b1">
						<label class="check-colour sc" for="b1"><p class="sc_num">1</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="babyCon" type="radio" value="2" id="b2">
						<label class="check-colour sc" for="b2"><p class="sc_num">2</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="babyCon" type="radio" value="3" id="b3">
						<label class="check-colour sc" for="b3"><p class="sc_num">3</p></label>
					</div>
						
					<div>	
						<input class="check-colour" name="babyCon" type="radio" value="4" id="b4">
						<label class="check-colour sc" for="b4"><p class="sc_num">4</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="babyCon" type="radio" value="5" id="b5">
						<label class="check-colour sc" for="b5"><p class="sc_num">5</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="babyCon" type="radio" value="6" id="b6">
						<label class="check-colour sc" for="b6"><p class="sc_num">6</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="babyCon" type="radio" value="7" id="b7">
						<label class="check-colour sc" for="b7"><p class="sc_num">7</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="babyCon" type="radio" value="8" id="b8">
						<label class="check-colour sc" for="b8"><p class="sc_num">8</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="babyCon" type="radio" value="9" id="b9">
						<label class="check-colour sc" for="b9"><p class="sc_num">9</p></label>
					</div>	
					
					<div>
					<input  class="check-colour" name="babyCon" type="radio" value="10" id="b10">
						<label class="check-colour sc" for="b10"><p class="sc_num">10</p></label>
					</div>	
				</div>		
				<p class="sc_head">출산</p>
			</div>	
			
			
		<!-- 	<table class="table table_houseCon">
				<tr>
					<th><img src="../resources/img/home.jpg"></th>
					<td style="background-color:#8772bf"><input name="houseCon" type="radio" value="1" checked="checked">1점</td>
					<td><input name="houseCon" type="radio" value="2">2점</td>
					<td><input name="houseCon" type="radio" value="3">3점</td>
					<td><input name="houseCon" type="radio" value="4">4점</td>
					<td><input name="houseCon" type="radio" value="5">5점</td>
					<td><input name="houseCon" type="radio" value="6">6점</td>
					<td><input name="houseCon" type="radio" value="7">7점</td>
					<td><input name="houseCon" type="radio" value="8">8점</td>
					<td><input name="houseCon" type="radio" value="9">9점</td>
					<td><input name="houseCon" type="radio" value="10">10점</td>
				</tr>
			</table>
			 -->
			
			<div id="sc_div">
				<div class="check-colours">

					<div>
						<input  class="check-colour" name="houseCon" type="radio" value="1" checked="checked" id="ho1">
						<label class="check-colour sc" for="ho1"><p class="sc_num">1</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="houseCon" type="radio" value="2" id="ho2">
						<label class="check-colour sc" for="ho2"><p class="sc_num">2</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="houseCon" type="radio" value="3" id="ho3">
						<label class="check-colour sc" for="ho3"><p class="sc_num">3</p></label>
					</div>
						
					<div>	
						<input class="check-colour" name="houseCon" type="radio" value="4" id="ho4">
						<label class="check-colour sc" for="ho4"><p class="sc_num">4</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="houseCon" type="radio" value="5" id="ho5">
						<label class="check-colour sc" for="ho5"><p class="sc_num">5</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="houseCon" type="radio" value="6" id="ho6">
						<label class="check-colour sc" for="ho6"><p class="sc_num">6</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="houseCon" type="radio" value="7" id="ho7">
						<label class="check-colour sc" for="ho7"><p class="sc_num">7</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="houseCon" type="radio" value="8" id="ho8">
						<label class="check-colour sc" for="ho8"><p class="sc_num">8</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="houseCon" type="radio" value="9" id="ho9">
						<label class="check-colour sc" for="ho9"><p class="sc_num">9</p></label>
					</div>	
					
					<div>
					<input  class="check-colour" name="houseCon" type="radio" value="10" id="ho10">
						<label class="check-colour sc" for="ho10"><p class="sc_num">10</p></label>
					</div>	
				</div>		
				<p class="sc_head_l">내집마련</p>
			</div>	
			
			
			
			<!-- <table class="table table_relationCon">
				<tr>
					<th><img src="../resources/img/human.jpg"></th>
					<td style="background-color:#8772bf"><input name="relationCon" type="radio" value="1" checked="checked">1점</td>
					<td><input name="relationCon" type="radio" value="2">2점</td>
					<td><input name="relationCon" type="radio" value="3">3점</td>
					<td><input name="relationCon" type="radio" value="4">4점</td>
					<td><input name="relationCon" type="radio" value="5">5점</td>
					<td><input name="relationCon" type="radio" value="6">6점</td>
					<td><input name="relationCon" type="radio" value="7">7점</td>
					<td><input name="relationCon" type="radio" value="8">8점</td>
					<td><input name="relationCon" type="radio" value="9">9점</td>
					<td><input name="relationCon" type="radio" value="10">10점</td>
				</tr>
			</table> -->
			
			
			<div id="sc_div">
				<div class="check-colours">

					<div>
						<input  class="check-colour" name="relationCon" type="radio" value="1" checked="checked" id="r1">
						<label class="check-colour sc" for="r1"><p class="sc_num">1</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="relationCon" type="radio" value="2" id="r2">
						<label class="check-colour sc" for="r2"><p class="sc_num">2</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="relationCon" type="radio" value="3" id="r3">
						<label class="check-colour sc" for="r3"><p class="sc_num">3</p></label>
					</div>
						
					<div>	
						<input class="check-colour" name="relationCon" type="radio" value="4" id="r4">
						<label class="check-colour sc" for="r4"><p class="sc_num">4</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="relationCon" type="radio" value="5" id="r5">
						<label class="check-colour sc" for="r5"><p class="sc_num">5</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="relationCon" type="radio" value="6" id="r6">
						<label class="check-colour sc" for="r6"><p class="sc_num">6</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="relationCon" type="radio" value="7" id="r7">
						<label class="check-colour sc" for="r7"><p class="sc_num">7</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="relationCon" type="radio" value="8" id="r8">
						<label class="check-colour sc" for="r8"><p class="sc_num">8</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="relationCon" type="radio" value="9" id="r9">
						<label class="check-colour sc" for="r9"><p class="sc_num">9</p></label>
					</div>	
					
					<div>
					<input  class="check-colour" name="relationCon" type="radio" value="10" id="r10">
						<label class="check-colour sc" for="r10"><p class="sc_num">10</p></label>
					</div>	
				</div>		
				<p class="sc_head_l">인간관계</p>
			</div>	
			
			
			<!-- <table class="table table_dreamCon">
				<tr>
					<th><img src="../resources/img/dream.jpg"></th>
					<td style="background-color:#8772bf"><input name="dreamCon" type="radio" value="1" checked="checked">1점</td>
					<td><input name="dreamCon" type="radio" value="2">2점</td>
					<td><input name="dreamCon" type="radio" value="3">3점</td>
					<td><input name="dreamCon" type="radio" value="4">4점</td>
					<td><input name="dreamCon" type="radio" value="5">5점</td>
					<td><input name="dreamCon" type="radio" value="6">6점</td>
					<td><input name="dreamCon" type="radio" value="7">7점</td>
					<td><input name="dreamCon" type="radio" value="8">8점</td>
					<td><input name="dreamCon" type="radio" value="9">9점</td>
					<td><input name="dreamCon" type="radio" value="10">10점</td>
				</tr>
			</table> -->
			
			
			<div id="sc_div">
				<div class="check-colours">

					<div>
						<input  class="check-colour" name="dreamCon" type="radio" value="1" checked="checked" id="dr1">
						<label class="check-colour sc" for="dr1"><p class="sc_num">1</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="dreamCon" type="radio" value="2" id="dr2">
						<label class="check-colour sc" for="dr2"><p class="sc_num">2</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="dreamCon" type="radio" value="3" id="dr3">
						<label class="check-colour sc" for="dr3"><p class="sc_num">3</p></label>
					</div>
						
					<div>	
						<input class="check-colour" name="dreamCon" type="radio" value="4" id="dr4">
						<label class="check-colour sc" for="dr4"><p class="sc_num">4</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="dreamCon" type="radio" value="5" id="dr5">
						<label class="check-colour sc" for="dr5"><p class="sc_num">5</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="dreamCon" type="radio" value="6" id="dr6">
						<label class="check-colour sc" for="dr6"><p class="sc_num">6</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="dreamCon" type="radio" value="7" id="dr7">
						<label class="check-colour sc" for="dr7"><p class="sc_num">7</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="dreamCon" type="radio" value="8" id="dr8">
						<label class="check-colour sc" for="dr8"><p class="sc_num">8</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="dreamCon" type="radio" value="9" id="dr9">
						<label class="check-colour sc" for="dr9"><p class="sc_num">9</p></label>
					</div>	
					
					<div>
					<input  class="check-colour" name="dreamCon" type="radio" value="10" id="dr10">
						<label class="check-colour sc" for="dr10"><p class="sc_num">10</p></label>
					</div>	
				</div>		
				<p class="sc_head_dr">꿈</p>
			</div>	
			
			
			<!-- <table class="table table_hopeCon">
				<tr>
					<th><img src="../resources/img/job.jpg"></th>
					<td style="background-color:#8772bf"><input name="hopeCon" type="radio" value="1" checked="checked">1점</td>
					<td><input name="hopeCon" type="radio" value="2">2점</td>
					<td><input name="hopeCon" type="radio" value="3">3점</td>
					<td><input name="hopeCon" type="radio" value="4">4점</td>
					<td><input name="hopeCon" type="radio" value="5">5점</td>
					<td><input name="hopeCon" type="radio" value="6">6점</td>
					<td><input name="hopeCon" type="radio" value="7">7점</td>
					<td><input name="hopeCon" type="radio" value="8">8점</td>
					<td><input name="hopeCon" type="radio" value="9">9점</td>
					<td><input name="hopeCon" type="radio" value="10">10점</td>
				</tr>
			</table> -->
			
			
			<div id="sc_div">
				<div class="check-colours">

					<div>
						<input  class="check-colour" name="hopeCon" type="radio" value="1" checked="checked" id="h1">
						<label class="check-colour sc" for="h1"><p class="sc_num">1</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="hopeCon" type="radio" value="2" id="h2">
						<label class="check-colour sc" for="h2"><p class="sc_num">2</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="hopeCon" type="radio" value="3" id="h3">
						<label class="check-colour sc" for="h3"><p class="sc_num">3</p></label>
					</div>
						
					<div>	
						<input class="check-colour" name="hopeCon" type="radio" value="4" id="h4">
						<label class="check-colour sc" for="h4"><p class="sc_num">4</p></label>
					</div>	
					
					<div>	
						<input class="check-colour" name="hopeCon" type="radio" value="5" id="h5">
						<label class="check-colour sc" for="h5"><p class="sc_num">5</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="hopeCon" type="radio" value="6" id="h6">
						<label class="check-colour sc" for="h6"><p class="sc_num">6</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="hopeCon" type="radio" value="7" id="h7">
						<label class="check-colour sc" for="h7"><p class="sc_num">7</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="hopeCon" type="radio" value="8" id="h8">
						<label class="check-colour sc" for="h8"><p class="sc_num">8</p></label>
					</div>	
					
					<div>
						<input  class="check-colour" name="hopeCon" type="radio" value="9" id="h9">
						<label class="check-colour sc" for="h9"><p class="sc_num">9</p></label>
					</div>	
					
					<div>
					<input  class="check-colour" name="hopeCon" type="radio" value="10" id="h10">
						<label class="check-colour sc" for="h10"><p class="sc_num">10</p></label>
					</div>	
				</div>		
				<p class="sc_head_l">희망직업</p>
			</div>	
			
			
			
		</div>


	</div>
					<!-- 7가지 선택사항 -->
				
					
					
				</div>
				
			
		</div>
		
</form>
	</div>
</div>

</body>
</html>
