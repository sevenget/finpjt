<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7get</title>
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/review.css" media="all"> -->

<script type="text/javascript">
	function addrv() {
		var fm = document.getElementById("rvfm");

		if (fm.rvtxt.value == "") {
			alert("리뷰를 입력해주세요.");
			fm.rvtxt.focus();
			return false;
		} else {
			alert("리뷰가 등록되었습니다.");

			fm.submit();

			$.ajax({
				url : "insert",
				data : "fm.rvtxt.value"
			});
		}

	}

	/* function checkFunc(){
	     if(httpRequest.readyState == 4){
	         // 결과값을 가져온다.
	         var resultText = httpRequest.responseText;
	         if(resultText == 1){ 
	             document.location.reload(); // 상세보기 창 새로고침
	         }
	     }
	 } */
</script>

</head>
<body>

	<div id="wrap">
		<div class="container_rv">
			<div class="r_review">

				<div id="rv__">
					<p class="head_rv">리뷰</p>
					<hr width="900px" color="#aaa" size="1" class="r_dt_hr">
				</div>


				<form id="rvfm" name="rvfm" method="get">



					<div class="cc_review">
						<!-- 댓글 전체 불러오기!!! -->
						${review}
						<%-- <c:forEach var="i" begin="${cnt}" end="0" step="1">
							<div class="review${i+1}">
1
								<p class="cr_view">"${review.get(i).content }"</p>
								<p class="cr_view">${review.get(i).reviewdate }</p>
							
							</div>
						</c:forEach> --%>
						<c:forEach items="${review}" var ="reviewdto">
							<div class="review">
								<p class="cr_view">"${reviewdto.content }"</p>
								<p class="cr_view">${reviewdto.reviewdate }</p>
							
							</div>
						</c:forEach>

					</div>

					<div class="cc_write">
						<input type="text" name="rvtxt" placeholder=" 리뷰 작성하기(50자 이내)"
							class="rr_write" maxlength="50"></label>
						<div class="rr_btn">
							<a href="javascript:addrv()">리뷰입력</a>
						</div>
					</div>

				</form>

			</div>

		</div>

	</div>

</body>
</html>