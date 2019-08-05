<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://d3js.org/d3.v4.min.js"></script>
<style>
svg {
	border: 1px solid;
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
<svg width="500" height="300"></svg>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script>
	 
	var dataset = [ {
		x : 'A',
		y : 9
	}, {
		x : 'B',
		y : 19
	}, {
		x : 'C',
		y : 29
	}, {
		x : 'D',
		y : 39
	}, {
		x : 'E',
		y : 29
	}, {
		x : 'F',
		y : 19
	}, {
		x : 'G',
		y : 9
	} ];
	var svg = d3.select("svg");
	svg.selectAll("rect")
	.data(dataset).enter().append("rect")
		.attr("class","bar")
		.attr("height", function(d, i) { return (d.y * 5)})
		.attr("width", 40)
		.attr("x", function(d, i) { return (50 * i)})
		.attr("y", function(d, i) {return (250 - d.y * 5)});
	
	svg.selectAll("text")
	.data(dataset).enter().append("text").text(function(d) {return d.y})
		.attr("class", "text")
		.attr("x", function(d, i) {return 50 * i + 10})
		.attr("y", function(d, i) {return 250 - d.y * 5 + 15});
</script>

<style type="text/css">
.bar {
    fill: skyblue;
}
.bar:hover {
    fill: blue;
}


</style>
<title>adminchart</title>
</head>
<body>

</body>
</html>