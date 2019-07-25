<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function goPage(pages, lines, searchValue,searchFiled) {
	    var url = "&pages=" + pages + "&lines=" + lines;
	    if(typeof searchValue === 'undefined'){
			location.href = 'img.do?command=list'+url;
	    }else{
	    	url += "&searchFileid=" + searchFiled + "&searchValue=" + searchValue;
	    	location.href = 'img.do?command=search'+url;
	    }
	    
	}

</script>
</head>
<body>

	<div class="paginate">
 
    <c:if test="${param.currentPageNo ne param.firstPageNo}">
        <a href="javascript:goPage(${param.prevPageNo}, ${param.recordsPerPage}, ${param.searchValue}, ${param.searchFiled})" class="prev">이전</a>
    </c:if>
    
    <span>
        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq param.currentPageNo}">
                    <b><font size=+1>
                            <a href="javascript:goPage(${i}, ${param.recordsPerPage}, ${param.searchValue}, ${param.searchFiled})" class="choice">${i}</a>
                        </font>
                    </b>
                </c:when>
                <c:otherwise>
                    <a href="javascript:goPage(${i}, ${param.recordsPerPage}, ${param.searchValue}, ${param.searchFiled})">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </span>
    
    <c:if test="${param.currentPageNo ne param.finalPageNo}">
        <a href="javascript:goPage(${param.nextPageNo}, ${param.recordsPerPage}, ${param.searchValue}, ${param.searchFiled})" class="next">다음</a>
    </c:if>
 
</div>

</body>
</html>