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
$.ajaxSetup({
    type:"POST",
    async:true,
    dataType:"json",
    error:function(xhr) {
        console.log("error html = " + xhr.statusText);
    }
});

$(function() {
    $("#commentWrite").on("click", function() {
        $.ajax({
            url:"recipeComment.do",
            // data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
            data:${"#insertform"}.serialize(),
            success:function(data) {            // 서버에 대한 정상응답이 오면 실행, callback
                if(data.result == 1) {            // 쿼리 정상 완료, executeUpdate 결과
                    console.log("comment가 정상적으로 입력되었습니다.");
                    $("#commentContent").val("");
                    showHtml(data.comments, 1);
                }
            }
        })
    });
});

function showHtml(data, commPageNum) {
    let html = "<table style='margin-top: 10px;'><tbody>";
    $.each(data, function(index, item) {
        html += "<tr align='center'>";
        html += "<td>" + (index+1) + "</td>";
        html += "<td>" + item.id + "</td>";
        html += "<td align='left'>" + item.commentContent + "</td>";
        let presentDay = item.commentDate.substring(0, 10);
        html += "<td>" + presentDay + "</td>";
        html += "</tr>";
    });
    html += "</tbody></table>";
    commPageNum = parseInt(commPageNum);        // 정수로 변경
    // commentCount는 동기화되어 값을 받아오기 때문에, 댓글 insert에 즉각적으로 처리되지 못한다.
    if("${article.commentCount}" > commPageNum * 10) {
        nextPageNum = commPageNum + 1;
        html +="<input type='button' class='btn btn-default' onclick='getComment(nextPageNum, event)' value='다음 comment 보기'>";
    }
    
    $("#showComment").html(html);
    $("#commentContent").val("");
    $("#commentContent").focus();
}

function getComment(commPageNum, event) {
    $.ajax({
        url:"/bbs/commentRead.bbs",
        data:{
            commPageNum:commPageNum*10,
            articleNumber:"${article.articleNumber}"
        },
        beforeSend:function() {
            console.log("읽어오기 시작 전...");
        },
        complete:function() {
            console.log("읽어오기 완료 후...");
        },
        success:function(data) {
            console.log("comment를 정상적으로 조회하였습니다.");
            showHtml(data, commPageNum);
            
            let position = $("#showComment table tr:last").position();
            $('html, body').animate({scrollTop : position.top}, 400);        // 두 번째 param은 스크롤 이동하는 시간
        }
    })
}


</script>
</head>
<body>
	
<%-- 	<form action="recipeComment.do" method="post" id="cmtform" name="cmtform">
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
	</form> --%>
	<div style="margin-top: 10px; width: 100%;">
	<form id="insertform">
	<input type="hidden" name="comment_order" value="1"/>
	<input type="hidden" name="comment_tab" value="0"/>
	<input type="hidden" name="recipeBoard_no" value="${recipeBoardDto.recipeBoard_no }"/>
	<input type="hidden" name="" value=""/>
    <textarea rows="3" id="commentContent" name="comment_content" placeholder="댓글을 입력하세요." style="width: 100%;" ></textarea>
        <c:if test="${memberDto.id == null}">
            <input type="button" class="btn btn-default" value="댓글 쓰기" disabled="disabled">
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