<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.form.min.js"></script>
<!-- include summernote css/js-->
<link href="summernote/dist/summernote.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="summernote/dist/summernote.js"></script>
<script type="text/javascript" src="summernote/dist/lang/summernote-ko-KR.js"></script>
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
        // 파일 전송을 위한 폼생성
 		data = new FormData();
 	    data.append("uploadFile", file);
 	    $.ajax({ // ajax를 통해 파일 업로드 처리
 	        data : data,
 	        type : "POST",
 	        url : "recipeboard.do?command=imgupload",
 	        cache : false,
 	        contentType : false,
 	        enctype: 'multipart/form-data',
 	        processData : false,
 	        success : function(data) { // 처리가 성공할 경우
                // 에디터에 이미지 출력
 	        	$(editor).summernote('editor.insertImage', data.url);
 	        }
 	    });
 	}
	
</script>
</head>
<body>

	 <div class="container">
    <h1 class="page-header">Summernote Sample</h1>
    <form action="recipeboard.do" method="post" class="form-horizontal">
    <input type="hidden" name="command" value="insertres">
      <div class="form-group">
      	<input type="text" class="form-control" name="myname" placeholder="이름을 입력하세요"/>
      </div>	
      <div class="form-group">	
      	<input type="text" class="form-control" name="mytitle" placeholder="제목을 입력하세요"/>
      </div>
      <div class="form-group">
          <textarea name="mycontent" id="summernote"></textarea>
      </div>
      <div class="form-group">
          <button type="submit" class="btn btn-default">Save</button>
          <input type="button" value="List" class="btn btn-default" onclick="location.href='recipeboard.do?command=list'"/>
      </div>
    </form>
  </div>
</body>

</body>
</html>