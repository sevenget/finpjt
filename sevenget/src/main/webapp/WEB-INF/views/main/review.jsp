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

<<<<<<< HEAD
   <div id="wrap">
         <div class="container_rv">
            <div class="r_review">
               
                  <div id="rv__">
                     <p class="head_rv">리뷰</p>
                     <hr width="900px" color="#aaa" size="1" class="r_dt_hr">    
                  </div>
                  
=======
	<div id="wrap">
			<div class="container_rv">
				<div class="r_review">
					
						<div id="rv__">
							<p class="head_rv">리뷰</p>
							<hr width="900px" color="#aaa" size="1" class="r_dt_hr">	 
						</div>
						
>>>>>>> branch 'master' of https://github.com/sevenget/finpjt.git

                  <form id="rvfm" name="rvfm" method="get">
                     
                     
                     
                     <div class="cc_review">
                     <%-- <c:forEach var = "i" begin = "1" end = "3">
                                 ${review.get(i).writer }
                                 ${review.get(i).cid }
                                 ${review.get(i).content }
                                 ${review.get(i).reviewdate }
                                 <br/>
                     </c:forEach>
                     1: ${review.get(0).content}</br>
                     2: ${review.get(1).content}</br>
                     3: ${review.get(2).content}</br>
                     4: ${review.get(3).content}</br>
                     5: ${review.get(4).content}</br>
                     6: ${review.get(5).content}</br>
                     7: ${review.get(6).content}</br>
                     8: ${review.get(7).content}</br>
                     9: ${review.get(8).content}</br>
                     <c:forEach var = "i" begin = "0" end = "8">
                        <div class="review_rr">
                        ${cnt} i
                           <p class="rr_view">"${review.get(i).content }"</p>
                           <p class="rr_date">${review.get(i).reviewdate }</p>
                        </div>
                     </c:forEach> --%>
                     </div>

<<<<<<< HEAD
                     <div class="cc_write">
                        <input type="text" name="rvtxt" placeholder=" 리뷰 작성하기(50자 이내)"
                           class="rr_write" maxlength="50"></label>
                        <div class="rr_btn">
                           <a href="javascript:addrv()">리뷰입력</a>
                        </div>
                     </div>
=======
							<div class="cc_write">
								<input type="text" name="rvtxt" placeholder=" 리뷰 작성하기(50자 이내)"
									class="rr_write" maxlength="50"></label>
								<div class="rr_btn">
									<a href="javascript:addrv()">리뷰입력</a>
								</div>
							</div>
>>>>>>> branch 'master' of https://github.com/sevenget/finpjt.git

                  </form>

             </div>

         </div>

   </div>

</body>
</html>