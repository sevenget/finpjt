<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
		
		var url = "./insertUser?id="+forms.id.value
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
		
		location.href=url;
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
					<h3 id="header">칠득에 오신것을 환영합니다.</h3>
				</div>
				
				<div id="regiMain1">
					<h3 align="center">회원정보 기입란</h3><hr id="line1" width="500px" color="#aaa" size="1" class="hr">
					
				
					<!--  테이블 1-->
					<table class="table_abs" >
						<tr>
							<td>아이디</td>
							<td class="input_td"><input id="id" name="id" class="table_input" type="text" placeholder="아이디(4자 이상)"></td>
							<td class="" ><input type="button" value="중복확인"
													onclick="checkId(this.form)"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td class="input_td"><input id="password" name="password" class="table_input" type="password" placeholder="비밀번호(8자 이상)"></td>
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
							<td>성 별</td>
							<td class="input_td">
								<select name="gender" style="width:100px;height:30px;">
									<option value="M">남자
									<option value="F">여자
								</select>
							</td>
						</tr>
						<tr>
							<td>주 소</td>
							<td class="input_td"><input id="address" name="address" class="table_input" type="text" placeholder="주소 입력"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td class="input_td"><input id="email" name="email" class="table_input" type="text" placeholder="이메일(예시. abc@naver.com)"></td>
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
					<!--  테이블 1-->
					
				</div>
				
				
		
		<div id="regiMain2">
					<h3 align="center">7가지 중요도 점수 매칭</h3><hr id="line1" width="500px" color="#aaa" size="1" class="hr">
						<div class="mw_layer">
		<div class="bg"></div>

		<div id="layer">
		
		<!--  테이블 2-8-->
			<table class="table table_dream">
				<tr>
					<th><img src="../resources/img/dream.jpg"></th>
					<td style="background-color:#8772bf"><input name="dream" type="radio" value="1" checked="checked">1점</td>
					<td><input name="dream" type="radio" value="2">2점</td>
					<td><input name="dream" type="radio" value="3">3점</td>
					<td><input name="dream" type="radio" value="4">4점</td>
					<td><input name="dream" type="radio" value="5">5점</td>
					<td><input name="dream" type="radio" value="6">6점</td>
					<td><input name="dream" type="radio" value="7">7점</td>
					<td><input name="dream" type="radio" value="8">8점</td>
					<td><input name="dream" type="radio" value="9">9점</td>
					<td><input name="dream" type="radio" value="10">10점</td>
				</tr>
			</table>
			
			<table class="table table_love">
				<tr>
					<th><img src="../resources/img/love.jpg"></th>
					<td style="background-color:#8772bf"><input name="love" type="radio" value="1" checked="checked">1점</td>
					<td><input name="love" type="radio" value="2">2점</td>
					<td><input name="love" type="radio" value="3">3점</td>
					<td><input name="love" type="radio" value="4">4점</td>
					<td><input name="love" type="radio" value="5">5점</td>
					<td><input name="love" type="radio" value="6">6점</td>
					<td><input name="love" type="radio" value="7">7점</td>
					<td><input name="love" type="radio" value="8">8점</td>
					<td><input name="love" type="radio" value="9">9점</td>
					<td><input name="love" type="radio" value="10">10점</td>
				</tr>
			</table>
			
			<table class="table table_marry">
				<tr>
					<th><img src="../resources/img/marry.jpg"></th>
					<td style="background-color:#8772bf"><input name="marry" type="radio" value="1" checked="checked">1점</td>
					<td><input name="marry" type="radio" value="2">2점</td>
					<td><input name="marry" type="radio" value="3">3점</td>
					<td><input name="marry" type="radio" value="4">4점</td>
					<td><input name="marry" type="radio" value="5">5점</td>
					<td><input name="marry" type="radio" value="6">6점</td>
					<td><input name="marry" type="radio" value="7">7점</td>
					<td><input name="marry" type="radio" value="8">8점</td>
					<td><input name="marry" type="radio" value="9">9점</td>
					<td><input name="marry" type="radio" value="10">10점</td>
				</tr>
			</table>
			
			<table class="table table_human">
				<tr>
					<th><img src="../resources/img/human.jpg"></th>
					<td style="background-color:#8772bf"><input name="human" type="radio" value="1" checked="checked">1점</td>
					<td><input name="human" type="radio" value="2">2점</td>
					<td><input name="human" type="radio" value="3">3점</td>
					<td><input name="human" type="radio" value="4">4점</td>
					<td><input name="human" type="radio" value="5">5점</td>
					<td><input name="human" type="radio" value="6">6점</td>
					<td><input name="human" type="radio" value="7">7점</td>
					<td><input name="human" type="radio" value="8">8점</td>
					<td><input name="human" type="radio" value="9">9점</td>
					<td><input name="human" type="radio" value="10">10점</td>
				</tr>
			</table>
			
			<table class="table table_child">
				<tr>
					<th><img src="../resources/img/child.jpg"></th>
					<td style="background-color:#8772bf"><input name="child" type="radio" value="1" checked="checked">1점</td>
					<td><input name="child" type="radio" value="2">2점</td>
					<td><input name="child" type="radio" value="3">3점</td>
					<td><input name="child" type="radio" value="4">4점</td>
					<td><input name="child" type="radio" value="5">5점</td>
					<td><input name="child" type="radio" value="6">6점</td>
					<td><input name="child" type="radio" value="7">7점</td>
					<td><input name="child" type="radio" value="8">8점</td>
					<td><input name="child" type="radio" value="9">9점</td>
					<td><input name="child" type="radio" value="10">10점</td>
				</tr>
			</table>
			
			<table class="table table_home">
				<tr>
					<th><img src="../resources/img/home.jpg"></th>
					<td style="background-color:#8772bf"><input name="home" type="radio" value="1" checked="checked">1점</td>
					<td><input name="home" type="radio" value="2">2점</td>
					<td><input name="home" type="radio" value="3">3점</td>
					<td><input name="home" type="radio" value="4">4점</td>
					<td><input name="home" type="radio" value="5">5점</td>
					<td><input name="home" type="radio" value="6">6점</td>
					<td><input name="home" type="radio" value="7">7점</td>
					<td><input name="home" type="radio" value="8">8점</td>
					<td><input name="home" type="radio" value="9">9점</td>
					<td><input name="home" type="radio" value="10">10점</td>
				</tr>
			</table>
			
			<table class="table table_job">
				<tr>
					<th><img src="../resources/img/job.jpg"></th>
					<td style="background-color:#8772bf"><input name="job" type="radio" value="1" checked="checked">1점</td>
					<td><input name="job" type="radio" value="2">2점</td>
					<td><input name="job" type="radio" value="3">3점</td>
					<td><input name="job" type="radio" value="4">4점</td>
					<td><input name="job" type="radio" value="5">5점</td>
					<td><input name="job" type="radio" value="6">6점</td>
					<td><input name="job" type="radio" value="7">7점</td>
					<td><input name="job" type="radio" value="8">8점</td>
					<td><input name="job" type="radio" value="9">9점</td>
					<td><input name="job" type="radio" value="10">10점</td>
				</tr>
			</table>
			
			
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
