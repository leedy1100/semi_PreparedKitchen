
function allChk(bool){
	var chks = $("input[type=checkbox]");
	for(var i = 0; i < chks.length; i++){
		chks[i].checked = bool;
	}
}

$(function(){
	
	$("input[name=mChk]").click(function(){
		var rchks = $("input[name=rChk]").length;
		var rchkl = $("input[name=rChk]:checked").length;
		var mchks = $("input[name=mChk]").length;
		var mchkl = $("input[name=mChk]:checked").length;
		var chkl = mchkl + rchkl;
		var chks = mchks + rchks;
		var all = $("input[name=all]").eq(0);
		
		if(chkl == chks){
			all.prop("checked",true);
		} else {
			all.prop("checked",false);
		}
	});
	
	$("input[name=rChk]").click(function(){
		var rchks = $("input[name=rChk]").length;
		var rchkl = $("input[name=rChk]:checked").length;
		var mchks = $("input[name=mChk]").length;
		var mchkl = $("input[name=mChk]:checked").length;
		var chkl = mchkl + rchkl;
		var chks = mchks + rchks;
		var all = $("input[name=all]").eq(0);
		
		if(chkl == chks){
			all.prop("checked",true);
		} else {
			all.prop("checked",false);
		}
	});
	
	var recipeChk = $(".recipeChk");
	
	recipeChk.click(function(){
		var me = $(this);
		var val = me.val();
		var child = $(".martChk"+val);
		
		for(var i = 0; i < child.length; i++){
			child[i].checked = me.prop("checked");
		}
		
		var rchks = $("input[name=rChk]").length;
		var rchkl = $("input[name=rChk]:checked").length;
		var mchks = $("input[name=mChk]").length;
		var mchkl = $("input[name=mChk]:checked").length;
		var chkl = mchkl + rchkl;
		var chks = mchks + rchks;
		var all = $("input[name=all]").eq(0);
		
		if(chkl == chks){
			all.prop("checked",true);
		} else {
			all.prop("checked",false);
		}
		
	});
	
	var martChk = $("input[name=mChk]");
	
	martChk.click(function(){
		var me = $(this);
		var val = me.attr("class").substring(7);
		var martLength = $(".martChk"+val).length;
		var martCLength = $(".martChk"+val+":checked").length;
		var parents = $(".recipeChk");
		var bool = "";
		
		if(martCLength == 0){
			bool = false;
		} else {
			bool = true;
		}
		
		for(var i = 0; i < parents.length; i++){
			if(parents.eq(i).val() == val){
				parents.eq(i).prop("checked",bool);
			}
		}
		
		var rchks = $("input[name=rChk]").length;
		var rchkl = $("input[name=rChk]:checked").length;
		var mchks = $("input[name=mChk]").length;
		var mchkl = $("input[name=mChk]:checked").length;
		var chkl = mchkl + rchkl;
		var chks = mchks + rchks;
		var all = $("input[name=all]").eq(0);
		
		if(chkl == chks){
			all.prop("checked",true);
		} else {
			all.prop("checked",false);
		}
		
	});
	
});

function cartPay(){
	var cartForm = $("#cartForm")
	var recipeChk = $("input[name=rChk]");
	var martChk = $("input[name=mChk]");
	var cnt = 0;
	var recipenos = "";
	var martnos = "";
	
	for(var i = 0; i < recipeChk.length; i++){
		
		if(recipeChk.eq(i).prop("checked")){
			if(cnt == 0){
				recipenos += recipeChk.eq(i).val();
				cnt++;
			} else {
				recipenos += "," + recipeChk.eq(i).val();
				cnt++;
			}
		}
	}
	cnt = 0;
	for(var i = 0; i < martChk.length; i++){
		if(martChk.eq(i).prop("checked")){
			if(cnt == 0){
				martnos += martChk.eq(i).siblings().val();
				cnt++;
			} else {
				martnos += "," + martChk.eq(i).siblings().val();
				cnt++;
			}
		}
	}
	
	if(martChk.length != 0){
		cartForm.html(cartForm.html() + "<input type='hidden' name='recipenos' value='" + recipenos + "'>" + "<input type='hidden' name='proList' value='" + martnos + "'>");
		cartForm.submit();
		
	} else {
		alert("상품을 선택해 주세요");
	}
	
}

















