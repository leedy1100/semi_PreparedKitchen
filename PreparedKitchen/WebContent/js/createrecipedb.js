
$(function(){
	getJsonInfo();
	getJsonContent();
	getJsonMaterial();
})

function getJsonInfo(){
	$.getJSON("/PreparedKitchen/json/recipeInfo.json",function(infoData){
		$.ajax({
			url : "/PreparedKitchen/product.do?command=createdbinfo",
			method : "post",
			data : {"info" : JSON.stringify(infoData)},
			success : function(msg){
				alert(msg);
			},
			error : function(){
				alert("info 통신실패")
			}
		});
		
	});
}

function getJsonContent(){
	$.getJSON("/PreparedKitchen/json/recipeContent.json",function(conData){
		$.ajax({
			url : "/PreparedKitchen/product.do?command=createdbcon",
			method : "post",
			data : {"con" : JSON.stringify(conData)},
			success : function(msg){
				
			},
			error : function(){
				alert("content 통신실패");
			}
		});
	});
}

function getJsonMaterial(){
	$.getJSON("/PreparedKitchen/json/recipeMaterial.json",function(matData){
		$.ajax({
			url : "/PreparedKitchen/product.do?command=createdbmat",
			method : "post",
			data : {"mat" : JSON.stringify(matData)},
			success : function(){
				
			},
			error : function(){
				alert("material 통신실패");
			}
		});
	});
}



// recipeInfo - {"RECIPE_ID":"레시피 코드"},{"RECIPE_NM_KO":"레시피 이름"},{"SUMRY":"간략(요약) 소개"},{"NATION_CODE":"유형코드"},{"NATION_NM":"유형분류"},{"TY_CODE":"음식분류코드"},
//				{"TY_NM":"음식분류"},{"COOKING_TIME":"조리시간"},{"CALORIE":"칼로리"},{"QNT":"분량"},{"LEVEL_NM":"난이도"},{"IRDNT_CODE":"재료별 분류명"},{"PC_NM":"가격별 분류"},
//				{"IMG_URL":"대표이미지 URL"},{"DET_URL":"상세 URL"}

// recipeContent - {"RECIPE_ID":"레시피 코드"},{"COOKING_NO":"요리설명순서"},{"COOKING_DC":"요리설명"},{"STRE_STEP_IMAGE_URL":"과정 이미지 URL"},{"STEP_TIP":"과정팁"}

// recipeMaterial - {"RECIPE_ID":"레시피 코드"},{"IRDNT_SN":"재료순번"},{"IRDNT_NM":"재료명"},{"IRDNT_CPCTY":"재료용량"},{"IRDNT_TY_CODE":"재료타입 코드"},{"IRDNT_TY_NM":"재료타입명"}

/*		$.each(infoData,function(key,val){
			if(key == "title"){
				$("table").attr("border","1");
				$("thead").append(
						"<tr>" +
							"<td>"+val[0].RECIPE_ID+"</td>"+
							"<td>"+val[1].RECIPE_NM_KO+"</td>"+
							"<td>"+val[4].NATION_NM+"</td>"+
							"<td>"+val[6].TY_NM+"</td>"+
							"<td>"+val[8].CALORIE+"</td>"+
							"<td>"+val[13].IMG_URL+"</td>"+
							"<td>"+val[14].DET_URL+"</td>"+
						"</tr>"
				);
				
			} else if(key == "data"){
				var list = val;
				for(var i = 0; i < list.length; i++){
					var str = list[i];
					$("tbody").append(
						"<tr>" +
							"<td>"+str.RECIPE_ID+"</td>"+
							"<td>"+str.RECIPE_NM_KO+"</td>"+
							"<td>"+str.NATION_NM+"</td>"+
							"<td>"+str.TY_NM+"</td>"+
							"<td>"+str.CALORIE+"</td>"+
							"<td>"+str.IMG_URL+"</td>"+
							"<td>"+str.DET_URL+"</td>"+
							"<input type='hidden' name='recipeInfo' value='"+str.RECIPE_ID+"/"+str.RECIPE_NM_KO+"/"+str.NATION_NM+"/"
																			+str.CALORIE+"/"+str.IMG_URL+"/"+str.DET_URL+"'>"+
						"</tr>"	
					);
				}
			}
		})*/