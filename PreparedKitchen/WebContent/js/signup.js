$(function() {
	var idText = $("input[name=id]");
	var idSpan = $("#idchkSapn");
	var pwText = $("input[name=pw]");
	var pwConfirm = $("input[name=pwConfirm]");

	idText.blur(function() {
		var id = idText.val();
		$.ajax({
			type : "POST",
			url : "login.do?command=idchk&id=" + id,
			dataType : "text",
			success : function(data) {
				var trm = $.trim(data);
				if (trm == id) {
					idSpan.html("이미 존재하는 아이디 입니다.");
				} else {
					idSpan.html("가입 가능한 아이디 입니다.");
				}
			},
			error : function() {
				alert("통신실패")
			}
		});
	});

	pwConfirm.blur(function() {
		var pw = pwText.val();
		var pwC = pwConfirm.val();

		if (pw != pwC) {
			$("#pwSpan").html("비밀번호가 일치하지 않습니다.");
		} else {
			$("#pwSpan").html("비밀번호 일치!");
		}
	});

	$("input[name=phone1]").keyup(function() {
		var phone1 = $("input[name=phone1]");
		var length1 = phone1.val().length;
		var max1 = phone1.attr("maxlength");

		if (length1 == max1) {
			$("input[name=phone2]").focus();
		}
	});

	$("input[name=phone2]").keyup(function() {
		var phone2 = $("input[name=phone2]");
		var length2 = phone2.val().length;
		var max2 = phone2.attr("maxlength");

		if (length2 == max2) {
			$("input[name=phone3]").focus();
		}
	});

});

var ran = null;

function emailChk() {
	var email = $("input[name=email]").val() + $("#emailback").val();
	var emailSpan = $("#emailSpan");

	$.ajax({
		type : "POST",
		url : "login.do?command=emailchk&email=" + email,
		dataType : "text",
		success : function(data) {
			var trm = $.trim(data);
			if (email.length != 0) {
				if (trm == email) {
					emailSpan.html("이미 존재하는 이메일 입니다.");

				} else {
					$.ajax({
						type : "POST",
						url : "login.do?command=sendemail&email=" + email,
						dataType : "text",
						success : function(data) {
							ran = $.trim(data);
							emailSpan.html("인증번호가 발송되었습니다.");
						},
						error : function() {
							alert("통신실패")
						}
					});
				}

			} else {
				emailSpan.html("이메일을 입력해 주세요.");
			}
		},
		error : function() {
			alert("통신실패")
		}
	});
}

function emailCon() {
	var eran = $("input[name=emailConfirm]").val();
	var command = $("input[name=command]");
	var eSpan = $("#emailConSpan");

	if (ran == eran) {
		command.val("signupres");
		eSpan.html("인증완료!");
	} else {
		eSpan.html("다시 확인해주세요!");
	}
}


function searchAddr(){
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	
	            	var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    $("input[name=addr3]").val(extraAddr);
	                
	                } else {
	                	$("input[name=addr3]").val('');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("input[name=addr1]").val(addr);
	                // 커서를 상세주소 필드로 이동한다.
	                $("input[name=addr2]").focus();
	            }
	        }).open();
	    });
}
