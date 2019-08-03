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
<style type="text/css">
.cmttable td{
	border: 1px solid rgba(0, 0, 0, .2);
}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

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
				}else if(data > 0){
					cmtList();
				}
	        },error:function(request, error){
				alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
			}
	        
	    });
	});
	
});

function deleteCmtfn(cmtno) {
	
	 if (confirm("삭제하시겠습니까?") == true){
		$.ajax({
	        url:"recipeComment.do?command=deleteCmt&comment_no="+cmtno,
	        dataType:"text",
	        success:function(data) {
	        	if(data > 0){
	        		cmtList();
	        	}else{
	        		alert("삭제 실패");
	        	}
	        },error:function(request, error){
				alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
			}
	    });
	 }else{ 
	     return false;
	 }
	
}

function updateCmtfn(cmtno,cmtcontent) {
	
	var html = "<tr>";
	html += "<td style='border:none;' colspan='3'><textarea rows='3' id='updatecnt' style='width: 99%;'>"+cmtcontent+"</textarea></td>";
	html += "<td style='border:none;'><input type='button' value='저장' onclick='update("+cmtno+","+"$(\""+"#updatecnt\""+").val()"+")'/>";
	html += "<input type='button' value='취소' onclick='cmtList()'/></td>";
	html += "</tr>";

	$('#'+cmtno).empty();
	$('#'+cmtno).unwrap().wrap(html);
	
			
}

function cmtList() {
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
}

function update(cmtno,cmtcontent) {
	if (confirm("저장하시겠습니까?") == true){
	 	$.ajax({
	        url:"recipeComment.do?command=updateCmt&comment_no="+cmtno+"&comment_content="+cmtcontent,
	        dataType:"text",
	        success:function(data) {
	        	if(data > 0){
	        		cmtList();
	        	}else{
	        		alert("저장 실패");
	        		cmtList();
	        	}
	        },error:function(request, error){
				alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
			}
	    });
	}else{
		return false;
	}
}	

function showAllCmt(data) {
		if($.isEmptyObject(data)){
			
			$("#showAllComment").html("<p>작성된 댓글이 없습니다</p>");
			$("#commentContent").val("");
			$("#commentContent").focus();
		}else{
		var	html = "<table class='cmttable' >";
		
		for (var i = 0; i < data.length; i++) {
			
			var id = "${memberDto.id}";
			var cmtId = data[i].id;
			var boo = (id == cmtId);
			html += "<tr id='"+data[i].comment_no+"'>";
			html += "<td style='width:10%;'>"+data[i].id + "</td>";
			html += "<td style='width:80%; text-align:left;'>" + data[i].comment_content + "</td>";
			html += "<td style='width:20%;'>" + data[i].comment_regdate + "</td>";
			if(boo){
				html += "<td style='border:none;'><input type='button' value='수정' onclick='updateCmtfn("+data[i].comment_no+",\""+data[i].comment_content+"\")'/>";
				html += "<input type='button' value='삭제' onclick='deleteCmtfn("+data[i].comment_no+")'/></td>";
			}
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
	<input type="hidden" name="command" value="insertcmt"/>
	<input type="hidden" name="comment_order" value="1"/>
	<input type="hidden" name="comment_tab" value="0"/>
	<input type="hidden" name="recipeBoard_no" value="${recipeBoardDto.recipeBoard_no }"/>
    <textarea rows="3" id="comment_content" name="comment_content" placeholder="댓글을 입력하세요." style="width: 100%;"></textarea>
        <c:if test="${memberDto.id != null}">
            <input type="button" value="댓글 쓰기" id="commentWrite">
        </c:if>
       </form>
</div>

<div style="margin-top: 10px; width: 100%;">
    <hr/>
    <div id="showAllComment" style="text-align: center;">
    </div>
</div>


</body>
</html>