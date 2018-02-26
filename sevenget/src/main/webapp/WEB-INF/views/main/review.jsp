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
 		
 		if(fm.rvtxt.value=="") {
 			alert("리뷰를 입력해주세요.");
 			fm.rvtxt.focus();
 			return false;
 		} else {
 			alert("리뷰가 등록되었습니다.");
 			
 			fm.submit();
 			
 			$.ajax({
 				url : "review",
 				data : ""
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
<<<<<<< HEAD
 			<div class="container_rv">
 				<div class="r_review">
 				<%--  	
 					${cid}<br/>
 					${writer }<br/>
 					${reviewdate }<br/>
 					${content }<br/>   --%>
 					
 						<div id="rv__">
 							<p class="head_rv">리뷰</p>
 							<hr width="900px" color="#aaa" size="1" class="r_dt_hr">	 
 						</div>
 						
 
 						<form id="rvfm" name="rvfm" method="get">
 						<div class="cc_review">
 								<div class="review_rr">
 									<p class="rr_view">"${content}"</p>
 									<p class="rr_date">${reviewdate}</p>
 								</div>
 							</div>
 							
 						</div>
 						
 						<div class="cc_write">
 							<input type="text" name="rvtxt" placeholder="리뷰 작성하기(50자 이내)" class="rr_write" maxlength="50"></label>
 							<!-- <input type="button" value="리뷰입력" class="rr_btn" onclick="addrv()"> -->
 							<div class="rr_btn"><a href="javascript:addrv()">리뷰입력</a></div>
 						</div>
 
 
 						</form>
 										
 	 				</div>
 
 	 			</div>
 
 			</div>
=======
			<div class="container_rv">
				<div class="r_review">
					
						<div id="rv__">
							<p class="head_rv">리뷰</p>
							<hr width="900px" color="#aaa" size="1" class="r_dt_hr">	 
						</div>
						

						<form id="rvfm" name="rvfm" method="get">
							
							
							
							<div class="cc_review">
							<c:forEach var = "i" begin = "1" end = "3">
		                           ${review.get(i).writer }
		                           ${review.get(i).cid }
		                           ${review.get(i).content }
		                           ${review.get(i).reviewdate }
							</c:forEach>
								<div class="review_rr">
							<c:forEach var = "i" begin = "1" end = "3">
									<p class="rr_view">"${review.get(i).content }"</p>
									<p class="rr_date">${review.get(i).reviewdate }</p>
							</c:forEach>
								</div>
							</div>

							<div class="cc_write">
								<input type="text" name="rvtxt" placeholder=" 리뷰 작성하기(50자 이내)"
									class="rr_write" maxlength="50"></label>
								<!-- <input type="button" value="리뷰입력" class="rr_btn" onclick="addrv()"> -->
								<div class="rr_btn">
									<a href="javascript:addrv()">리뷰입력</a>
								</div>
							</div>

						</form>

	 			</div>

			</div>

	</div>
>>>>>>> branch 'master' of https://github.com/sevenget/finpjt.git

</body>
</html>