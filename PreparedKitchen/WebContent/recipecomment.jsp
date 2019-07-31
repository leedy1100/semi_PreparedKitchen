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

// Perform an asynchronous HTTP (Ajax) request.
// 비동기 통신 Ajax를 Setting한다.

$(function() {
	
	var str = $("#insertform").serialize();
	
	$("#commentWrite").click(function() {
        $.ajax({
            url:"recipeComment.do",
            data:str,
            // data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
            success:function(data) {            // 서버에 대한 정상응답이 오면 실행, callback
				alert(data);
            } 
        });
    });
});


</script>
</head>
<body>
	
	<div style="margin-top: 10px; width: 100%;">
	<form action="recipeComment.do" method="post" id="insertform">
	<input type="hidden" name="command" value="cmt"/>
	<input type="hidden" name="comment_order" value="1"/>
	<input type="hidden" name="comment_tab" value="0"/>
	<input type="hidden" name="recipeBoard_no" value="${recipeBoardDto.recipeBoard_no }"/>
    <textarea rows="3" name="comment_content" placeholder="댓글을 입력하세요." style="width: 100%;">sdafgag</textarea>
        <c:if test="${memberDto.id == null}">
        </c:if>
        <c:if test="${memberDto.id != null}">
            <input type="button" value="댓글 쓰기" id="commentWrite">
        </c:if>
        <input type="button" value="댓글 읽기()" 
                onclick="getComment(1, event)" id="commentRead">
       </form> 
</div>
 
<!-- Comment 태그 추가 -->
<div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
    <div id="showComment" style="text-align: center;"></div>
</div>


</body>
</html>