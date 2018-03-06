<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <% 
	String k = request.getParameter("cake");
	System.out.println(k);
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7Get - MyPage</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css"
	media="all">
<link rel="stylesheet" type="text/css" href="../resources/css/RightPage.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="../resources/css/portside.css" media="all">
	
<link rel="stylesheet" type="text/css" href="../resources/css/register2.css" media="all">
<link rel="stylesheet" type="text/css" href="../resources/css/score.css" media="all">
<!-- 이거 css명 작업하시는 css 파일명으로 바꾸세요 안 그럼 저랑 꼬여요..!  -->
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>

<script>

function check(){
	var forms = document.getElementById("form1");
	
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
		alert('이메일 주소를 확인 해주세요.');
		forms.email.focus();
		return false;
	}

	if (forms.dateCon.value == "" || forms.dateCon.value.length < 1) {
		alert('연애 점수를 확인 해주세요.');
		forms.email.focus();
		return false;
	}
	
	if (forms.dateCon.value > 10) {
		alert('연애 점수를 10이하로 작성 해주세요.');
		forms.email.focus();
		return false;
	}

	if (forms.marryCon.value == "" || forms.marryCon.value.length < 1) {
		alert('결혼 점수를 확인 해주세요.');
		forms.email.focus();
		return false;
	}
	
	if (forms.marryCon.value > 10) {
		alert('결혼 점수를 10이하로 작성 해주세요.');
		forms.email.focus();
		return false;
	}

	if (forms.babyCon.value == "" || forms.babyCon.value.length < 1) {
		alert('육아 점수를 확인 해주세요.');
		forms.email.focus();
		return false;
	}
	
	if (forms.babyCon.value > 10) {
		alert('육아 점수를 10이하로 작성 해주세요.');
		forms.email.focus(); 
		return false;
	}

	if (forms.houseCon.value == "" || forms.dateCon.value.length < 1) {
		alert('내집마련 점수를 확인 해주세요.');
		forms.email.focus();
		return false;
	}
	
	if (forms.houseCon.value > 10) {
		alert('내집마련 점수를 10이하로 작성 해주세요.');
		forms.email.focus();
		return false;
	}

	if (forms.relationCon.value == "" || forms.relationCon.value.length < 1) {
		alert('인간관계 점수를 확인 해주세요.');
		forms.email.focus();
		return false;
	}
	
	if (forms.relationCon.value > 10) {
		alert('인간관계 점수를 10이하로 작성 해주세요.');
		forms.email.focus();
		return false;
	}

	if (forms.dreamCon.value == "" || forms.dreamCon.value.length < 1) {
		alert('꿈 점수를 확인 해주세요.');
		forms.email.focus();
		return false;
	}
	
	if (forms.dreamCon.value > 10) {
		alert('꿈 점수를 10이하로 작성 해주세요.');
		forms.email.focus();
		return false;
	}

	if (forms.hopeCon.value == "" || forms.hopeCon.value.length < 1) {
		alert('희망 점수를 확인 해주세요.');
		forms.email.focus();
		return false;
	}
	
	if (forms.hopeCon.value > 10) {
		alert('희망 점수를 10이하로 작성 해주세요.');
		forms.email.focus();
		return false;
	}
	
	alert('회원정보 수정 성공.');
	
	return true;
}
		
</script>

</head>
<body>


	<div id="head">
		<jsp:include page="../include/header.jsp" flush="false" />
	</div>

	<div id="all">
		<div id="contect">

			<!-- 여기 안에다 작업하시면 돼요 -->
			<div class="container2">

				<div class="left">
					<jsp:include page="../include/portside.jsp" flush="false" />
				</div>

				<div class="right" style="padding-bottom: 0">
					<div class="rightTop">
						<!-- 여기 안에다 작업하시면 돼요 -->
					<h1 style="text-align: center; margin-top: 50px;" >회원 정보 수정</h1>
					<hr width="600">
						<form id="form1" name="form1" method="post" action="updateUser" enctype="multipart/form-data" onsubmit="return check()">
 <table class="table_abs">
 <c:forEach items="${member2}" var="iid" >
				
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;" >아이디</td>
					<td>${iid.id}</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >이름</td>
					<td><input  id="name" type="text" class="font input_td" name="memName" value="${iid.name}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >비밀번호</td>
					<td><input  id="password" type="password" class="font input_td" name="memPassword" value="${iid.password}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >내 사진</td>
					<td><input  id="memPicture" type="file" class="font input_td" name="memPicture" accept=".png,.gif,.jpg,.jpeg,.bmp"> </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >생년월일</td>
					<td><input  id="birth" type="text" class="font input_td" name="memBirth" value="${iid.birth}" placeholder="주민번호 앞자리만 입력하시오(예시 901010)" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >주소</td>
					<td><input  id="address" type="text" class="font input_td" name="memAddress" value="${iid.address}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >이메일</td>
					<td><input  id="email" type="text" class="font input_td" name="memEmail" value="${iid.email}" > </td>
				</tr>

				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >연애</td>
					<td>	
					<input  id="dateCon" type="text" class="font input_td" name="memDateCon" value="${iid.dateCon}" >
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >결혼</td>
					<td><input  id="marryCon" type="text" class="font input_td" name="memMarryCon" value="${iid.marryCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >육아</td>
					<td><input  id="babyCon" type="text" class="font input_td" name="memBabyCon" value="${iid.babyCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >내집마련</td>
					<td><input  id="houseCon" type="text" class="font input_td" name="memHouseCon" value="${iid.houseCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >인간관계</td>
					<td><input  id="relationCon" type="text" class="font input_td" name="memRelationCon" value="${iid.relationCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >꿈</td>
					<td><input  id="dreamCon" type="text" class="font input_td" name="memDreamCon" value="${iid.dreamCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white; width: 100px; height: 30px;"  >희망</td>
					<td><input  id="hopeCon" type="text" class="font input_td" name="memHopeCon" value="${iid.hopeCon}" > </td>
				</tr>
				<tr>
					<td colspan="2"  style="margin-left:0;">
					<br><br>
						<input type="submit" id="submit" value="수정" ><br><br>
						<input type="button"  id="submit" onclick=" history.go(-1);" value="취소" > 
						<div style="color: red;">${message }</div>
					</td>
				</tr>
				
				</c:forEach>
				
 </table>
 </form>
					</div> <!--rightTop  -->
				</div> <!-- right -->
			</div><!-- container2 -->
		</div><!-- contect -->
	</div>

</body>
</html>