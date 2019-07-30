
$(function(){
	var idText = $("input[name=id]");
	var idSpan = $("#idchkSapn");
	var pwText = $("input[name=pw]");
	var pwConfirm = $("input[name=pwConfirm]");
	
	idText.blur(function(){
		var id = idText.val();
		$.ajax({
			type : "POST",
			url : "login.do?command=idchk&id="+id,
			dataType : "text",
			success : function(data){
				var trm = $.trim(data);
				if(trm == id){
					idSpan.html("이미 존재하는 아이디 입니다.");
				} else {
					idSpan.html("가입 가능한 아이디 입니다.");
				}
			},
			error : function(){
				alert("통신실패")
			}
		});
	});
	
	pwConfirm.blur(function(){
		var pw = pwText.val();
		var pwC = pwConfirm.val();
		
		if(pw != pwC){
			$("#pwSpan").html("비밀번호가 일치하지 않습니다.");
		}else{
			$("#pwSpan").html("비밀번호 일치!");
		}
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

var ran = null;

function emailChk(){
	var email = $("input[name=email]").val() + $("#emailback").val();
	var emailSpan = $("#emailSpan")
	
	$.ajax({
		type : "POST",
		url : "login.do?command=emailchk&email="+email,
		dataType : "text",
		success : function(data){
			var trm = $.trim(data);
			if(email.length != 0){
				if(trm == email){
					emailSpan.html("이미 존재하는 이메일 입니다.");
					
				} else {
					
					emailSpan.html("인증번호가 발송되었습니다.");
					
					$.ajax({
						type : "POST",
						url : "login.do?command=sendemail&email="+email,
						dataType : "text",
						success : function(data){
							ran = $.trim(data);
						},
						error : function(){
							alert("통신실패")
						}
					});
				}
				
			} else {
				emailSpan.html("이메일을 입력해 주세요.");
			}
		},
		error : function(){
			alert("통신실패")
		}
	});
}

function emailCon(){
	var eran = $("input[name=emailConfirm]").val();
	var command = $("input[name=command]");
	var eSpan = $("#emailConSpan");
	
	if(ran == eran){
		command.val("signupres");
		eSpan.html("인증완료!");
	} else {
		eSpan.html("다시 확인해주세요!");
	}
}








