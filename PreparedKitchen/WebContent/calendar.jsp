<%@page import="com.pk.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
 

<link href='https://unpkg.com/fullcalendar@3.10.0/dist/fullcalendar.min.css' rel='stylesheet' />
<link href='https://unpkg.com/fullcalendar@3.10.0/dist/fullcalendar.print.css' rel='stylesheet' media='print' />

<script src='https://unpkg.com/moment@2.24.0/min/moment.min.js'></script>
<script src='https://unpkg.com/jquery@3.4.1/dist/jquery.min.js'></script>
<script src='https://unpkg.com/fullcalendar@3.10.0/dist/fullcalendar.min.js'></script>
<script src='fullcalendar/locale/ko.js'></script>
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>

<%
	MemberDto dto = (MemberDto)session.getAttribute("memberDto");
%>

<style>

  html, body {
    margin: 0;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 40px auto;
  }

</style>

 
  
<script>



  $(function() {

    $('#calendar').fullCalendar({
     

    /*   eventRender: function(eventObj, $el) {
        $el.popover({
          title: eventObj.title,
          content: eventObj.description,
          trigger: 'hover',
          placement: 'top',
          container: 'body'
        });
      }, */
      editable: true,
      eventLimit: true, // when too many events in a day, show the popover
      eventDrop: function(event, delta, revertFunc) {
    	   
    	    var datestart = event.start.format();
    	 
    	    if (!confirm("수정을 하실려나 마실려나")) {
    	        revertFunc();
    	      }else{
			location.href="cal.do?command=calendarupdate&start="+datestart;
    	      }
    	  },
    	
      
      events: function(start, end, timezone, callback) {
  		$.ajax({
	        url:"cal.do?command=calendar",
	        dataType:"text",
	        success:function(data) {
	        	var parse = JSON.parse(data);
	        	var events = [];
	        	
	        	$(parse).each(function() {
	                events.push({
	                  title: $(this).attr('title'),
	                  start: $(this).attr('start'),
	                  url:"//www.google.com"
	                  //description: $(this).attr('description')
	                  // will be parsed
	                  
	                });
	                
	              });
	        	
	        	callback(events);
	        }
  		});
      },
     
      
     

    });

  });

</script>
<style>

  #calendar a.fc-event {
    color: #fff; /* bootstrap default styles make it black. undo */
  }

</style>


  </head>

  <body>

 

    <div id='calendar'></div>
    
    	<table>
    		<tr>
    			<input type="button" value="뒤로가기" onclick="location.href='index.jsp'">
    		</tr>
    	</table>
    

 

  </body>

</html>