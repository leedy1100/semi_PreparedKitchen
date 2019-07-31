<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		$('#recipeCmt').click(function(){
			
			var queryString = $("form[name=cmtform]").serialize();
			
			$.ajax({
				url:"recipeComment.do",	//전송할 경로
				data : queryString,
				method:"post",	//전송방식 get(), post()
				async:true,		// 비동기(default)
				dateType:"json",	//전송받을 datatype : xml,json,html,script
				success:function(data){	//통신에 성공했을 때
					$(data).each(function() {
						var str = this.comment_content;
					});
					
				}, error:function(request, error){	//통신에 실패했을 때
					alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
				}
			});				
				$("#cmtid").html(str);
		});
		
	});
	
	$(function() {
		getCommentList();
	});
	
	function getCommentList(){
		$.ajax({
			type:"GET",
			url:"recipeComment.do",
			dataType:"json",
			data:$("#cmtform").serialize(),
			success:function(data){
				
				}
			}
				
		});
	}
	
</script>
</head>
<body>
	
	<form action="recipeComment.do" method="post" id="cmtform" name="cmtform">
		<input type="hidden" name="command" value="cmt" />
		<input type="hidden" name="recipeBoard_no" value="${recipeBoardDto.recipeBoard_no }"/>
		<input type="hidden" name="comment_order" value="1"/>
		<input type="hidden" name="comment_tab" value="0"/>
		<table border="1">
			<tr>
				<td>
					<textarea rows="5" cols="60" name="comment_content"></textarea>
				</td>
				<td>
					<input type="submit" value="작성" id="recipeCmt"/>
				</td>
			</tr>
		</table>
	</form>
	
	<table border="1">
		<tr>
			<td colspan="2">
				아이디:<div id="cmtid">ㅎㅎ</div> 
			</td>
			<td colspan="2">
				<textarea rows="5" cols="60" id="cmtcontent"></textarea>
			</td>
			<td id="cmtregdate">
				작성날짜
			</td>
			<td>
				<input type="button" value="수정" onclick="location.href=''"/>
				<input type="button" value="삭제" onclick="location.href=''"/>
			</td>
		</tr>
	</table>
	 <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</body>
</html>