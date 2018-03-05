<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
	$(function(){
		$('input.MyPage_btn').click(function(){
			location.href="./mypage"
		})
	})
	
</script>

<form action="mypage">
	<div class="infocontholder_2">
		<p class="head_member">회원 정보</p>
		<hr width="285px" color="#aaa" size="1" class="hr_member">

		<div class="ficture">
			<img src="../resources/img/memPicture/${member.picture}">
		</div>

		<div class="membership">
			<p>이름 : ${ member.name}</p>
			<p class="font">아이디 : ${member.id }	</p>
			
		</div>

		<input type="button" class="MyPage_btn" value="My Page">
	</div>
</form>