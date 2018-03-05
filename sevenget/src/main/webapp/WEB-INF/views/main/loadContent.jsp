<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function fLoadData() {
		$.ajax({
			//type: "POST",
			url : "loading",//loadContent
			data : "cid=${cid}",
			success : function(resultText) {
				$('#loadData').html(resultText);
			},
			error : function() {
				alert("호출 실패 loadContent");
			}
		});
	}

	$(document).ready(function($) {
		$('#viewLoading').hide();

		$('#viewLoading').ajaxStart(function() {
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

<a style="background-color:white;" onClick="fLoadData()"> <img
	src="../resources/img/plots/${plotpng}" />
	
</a>
</head>
<body>
</body>
</html>