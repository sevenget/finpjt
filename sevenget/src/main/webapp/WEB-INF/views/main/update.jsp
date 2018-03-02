<%@page import="model.company.CompanyBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 페이지</title>
<script type="text/javascript">
//		/main 앞에 /seven 써줘야하는지 모르겠음
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/main/update.do";
		document.form1.submit();
	});
});
</script>
<body>
<form name="form1" method="post">
 <table border="1" width="600">
 	
 <c:forEach items="${member}" var="iid" >
				
				<tr>
					<td align="center" >아이디</td>
					<td>${iid.name}</td>
				</tr>
				<tr>
					<td align="center" >이름</td>
					<td><input class="font" name="memName" value="${iid.name}" > </td>
				</tr>
				<tr>
					<td align="center" >비밀번호</td>
					<td><input class="font" name="memPassword" value="${iid.password}" > </td>
				</tr>
				<tr>
					<td align="center" >생년월일</td>
					<td><input class="font" name="memBirth" style="width: 360px;" value="${iid.birth}" placeholder="주민번호 앞자리만 입력하시오(예시 901010)" > </td>
				</tr>
				<tr>
					<td align="center" >주소</td>
					<td><input class="font" name="memAddress" value="${iid.address}" > </td>
				</tr>
				<tr>
					<td align="center" >이메일</td>
					<td><input class="font" name="memEmail" value="${iid.email}" > </td>
				</tr>

				<tr>
					<td align="center" >연애</td>
					<td><input class="font" name="memDateCon" value="${iid.dateCon}" > </td>
				</tr>
				<tr>
					<td align="center" >결혼</td>
					<td><input class="font" name="memMarryCon" value="${iid.marryCon}" > </td>
				</tr>
				<tr>
					<td align="center" >육아</td>
					<td><input class="font" name="memBabyCon" value="${iid.babyCon}" > </td>
				</tr>
				<tr>
					<td align="center" >내집</td>
					<td><input class="font" name="memHouseCon" value="${iid.houseCon}" > </td>
				</tr>
				<tr>
					<td align="center" >인간</td>
					<td><input class="font" name="memRelationCon" value="${iid.relationCon}" > </td>
				</tr>
				<tr>
					<td align="center" >꿈</td>
					<td><input class="font" name="memDreamCon" value="${iid.dreamCon}" > </td>
				</tr>
				<tr>
					<td align="center" >희망</td>
					<td><input class="font" name="memHopeCon" value="${iid.hopeCon}" > </td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" id="btnUpdate" value="수정" ><input type="button" onclick=" history.go(-1);" value="취소" > 
						<div style="color: red;">${message }</div>
					</td>
				</tr>
							 
				</c:forEach>
				
 </table>
 </form>
</body>
</html>