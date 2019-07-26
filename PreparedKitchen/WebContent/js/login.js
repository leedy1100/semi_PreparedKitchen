
$(function(){
	var idText = $("input[name=id]");
	var idspan = $("#idchksapn");
	
	idText.blur(function(){
		var id = idText.val();
		$.ajax({
			type : "GET",
			url : "login.do?command=idchk&id="+id,
			dataType : "text",
			success : function(data){
				var trm = $.trim(data);
				if(trm == id){
					idspan.html("이미 존재하는 아이디 입니다.");
				} else {
					idspan.html("가입 가능한 아이디 입니다.");
				}
			},
			error : function(){
				alert("통신실패")
			}
		});
	});
	
	$("input[name=phone1]").keyup(function(){
		var phone1 = $("input[name=phone1]");
		var length1 = phone1.val().length;
		var max1 = phone1.attr("maxlength");
		
		if(length1 == max1){
			$("input[name=phone2]").focus();
		}
	});
	
	$("input[name=phone2]").keyup(function(){
		var phone2 = $("input[name=phone2]");
		var length2 = phone2.val().length;
		var max2 = phone2.attr("maxlength");
		
		if(length2 == max2){
			$("input[name=phone3]").focus();
		}
	});
	
});