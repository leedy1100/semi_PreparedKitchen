$(function() {
	
		$.ajax({
	        url:"recipeComment.do?command=cmtread&recipeBoard_no=${recipeBoardDto.recipeBoard_no }",
	        dataType:"text",
	        success:function(data) {
				
	        		var jdata =JSON.parse(data);
	        		var jdata2 = jdata.comments;
					console.log("comment 정상입력");
					$("#comment_content").val("");
					showAllCmt(jdata2);
				
	        },error:function(request, error){
				alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
			}
	        
	    });
		
	
	
	$("#commentWrite").click(function() {
		
		var str = $("#insertform").serialize();
		
        $.ajax({
            url:"recipeComment.do",
            data:str,
            dataType:"text",
            success:function(data) {
				if(data == "comment null"){
					alert("댓글을 입력해주세요.")
				}else if(data != null){
            		var jdata =JSON.parse(data);
            		var jdata2 = jdata.result;
					console.log("comment 정상입력");
					$("#comment_content").val("");
					showAllCmt(jdata2);
				}
            },error:function(request, error){
				alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
			}
            
        });
    });
});
	
	function showAllCmt(data) {
			if($.isEmptyObject(data)){
				
				$("#showAllComment").text("작성된 댓글이 없습니다");
				$("#commentContent").val("");
				$("#commentContent").focus();
			}else{
			var html = "<table>";
			
			for (var i = 0; i < data.length; i++) {

				html += "<tr>";
				html += "<td style='width:10%;'>" + data[i].id + "</td>";
				html += "<td style='width:80%; text-align:left;'>" + data[i].comment_content + "</td>";
				html += "<td style='width:20%;'>" + data[i].comment_regdate + "</td>";
				html += "</tr>";
			}

			html += "</table>";

			$("#showAllComment").html(html);
			$("#commentContent").val("");
			$("#commentContent").focus();
		}
	}
	