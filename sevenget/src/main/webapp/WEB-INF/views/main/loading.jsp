<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language='javascript'>
  cnt = 5; // 카운트다운 시간 초단위로 표시
  function countdown() {
   if(cnt == 0){
          // 시간이 0일경우
          
        $.ajax({
		//type: "POST",
		url: "mplot",//loadContent
		data: "",
		success: function(resultText)
		{
			$('#loadData').html(resultText);
			console.log("loading cid : "+${cid});
		},
		error: function() {
			alert("호출 실패 loading");
		}
	}); 
          
         //locateKap();
   }else {
         // 시간이 남았을 경우 카운트다운을 지속한다.
        document.all.choonDiv.innerHTML = cnt + "초후에 loadContent 페이지로 이동이 됩니다..";
        setTimeout("countdown()",1000); // 1초마다 -1씩 됨.
  		cnt--;
  		console.log(cnt);
   }
  }
  function locateKap(){
	  location.replace("loadContent");
	}
/*  function Mplot(){
 	  alert("Mplot");
	  $.ajax({
		//type: "POST",
		url : "mplot",//loadContent
		data : "cid=${cid}",
		success : function(resultText) {
			$('#loadData').html(resultText);
			console.log("왜 안되는 건데.. mplot cid : "+${cid});
		},
		error : function() {
			alert("호출 실패 detailpage2");
		}
	});
  } */
</script>
<title>Insert title here</title>
</head>
<body>
	<!--  onLoad="Timer();" -->
	<!--  onLoad="Mplot();" -->
	<div id="choonDiv" style="margin-top:40px; margin-bottom:40px;"></div>

	<script>countdown();</script>
	<div class="loading-container">
		<div class="loading"></div>
		<div id="loading-text">loading</div>
	</div>
		<div class ="choonDiv2" style="margin-top:40px; margin-bottom:40px;">기업 내외부의 정보를 당신에게 딱 맞게 분석하고 있습니다<br>치킨보다 빠르다... 맞춤 정보 배달 중..!</div>
</body>
</html>