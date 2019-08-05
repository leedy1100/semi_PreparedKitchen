
function forgotId(){
	var name = $("#name").val();
	var email = $("#email").val();
	var span = $("#forgotIdSpan");
	
	$.ajax({
		type : "POST",
		url : "login.do?command=forgotid&name="+name+"&email="+email,
		dataType : "text",
		success : function(data) {
			var trm = $.trim(data);
			if (trm != "noid") {
				span.html("회원님의 아이디는 : "+trm);
			} else {
				span.html("입력하신 정보의 아이디가 없습니다.");
			}
		},
		error : function() {
			alert("통신실패")
		}
	});
}

function forgotPw(){
	var id = $("#id").val();
	var name = $("#name2").val();
	var email = $("#email2").val();
	var span = $("#forgotPwSpan");
	
	$.ajax({
		type : "POST",
		url : "login.do?command=forgotpw&id="+id+"&name="+name+"&email="+email,
		dataType : "text",
		success : function(data) {
			var trm = $.trim(data);
			if(trm != "nopw"){
				alert("메일로 들어가셔서 비밀번호를 바꿔주세요");
				self.close();
			} else {
				span.html("입력하신 정보의 아이디가 없습니다.");
			}
		},
		error : function() {
			alert("통신실패")
		}
	});
}

$(function(){
	$("#pwC").blur(function(){
		var pw = $("input[name=pw]").val();
		var pwC = $("input[name=pwConfirm]").val();
		var pwSpan = $("#pwSpan");
		var command = $("input[name=command]");
		
		if(pw.length != 0){
			if(pw == pwC){
				pwSpan.html("비밀번호 일치!");
				command.val("updatepw");
			} else {

				pwSpan.html("비밀번호 불일치!");
				command.val("noConfirmPw");
			}
		} else {
			alert("비밀번호를 입력해주세요");
			command.val("noConfirmPw");
		}
		
	});
})