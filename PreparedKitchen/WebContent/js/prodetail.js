
$(function(){
	var material = $("input[type=text]");
	
	material.click(function(){
		var me = $(this);
		
		if(me.attr("class") == "selected"){
			me.attr("class","noSelected");
		} else if(me.attr("class") == "noSelected"){
			me.attr("class","selected");
		}
	});
	
	var mList = $("#materialList");
	var rightW = $("#headerRigth").css("width");
	var rightH = $("#headerRigth").css("height");
	
	mList.css("width",rightW);
	mList.css("height",rightH);
})

function showProduct(){
	var selected = $(".selected");
	var mList = $("#materialList");
	var mProduct = $("#materialProduct");
	var str = "";
	
	for(var i = 0; i < selected.length; i++){
		if(i != selected.length-1){
			str += selected.eq(i).val() + "/";
		} else {
			str += selected.eq(i).val();
		}
	}
	
	if(str.length == 0){
		alert("재료를 선택해 주세요");
	} else {
		$.ajax({
			url : "prodetail.do?command=showproduct&mPro="+str,
			method : "post",
			success : function(msg){
				mList.html(msg);
			},
			error : function(){
				alert("통신실패");
			}
		});
	}
	
}









