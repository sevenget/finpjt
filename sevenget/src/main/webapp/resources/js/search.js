$(function(){
		$('#searchHolder form').submit(function(){
			$('div.search_ad').hide('slow');
			$('')
		});
		
		$('#searchBtn').click(function(){
			$('#searchHolder form').submit();
		});
		
		$('.companylogo').click(function(){
		 	if('${id}'=='Guest'){
				alert('상세정보를 보려면 로그인이 필요합니다.')
			} else{
				location.href="mypage2";		
			}
		});
		
});
