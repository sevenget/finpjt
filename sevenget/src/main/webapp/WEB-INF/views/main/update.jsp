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
<!-- 이거 css명 작업하시는 css 파일명으로 바꾸세요 안 그럼 저랑 꼬여요..!  -->
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>

<script>
	
function btnUpdate(){
	var forms = document.getElementById("form1");
	forms.submit();
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

						<form id="form1" name="form1" method="post" action="updateUser" >
 <table border="1" height="808" width="808">
 <c:forEach items="${member2}" var="iid" >
				
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white" >아이디</td>
					<td>${iid.id}</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >이름</td>
					<td><input  type="text" class="font" name="memName" value="${iid.name}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >비밀번호</td>
					<td><input type="password" class="font" name="memPassword" value="${iid.password}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >생년월일</td>
					<td><input type="text" class="font" name="memBirth" value="${iid.birth}" placeholder="주민번호 앞자리만 입력하시오(예시 901010)" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >주소</td>
					<td><input type="text" class="font" name="memAddress" value="${iid.address}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >이메일</td>
					<td><input type="text" class="font" name="memEmail" value="${iid.email}" > </td>
				</tr>

				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >연애</td>
					<td><input type="text" class="font" name="memDateCon" value="${iid.dateCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >결혼</td>
					<td><input type="text" class="font" name="memMarryCon" value="${iid.marryCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >육아</td>
					<td><input type="text" class="font" name="memBabyCon" value="${iid.babyCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >내집</td>
					<td><input type="text" class="font" name="memHouseCon" value="${iid.houseCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >인간</td>
					<td><input type="text" class="font" name="memRelationCon" value="${iid.relationCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >꿈</td>
					<td><input type="text" class="font" name="memDreamCon" value="${iid.dreamCon}" > </td>
				</tr>
				<tr>
					<td align="center" bgcolor="#8772bf" style="color: white"  >희망</td>
					<td><input type="text" class="font" name="memHopeCon" value="${iid.hopeCon}" > </td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="수정" onclick="btnUpdate();"><input type="button" onclick=" history.go(-1);" value="취소" > 
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