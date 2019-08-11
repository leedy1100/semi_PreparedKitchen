<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성게시판</title>
<style type="text/css">
.container1{
	margin: 0px auto;
	width: 800px;	
}
</style>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- include summernote css/js -->
<link href="summernote/dist/summernote.css" rel="stylesheet">
<link rel="stylesheet" href="static/base.css" />

</head>
<body>
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp"%>
	</header>
	<section style="min-height: 500px;">
		<div class="container1">
			<div class="page-header" style="width: 770px; font-weight: 1000; font-size: 20px;">자신의 레시피를 추천해주세요</div>
			<form action="recipeboard.do" method="post" class="form-horizontal" style="width: 800px;">
				<input type="hidden" name="command" value="insertres">
				<div class="form-group" style="width: 800px;">
					<input type="text" class="form-control" name="id" value="${memberDto.id }" readonly="readonly" />
				</div>
				<div class="form-group" style="width: 800px;">
					<input type="text" class="form-control" name="recipeBoard_title"
						placeholder="제목을 입력하세요" />
				</div>
				<div class="form-group" style="width: 800px;">
					<textarea name="recipeBoard_content" id="summernote"></textarea>
				</div>
				<div class="form-group"> 
					<input type="submit" value="저장" class="btn btn-default">
					<input type="button" value="목록" class="btn btn-default"
						onclick="location.href='recipeboard.do?command=list'" />
				</div>
			</form>
		</div>
	</section>
	<%@ include file="static/remocon.jsp"%>
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp"%>
	</footer>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="summernote/dist/summernote.js"></script>
<script src="summernote/dist/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">

	
	$(function() {
		
	 	 $('#summernote').summernote({
		  height: 300,                 
          minHeight: null,           
          maxHeight: null,            
          focus: true,               
          lang : 'ko-KR',
          toolbar: [
        	    ['style', ['bold', 'italic', 'underline', 'clear']],
        	    ['font', ['strikethrough', 'superscript', 'subscript']],
        	    ['fontsize', ['fontsize']],
        	    ['color', ['color']],
        	    ['para', ['ul', 'ol', 'paragraph']],
        	    ['height', ['height']],
        	    ['insert', ['link', 'picture']],
        	  ],
         callbacks: {
           onImageUpload: function(files, editor, welEditable) {
        	   console.log(files);
	        	  console.log(editor);
	        	  console.log(welEditable);
           	for (var i = files.length - 1; i >= 0; i--) {
              sendFile(files[i], this);
            }
          }
        }
	  });
	});

	function sendFile(file, editor) {
 		data = new FormData();
 	    data.append("uploadFile", file);
 	    $.ajax({
 	        data : data,
 	        type : "POST",
 	        url : "recipeboard.do?command=imgupload",
 	        cache : false,
 	        contentType : false,
 	        enctype: 'multipart/form-data',
 	        processData : false,
 	        success : function(data) {
 	        	$(editor).summernote('editor.insertImage', data.url);
 	        }
 	    });
 	}
	
</script>
</body>
</html>