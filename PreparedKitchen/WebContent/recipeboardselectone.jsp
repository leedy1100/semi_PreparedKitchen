<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/base.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
/*
	$(function(){
		var content = removeHTML("${dto.mycontent}");
		$('#content').text(content);
	});	
		
	function removeHTML(text) {
		var text = text.replace(/<p>/gi,'<br>')
		var text = text.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
		var text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
		var text = text.replace(/&nbsp;/gi,'');
		
		return text;	
	}
*/

	$(function() {
		$('#recipelike').click(function(){
	
			$.ajax({
				url:"recipeboard.do?command=like&recipeBoard_no=${recipeBoardDto.recipeBoard_no }",	//전송할 경로
				method:"get",	//전송방식 get(), post()
				async:true,		// 비동기(default)
				dateType:"text",	//전송받을 datatype : xml,json,html,script
				//data{"key","value"}	//서버에 전송할 데이터
				success:function(msg){	//통신에 성공했을 때
			
					$('#favorite').text(msg);
				
				}, error:function(request, error){	//통신에 실패했을 때
					alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
				}
			});				
		});
		
	});

</script>
</head>
<body>
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp"%>
	</header>
	<section>
		<h1>selectOne</h1>

		<table border="1">
			<tr>
				<th>번호</th>
				<td colspan="2">${recipeBoardDto.recipeBoard_no }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan="2">${recipeBoardDto.id }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="2">${recipeBoardDto.recipeBoard_title }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td colspan="2">${recipeBoardDto.recipeBoard_readCount }</td>
			</tr>
			<tr>
				<th>좋아요</th>
				<td id="favorite" style="width: 50px">${recipeBoardDto.recipeBoard_like }</td>
				<td><input type="button" value="좋아요" id="recipelike" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2">${recipeBoardDto.recipeBoard_content }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td colspan="2">${recipeBoardDto.recipeBoard_regdate }</td>
			</tr>
			<tr>
				<td colspan="3"><input type="button" value="수정"
					onclick="location.href='recipeboard.do?command=update&recipeBoard_no=${recipeBoardDto.recipeBoard_no}'" />
					<input type="button" value="삭제"
					onclick="location.href='recipeboard.do?command=delete&recipeBoard_no=${recipeBoardDto.recipeBoard_no}'" />
					<input type="button" value="목록"
					onclick="location.href='recipeboard.do?command=search&searchFiled=${paging.searchFiled}&searchValue=${paging.searchValue}'" />
				</td>
			</tr>
		</table>
	</section>
	<%@ include file="static/remocon.jsp"%>
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp"%>
	</footer>
</body>
</html>