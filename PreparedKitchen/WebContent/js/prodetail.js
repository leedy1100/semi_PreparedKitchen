
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
})

function conf(){
	var selected = $(".selected");
	var str = "";
	
	for(var i = 0; i < selected.length; i++){
		if(i != selected.length-1){
			str += selected.eq(i).val() + "/";
		} else {
			str += selected.eq(i).val();
		}
	}
	alert(str);
}