<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = (String) request.getAttribute("userId");
	int check = ((Integer) (request.getAttribute("check"))).intValue();
%>
<html>
<head>
<title>중복확인</title>
<script>
function windowclose(){
	opener.document.form_1.userId.value='<%=userId%>';
		self.close();
	}
</script>
</head>
<body bgcolor="#ebecee">
	<%
		if (check == 1) {
	%>
	<table width="360" border="0" cellspacing="0" cellpadding="5">
		<tr align="center">
			<td height="30"><font size="2"><%=userId%> 는 이미 사용 중인 아이디입니다.</font></td>
		</tr>
	</table>

	<form action="./checkID" method="get" name="checkForm">
		<table width="360" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center"><font size="2">다른 아이디를 선택하세요.</font>
					<p>
						<input type="text" size="10" maxlength="12" name="userId" /> <input
							type="submit" value="중복확인" /></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<table width="360" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td align="center"><font size="2">입력하신 <%=userId%> 는 사용할 수 있는
					아이디입니다.
			</font> <br /> <br /> <input type="button" value="사용하기"
				onclick="windowclose()" /></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>