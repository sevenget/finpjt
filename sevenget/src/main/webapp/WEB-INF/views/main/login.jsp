<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7Get - Login</title>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" type="text/css" href="../resources/css/login.css?ver=55" media="all">
<script src='https://code.jquery.com/jquery-3.0.0.min.js'></script>

<script src="../resources/js/jquery-1.11.1.min.js"></script>
<!--1. 제이쿼리(이미 페이지에서 로드했다면 추가안하셔도 됩니다.) -->

<script src="../resources/js/video.js"></script>
<!--2. 비디오를 웹브라우저에 노출하기 위한 플러그인입니다. 비디오 재생 플레이어의 일종이라 생각하시면 됩니다.-->

<script src="../resources/js/bigvideo.js"></script>
<!--3. 비디오나 이미지를 풀사이즈로 넣는 플러그인입니다. -->

<script src="../resources/js/imagesloaded.pkgd.min.js"></script>
<!-- 4. 비디오가 아닌 이미지로 풀사이즈일 경우 bigvideo.js에서 이 파일을 호출하게 됩니다. -->


</head>
<body>


	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
	</div>

	<div id="all">
		<div id="contect">

			<!-- 여기 안에다 작업하시면 돼요 -->
			<div class="container4">
				<div id="regiHead">
					<!-- <img src="../resources/img/mainad.gif">  -->
					<h3 id="header">빅데이터 분석을 통해 잃어버린 7가지를 되찾아주는 기업 정보 분석 플랫폼</h3>
				</div>


				<div id="regiMain">
					<article id="BigWrap">

						<!-- 로그인 --><!-- <a class="at_v"> -->
						<!-- <form id="login_form" class="login1" action="loginCheck">
							<table class="login">
								<tr>
									<td><input id="id" name="id" type="text" placeholder="아이디"></td>
									<td rowspan=2><input id="login" type="submit" value="로그인"></td>
									일단 로그인 버튼 누르면 무조건 메인페이지로 이동하게 만들어뒀어요!!
								</tr>
								<tr>
									<td><input id="pw" name="pw" type="password"
										placeholder="비밀번호"></td>
								</tr>
								<tr>
									<td colspan="2"><button id="facebook"
											onclick="alert('준비중'); return false;">
											<img src="../resources/img/f.png" class="face_logo">페이스북
											아이디로 로그인
										</button></td>
								</tr>
								<tr>
									<td colspan="2"><button id="guest"
											onclick="location.href='loginCheck?id=Guest&pw=Guest'; return false;">
											비로그인으로 둘러보기</button></td>
								</tr>
								<tr>
									<td colspan="2"><button id="submit"
											onclick="location.href='register'; return false;">회원가입</button></td>
									회원가입 버튼 누르면 회원가입페이지로 넘어가게 수정 완료.
								</tr>
							</table>
						</form></a> -->

						<!-- 배경 영상 -->
						<!-- <div class="adgif">
                  <img src="../resources/img/1gif.gif">
               </div> -->
						<div id="videoEle"></div>
					</article>
					<script>
						window.mobilecheck = function() {
							var check = false;
							(function(a) {
								if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i
										.test(a)
										|| /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i
												.test(a.substr(0, 4)))
									check = true;
							})(navigator.userAgent || navigator.vendor
									|| window.opera);
							return check;
						};

						var BV = new $.BigVideo({
							useFlashForFirefox : false,
							container : $('#videoEle')
						});
						// 비디오나 배경을 노출할 엘리먼트를 선택합니다. $('#videoEle')는 html 태그중에 <div id="videoEle"></div> 를 말하는 것입니다.
						BV.init();
						if (mobilecheck()) {
							/*  BV.show('./file/SampleVideo.jpg'); */
							//모바일일 경우 비디오 대신 대체할 이미지입니다.
						} else {
							BV.show({
								type : "video/mp4",
								src : "../resources/img/7get.mp4",
								doLoop : true
							}, {
								type : "video/webm",
								src : "../resources/img/7get.webm",
								doLoop : true
							}, {
								type : "video/ogv",
								src : "../resources/img/7get.ogv",
								doLoop : true
							});
							//웹브라우저마다 지원하는 비디오 형식이 다르기 때문에 다양하게 만들어서 제공해야합니다. 변환은 다음팟인코더나, 카카오인코더를 이용하세요. 
							//옵션중에 doLoop는 영상 반복을 의미합니다. true는 영상 반복, false는 반복 안함입니다.
							BV.getPlayer().volume(0);
							//사운드를 0 즉 음소거 상태로 만듭니다. 
						}
					</script>
						
						
				</div>
			</div>
		</div>
	</div>



</body>
</html>