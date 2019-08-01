<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
	
		$.ajax({
	        url:"recipeComment.do?command=cmtread&recipeBoard_no=${recipeBoardDto.recipeBoard_no }",
	        dataType:"text",
	        // data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
	        success:function(data) {// 서버에 대한 정상응답이 오면 실행, callback
				
	        		var jdata =JSON.parse(data);
	        		var jdata2 = jdata.comments;
					console.log("comment 정상입력");
					$("#comment_content").val("");
					showAllCmt(jdata2);
				
	        },error:function(request, error){	//통신에 실패했을 때
				alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
			}
	        
	    });
		
	
	
	$("#commentWrite").click(function() {
		
		var str = $("#insertform").serialize();
		
        $.ajax({
            url:"recipeComment.do",
            data:str,
            dataType:"text",
            // data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
            success:function(data) {// 서버에 대한 정상응답이 오면 실행, callback
				if(data == "comment null"){
					alert("댓글을 입력해주세요.")
				}else if(data != null){
            		var jdata =JSON.parse(data);
            		var jdata2 = jdata.result;
					console.log("comment 정상입력");
					$("#comment_content").val("");
					showAllCmt(jdata2);
				}
            },error:function(request, error){	//통신에 실패했을 때
				alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
			}
            
        });
    });
});


	function showCmt(data) {
		var html = "<table border='1'>";
			if(data == null){
				$("#comment_content").text("댓글이 없습니다.");
			}else{
			for (var i = 0; i < data.length; i++) {

				html += "<tr>";
				html += "<td>" + data[i].id + "</td>";
				html += "<td>" + data[i].comment_content + "</td>";
				html += "<td>" + data[i].comment_regdate + "</td>";
				html += "</tr>";
			}

			html += "</table>";

			$("#showComment").html(html);
			$("#commentContent").val("");
			$("#commentContent").focus();
		}
	}
	
	function showAllCmt(data) {
		var html = "<table border='1'>";
			if(isEmpty(data)){
				$("#showAllComment").text("작성된 댓글이 없습니다");
			}else{
			for (var i = 0; i < data.length; i++) {

				html += "<tr>";
				html += "<td>" + data[i].id + "</td>";
				html += "<td>" + data[i].comment_content + "</td>";
				html += "<td>" + data[i].comment_regdate + "</td>";
				html += "</tr>";
			}

			html += "</table>";

			$("#showAllComment").html(html);
			$("#commentContent").val("");
			$("#commentContent").focus();
		}
	}
	
</script>
</head>
<body>
	
	<div style="margin-top: 10px; width: 100%;">
	<form action="recipeComment.do" method="post" id="insertform">
	<input type="hidden" name="command" value="cmt"/>
	<input type="hidden" name="comment_order" value="1"/>
	<input type="hidden" name="comment_tab" value="0"/>
	<input type="hidden" name="recipeBoard_no" value="${recipeBoardDto.recipeBoard_no }"/>
    <textarea rows="3" id="comment_content" name="comment_content" placeholder="댓글을 입력하세요." style="width: 100%;"></textarea>
        <c:if test="${memberDto.id == null}">
        </c:if>
        <c:if test="${memberDto.id != null}">
            <input type="button" value="댓글 쓰기" id="commentWrite">
        </c:if>
       </form> 
</div>
 
<!-- Comment 태그 추가 -->
<div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
    <hr/>
    <div id="showAllComment" style="text-align: center;"></div>
</div>


</body>
</html>