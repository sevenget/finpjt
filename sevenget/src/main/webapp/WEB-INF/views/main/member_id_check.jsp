<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) request.getAttribute("id");
	int check = ((Integer) (request.getAttribute("check"))).intValue();
%>
<html>
<head>
<title>7get - Check</title>
<link rel="stylesheet" type="text/css" href="../resources/css/register.css" media="all">
<script>
function windowclose(){
	opener.document.form_1.id.value='<%=id%>';
		self.close();
	}
	
</script>
</head>
<body bgcolor="#fff">
	<%
		if (check == 1) {
	%>
	<table width="360" border="0" cellspacing="0" cellpadding="5">
		<tr align="center">
			<td height="30"><font size="2"><%=id%> 는 이미 사용 중인 아이디입니다.</font></td>
		</tr>
	</table>

	<form action="./checkID" method="get" name="checkForm">
		<table width="360" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center"><font size="2">다른 아이디를 선택하세요.</font>
					<p>
						<input type="text" size="10" maxlength="12" name="id" /> 
						<input type="submit" value="중복확인" class="ic_btn"/></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<table width="360" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<%-- <td align="center"><font size="2">입력하신 <%=id%> 는 사용할 수 있는
					아이디입니다.
			</font> <br /> <br /> --%>
			
			<td align="center"><p class="ic_p_red"><%=id%> </p> <p class="ic_p">는</p><br />
			<p class="ic_p">사용할 수 있는 아이디 입니다.</p> 
			<input type="button" value="사용하기" onclick="windowclose()" class="ic_btn" /></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>
