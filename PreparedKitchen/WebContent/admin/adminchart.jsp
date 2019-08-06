<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
div{
	margin: 50px;
}
#boardlike{
	
}
svg {
	border: 1px solid;
	width: 500px;
	height: 300px;
}

.bar {
	fill: skyblue;
}

.bar:hover {
	fill: blue;
}

.text {
	fill: white;
	font-weight: bold;
}
</style>

<script src="https://d3js.org/d3.v4.min.js"></script>
<script type="text/javascript" src="/PreparedKitchen/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
$(function() {
	
	$.ajax({
        url:"/PreparedKitchen/recipeboard.do?command=likechart",
        dataType:"text",
        success:function(data) {
        	var jdata =JSON.parse(data);
        	if(jdata.chart != null){
				boardLikeChart(jdata.chart);
        	}
        },error:function(request, error){
			alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
		}
    });
	
	$.ajax({
        url:"/PreparedKitchen/product.do?command=productview",
        dataType:"text",
        success:function(data) {
        	var jdata =JSON.parse(data);
        	if(jdata.proview != null){
	        	productViewChart(jdata.proview);
        	}
        },error:function(request, error){
			alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
		}
    });
	
	$.ajax({
        url:"/PreparedKitchen/product.do?command=productsales",
        dataType:"text",
        success:function(data) {
        	var jdata =JSON.parse(data);
        	if(jdata.prosales != null){
        		productSalesChart(jdata.prosales);
        	}
        },error:function(request, error){
			alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
		}
    });
	
});	
	
	
function boardLikeChart(data) {
	
	var dataset = data;
	var svg = d3.select("#boardlike").select("svg"); 
	var width  = parseInt(svg.style("width"), 10)-30;
	var height = parseInt(svg.style("height"), 10)-20;
	var svgG = svg.append("g")
		.attr("transform", "translate(30, 0)");
	
	
	var xScale = d3.scaleBand()                                        
	    .domain(dataset.map(function(d) { return d.x;} ))
	    .range([0, width]).padding(0.2);

	var yScale = d3.scaleLinear()                                            
	    .domain([0, d3.max(dataset, function(d){ return d.y; })])
	    .range([height, 0]);  
	
	svgG.selectAll("rect") .data(dataset) .enter().append("rect") 
		.attr("class", "bar") 
		.attr("height", function(d, i) {return height-yScale(d.y)})
		.attr("width", xScale.bandwidth())                            
        .attr("x", function(d, i) {return xScale(d.x)})
		.attr("y", function(d, i) {return yScale(d.y)});

	svgG.selectAll("text") .data(dataset) .enter().append("text") 
		.text(function(d) {return d.y}) 
		.attr("class", "text") 
		.attr("x", function(d, i) {return xScale(d.x)+xScale.bandwidth()/2})
        .style("text-anchor", "middle")
		.attr("y", function(d, i) {return yScale(d.y) + 15});

	svgG.append("g")                                                       
	    .attr("transform", "translate(0," + height + ")")
	    .call(d3.axisBottom(xScale));

	svgG.append("g")
	   .call(d3.axisLeft(yScale).ticks(5));  
}	

function productViewChart(data) {
	
	var dataset = data;
	var svg = d3.select("#proview").select("svg"); 
	var width  = parseInt(svg.style("width"), 10)-30;
	var height = parseInt(svg.style("height"), 10)-20;
	var svgG = svg.append("g")
		.attr("transform", "translate(30, 0)");
	
	
	var xScale = d3.scaleBand()                                        
	    .domain(dataset.map(function(d) { return d.x;} ))
	    .range([0, width]).padding(0.2);

	var yScale = d3.scaleLinear()                                            
	    .domain([0, d3.max(dataset, function(d){ return d.y; })])
	    .range([height, 0]);  
	
	svgG.selectAll("rect") .data(dataset) .enter().append("rect") 
		.attr("class", "bar") 
		.attr("height", function(d, i) {return height-yScale(d.y)})
		.attr("width", xScale.bandwidth())                            
        .attr("x", function(d, i) {return xScale(d.x)})
		.attr("y", function(d, i) {return yScale(d.y)});

	svgG.selectAll("text") .data(dataset) .enter().append("text") 
		.text(function(d) {return d.y}) 
		.attr("class", "text") 
		.attr("x", function(d, i) {return xScale(d.x)+xScale.bandwidth()/2})
        .style("text-anchor", "middle")
		.attr("y", function(d, i) {return yScale(d.y) + 15});

	svgG.append("g")                                                       
	    .attr("transform", "translate(0," + height + ")")
	    .call(d3.axisBottom(xScale));

	svgG.append("g")
	   .call(d3.axisLeft(yScale).ticks(5));  
}	
	
function productSalesChart(data) {
	
	var dataset = data;
	var svg = d3.select("#prosales").select("svg"); 
	var width  = parseInt(svg.style("width"), 10)-30;
	var height = parseInt(svg.style("height"), 10)-20;
	var svgG = svg.append("g")
		.attr("transform", "translate(30, 0)");
	
	
	var xScale = d3.scaleBand()                                        
	    .domain(dataset.map(function(d) { return d.x;} ))
	    .range([0, width]).padding(0.2);

	var yScale = d3.scaleLinear()                                            
	    .domain([0, d3.max(dataset, function(d){ return d.y; })])
	    .range([height, 0]);  
	
	svgG.selectAll("rect") .data(dataset) .enter().append("rect") 
		.attr("class", "bar") 
		.attr("height", function(d, i) {return height-yScale(d.y)})
		.attr("width", xScale.bandwidth())                            
        .attr("x", function(d, i) {return xScale(d.x)})
		.attr("y", function(d, i) {return yScale(d.y)});

	svgG.selectAll("text") .data(dataset) .enter().append("text") 
		.text(function(d) {return d.y}) 
		.attr("class", "text") 
		.attr("x", function(d, i) {return xScale(d.x)+xScale.bandwidth()/2})
        .style("text-anchor", "middle")
		.attr("y", function(d, i) {return yScale(d.y) + 15});

	svgG.append("g")                                                       
	    .attr("transform", "translate(0," + height + ")")
	    .call(d3.axisBottom(xScale));

	svgG.append("g")
	   .call(d3.axisLeft(yScale).ticks(5));  
}	
</script>
<title>adminchart</title>
</head>
<body>
<a href="/PreparedKitchen/index.jsp">메인</a>
<h1>레시피추천좋아요 순위 top5</h1>
<div id="boardlike"><svg></svg></div>
<h1>상품 조회수 top5</h1>
<div id="proview"><svg></svg></div>
<h1>상품 구매 top5</h1>
<div id="prosales"><svg></svg></div>

</body>
</html>