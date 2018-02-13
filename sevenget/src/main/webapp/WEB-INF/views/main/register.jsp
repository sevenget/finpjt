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
					
					<table class="table_abs" >
						<tr>
							<td>이름</td>
							<td class="input_td"><input class="table_input" type="text" placeholder="이름"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td class="input_td"><input class="table_input" type="text" placeholder="생년월일(예시. 920101)" maxlength="6"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td class="input_td"><input class="table_input" type="email" placeholder="이메일"></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td class="input_td"><input class="table_input" type="text" placeholder="아이디(6자 이상)"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td class="input_td"><input class="table_input" type="password" placeholder="비밀번호(8자 이상)"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td class="input_td"><input class="table_input" type="password" placeholder="비밀번호 확인"></td>
						</tr>
						<tr>
							<td colspan="2"><input id="submit" class="table_input" type="submit" value="회원가입"></td>
						</tr>
						<tr>
							<th colspan="2"><span>또는</span></th>
						</tr>
						<tr>
							<td colspan="2"><button id="facebook" class="table_input" >페이스북으로 1초만에 가입</button></td>
						</tr>
					</table>
					
				</div>
				
				<div id="regiMain2">
					<h3 align="center">부가 기입란</h3><hr id="line1" width="500px" color="#aaa" size="1" class="hr">
					
					<table class="table_choice">
						<tr>
							<th class="" colspan="2" style="text-align:left; padding-left:30px;">7가지 중요도</th>
						</tr>
						<tr>
							<th class="choice">1순위</th>
							<td>
								<input type="radio" name="one" value="1번">결혼
								<input type="radio" name="one" value="2번">출산
								<input type="radio" name="one" value="3번">내집마련
								<input type="radio" name="one" value="4번">꿈
								<input type="radio" name="one" value="5번">희망직업
								<input type="radio" name="one" value="6번">인간관계
								<input type="radio" name="one" value="7번">연애
							</td>
						</tr>
						<tr>
							<th class="choice">2순위</th>
							<td>
								<input type="radio" name="two" value="1번">결혼
								<input type="radio" name="two" value="2번">출산
								<input type="radio" name="two" value="3번">내집마련
								<input type="radio" name="two" value="4번">꿈
								<input type="radio" name="two" value="5번">희망직업
								<input type="radio" name="two" value="6번">인간관계
								<input type="radio" name="two" value="7번">연애
							</td>
						</tr>
						<tr>
							<th class="choice">3순위</th>
							<td>
								<input type="radio" name="three" value="1번">결혼
								<input type="radio" name="three" value="2번">출산
								<input type="radio" name="three" value="3번">내집마련
								<input type="radio" name="three" value="4번">꿈
								<input type="radio" name="three" value="5번">희망직업
								<input type="radio" name="three" value="6번">인간관계
								<input type="radio" name="three" value="7번">연애
							</td>
						</tr>
						<tr>
							<th class="choice">4순위</th>
							<td>
								<input type="radio" name="four" value="1번">결혼
								<input type="radio" name="four" value="2번">출산
								<input type="radio" name="four" value="3번">내집마련
								<input type="radio" name="four" value="4번">꿈
								<input type="radio" name="four" value="5번">희망직업
								<input type="radio" name="four" value="6번">인간관계
								<input type="radio" name="four" value="7번">연애
							</td>
						</tr>
						<tr>
							<th class="choice">5순위</th>
							<td>
								<input type="radio" name="five" value="1번">결혼
								<input type="radio" name="five" value="2번">출산
								<input type="radio" name="five" value="3번">내집마련
								<input type="radio" name="five" value="4번">꿈
								<input type="radio" name="five" value="5번">희망직업
								<input type="radio" name="five" value="6번">인간관계
								<input type="radio" name="five" value="7번">연애
							</td>
						</tr>
						<tr>
							<th class="choice">6순위</th>
							<td>
								<input type="radio" name="six" value="1번">결혼
								<input type="radio" name="six" value="2번">출산
								<input type="radio" name="six" value="3번">내집마련
								<input type="radio" name="six" value="4번">꿈
								<input type="radio" name="six" value="5번">희망직업
								<input type="radio" name="six" value="6번">인간관계
								<input type="radio" name="six" value="7번">연애
							</td>
						</tr>
						<tr>
							<th class="choice">7순위</th>
							<td>
								<input type="radio" name="seven" value="1번">결혼
								<input type="radio" name="seven" value="2번">출산
								<input type="radio" name="seven" value="3번">내집마련
								<input type="radio" name="seven" value="4번">꿈
								<input type="radio" name="seven" value="5번">희망직업
								<input type="radio" name="seven" value="6번">인간관계
								<input type="radio" name="seven" value="7번">연애
							</td>
						</tr>
					</table>
				</div>
				
			</div>

		</div>
	</div>



</body>
</html>