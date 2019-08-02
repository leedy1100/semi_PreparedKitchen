$(function() {
		$('#recipelike').click(function(){
	
			$.ajax({
				url:"recipeboard.do?command=like&recipeBoard_no=${recipeBoardDto.recipeBoard_no }",	//전송할 경로
				method:"get",
				async:true,	
				dateType:"text",
				success:function(msg){
					if(msg == "nologin"){
						alert("로그인이 필요합니다.")
					}else{
						$('#favorite').text(msg);
					}
				}, error:function(request, error){
					alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
				}
			});				
		});
		
	});