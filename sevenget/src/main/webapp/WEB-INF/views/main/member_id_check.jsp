<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) request.getAttribute("id");
	int check = ((Integer) (request.getAttribute("check"))).intValue();
%>
<html>
<head>
<title>7get - Check</title>
<link rel="stylesheet" type="text/css" href="../resources/css/register.css?ver=1" media="all">
<script>
function windowclose(){
	opener.document.form_1.id.value='<%=id%>';
		self.close();
	}
	
</script>
</head>
<body bgcolor="#fff">
	
	<div class="ic_head">중복 확인</div>
	<hr id="ic_hr" width="350px" color="#aaa" size="1" class="hr">

	<%
		if (check == 1) {
	%>
	<!-- <table width="360" border="0" cellspacing="0" cellpadding="5">
		<tr align="center"> -->
		<div class="ic_div4">
			<!-- <td height="30"><font size="2"> --><p class="ic_p_red"><font class="ic_red"><%=id%></font> 는</p>
		</div>
			
		<div class="ic_div5">
			<p class="ic_p2">이미 사용 중인 아이디입니다.<!-- </font></td> --></p> 
		</div>
	<!-- 	</tr>
	</table> -->

	<form action="./checkID" method="get" name="checkForm">
	<!-- <table width="360" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center"><font size="2"> -->
				
				<div class="ic_div5">
					<p class="ic_p2"><font class="ic_red2">다른 아이디를 선택하세요.</font></p>
				</div>
				<!-- </font><p> -->
					<div class="ic_div6">
						<input type="text" size="10" maxlength="12" name="id" class="ic_txt" /> 
						<input type="submit" value="중복확인" class="ic_btn2"/></td>
					</div>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<!-- <table width="360" border="0" cellspacing="0" cellpadding="5"> -->
		<!-- <tr> -->
			<%-- <td align="center"><font size="2">입력하신 <%=id%> 는 사용할 수 있는
					아이디입니다.
			</font> <br /> <br /> --%>
			
			<div class="ic_div1">
				<!-- <td align="center"> --><p class="ic_p_red"><font class="ic_red"><%=id%></font> 는</p>
			</div>
			
			<div class="ic_div2">
			<p class="ic_p2">사용할 수 있는 아이디 입니다.</p> 
			</div>
			
			<div class="ic_div3">
				<input type="button" value="사용하기" onclick="windowclose()" class="ic_btn" /></td>
			</div>
		<!-- </tr>
	</table> -->
	<%
		}
	%>
</body>
</html>
