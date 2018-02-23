<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 분석 페이지</title>

<link rel="stylesheet" type="text/css"
   href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" type="text/css"
   href="../resources/css/loading.css " media="all" flush="false">
<link rel="stylesheet" type="text/css"
   href="../resources/css/detail.css" media="all">
<link rel="stylesheet" type="text/css"
   href="../resources/css/portside.css" media="all">
<link rel="stylesheet" type="text/css"
   href="../resources/css/lightbox.css" media="all">
<link rel="stylesheet" type="text/css"
   href="../resources/css/review.css" media="all">

<script
   src="${pageContext.request.contextPath}/resources/js/index/jquery-1.11.1.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>

<script type="text/javascript">
   function openContent() {

      $('.mw_layer').addClass('open');

      $.ajax({
         type : 'get',
         url : 'review',
         data : "",
         success : function(resultText) {
            $('#layer').html(resultText);
         }
      })

   }

   jQuery(function($) {

      var layerWindow = $('.mw_layer');

      // ESC Event
      $(document).keydown(function(event) {
         if (event.keyCode != 27)
            return true;
         if (layerWindow.hasClass('open')) {
            layerWindow.removeClass('open');
         }
         return false;
      });

      // Hide Window
      layerWindow.find('>.bg').mousedown(function(event) {
         layerWindow.removeClass('open');
         return false;
      });
   });

   /*    function review_list() {
    window.open("review", "_blank",
    "width=950,height=500,resizable=1,scrollbars=1");
    } */
</script>

<script>
function fLoadData()
{
   $.ajax({
      //type: "POST",
      url: "loading",//loadContent
      data: "",
      success: function(resultText)
      {
         $('#loadData').html(resultText);
      },
      error: function() {
         alert("호출 실패");
      }
   });
}


$(document).ready(function($)
{
   $('#viewLoading').hide();

   $('#viewLoading')
   .ajaxStart(function()
   {
      $('#viewLoading').css('position', 'absolute');
      $('#viewLoading').css('left', $('#loadData').offset().left);
      $('#viewLoading').css('top', $('#loadData').offset().top);
      $('#viewLoading').css('width', $('#loadData').css('width'));
      $('#viewLoading').css('height', $('#loadData').css('height'));

      $(this).show();
      //$(this).fadeIn(500);
   })
/*    .ajaxStop(function()
   {
      $(this).hide();
      $(this).fadeOut(500);
   }); */
});
      
</script>

<script type="text/javascript">
   function addrep() {
      repform.submit();
    }
</script>


<style type="text/css">
.mw_layer {
   display: none;
   position: fixed;
   _position: absolute;
   top: 0;
   left: 0;
   z-index: 10000;
   width: 100%;
   height: 100%
}

.mw_layer.open {
   display: block
}

.mw_layer .bg {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: #000;
   opacity: .5;
   filter: alpha(opacity = 50)
}

#layer {
   position: absolute;
   top: 40%;
   left: 35%;
   width: 950px;
   height: 500px;
   margin: -150px 0 0 -194px;
   padding: 28px 28px 0 28px;
   border: 2px solid #555;
   background: #fff;
   font-size: 12px;
   font-family: Tahoma, Geneva, sans-serif;
   color: #767676;
   line-height: normal;
   white-space: normal
}
</style>

</head>
<body>


   <div id="head">
      <%@ include file="/WEB-INF/views/include/header.jsp"%>
   </div>

   <div id="all">
      <div id=contect">

         <!-- 여기 안에다 작업하시면 돼요 -->
         <div class="container2">


            <div class="left">
					<%@ include file="/WEB-INF/views/include/portside.jsp"%>
	 			</div>
             
             
             <div class="right">
                
                <div class="sevenpo"> 
                   <p class="head_rv">7포</p>   
                   <hr width="915px" color="#aaa" size="1" class="dt_hr">
                   
                   
                   <div class="company">
                      <div class="graph">
                         <div class="graph_img">
                            <!-- 버튼 클릭시 로딩 화면 5초/R작동, 결과출력 -->

                           <a onClick="fLoadData()">
                           <div id="loadData" style="width: 502px; height: 400px; margin-top: 20px; /* border: 1px solid #CCCCCC; */ background: #EFEFEF; display:inlne;">
                          <p> 호출 </p>
                           </div></a>
                          <!--  <div style="margin-top: 20px; display:inline;">
                              <input type="button" value="호출" onClick="fLoadData()" />
                           </div> -->
                         </div>
                      </div>
                   
                      <div class="c_info">
                         
                         <div class="c_heart">♥</div>
                         <div class="c_name">(주)카카오</div>
                         <div class="c_information">
                            <!-- 상세 정보  들어가는 곳 -->
                         </div>
                         
                      </div>
                   
                      <div class="c_result">
                         <!-- <p class="marks">"</p> -->
                         <img src="../resources/img/marks1.png" class="marks" width:>
                         <p class="get">내 집 마련, 꿈, 희망</p>
                         <p class="ex">을 득하고, </p>
                         <p class="lose">연애, 결혼, 출산, 인간관계</p>
                         <p class="ex">를 포기하였습니다.</p>
                         <!-- <p class="marks">"</p> -->
                         <img src="../resources/img/marks2.png" class="marks">
                      </div>
                   
                   </div>
                   
                </div>   
                
                


               <div class="review">
                  <p class="head_rv">
                     <a href="#layer" onclick="openContent('${article.idx}')">리뷰</a>
                  </p>
                  <hr width="915px" color="#aaa" size="1" class="dt_hr">

                  <form action="" method="post" enctype="" name="">
                     <div class="c_review">

                        <div class="review1">
                           <p class="cr_view">"기술직이 자신의 능력만큼 대우 받을 수 있는 회사. 대한민국에서
                              만족스러운 수준의 워라벨."</p>
                           <p class="cr_date">2018/02/07</p>
                        </div>

                        <div class="review2">
                           <p class="cr_view">"개발자가 그나마 다른 회사에 비해 HOW에 집중 할 수 있다."</p>
                           <p class="cr_date">2018/01/14</p>
                        </div>

                        <div class="review3">
                           <p class="cr_view">"국내에서 IT관련 모든 직군을 경험해 볼 수 있는 몇 안되는 좋은 회사
                              입니다."</p>
                           <p class="cr_date">2018/01/11</p>
                        </div>

                     </div>

                     <div class="c_write">
                        <input type="text" placeholder=" 리뷰 작성하기(50자 이내)"
                           class="cr_write" maxlength="50"></label> <input type="submit"
                           value="리뷰입력" class="cr_btn"></label>
                     </div>
                  </form>

                  <!-- light box -->

                  <div class="mw_layer">

                     <div class="bg"></div>

                     <div id="layer">
                        <%-- <%@ include file="/WEB-INF/views/main/review.jsp"%> --%>
                     </div>

                  </div>



               </div>


            </div>

         </div>

      </div>
   </div>



</body>
</html>