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
  
   .fc-sat > span { color:blue; }     /* 토요일 */
   .fc-sun > span { color:red; }    /* 일요일 */
   .fc-day-number{
   	font-size: 18px;
   }
   .fc-day-header>span {
   	font-size: 20px;
   }
   .fc-title{
   	font-size: 15px;
   }
   body{
   	background-color: #f3f1ec;
   }
 td.fc-day.fc-today{
 	background: khaki;
 }
 .fc-content{
 	text-align: center;
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
      eventDurationEditable: false,
      eventLimit: true, // when too many events in a day, show the popover
      eventDrop: function(event, delta, revertFunc) {
    	   
    	    var datestart = event.start.format();
    	 	var datedescription = event.description;
    	    if (!confirm("수정을 하실려나 마실려나")) {
    	        revertFunc();
    	      }else{
    	    	  
			location.href="cal.do?command=calendarupdate&start="+datestart+"&payment_no="+datedescription;
    	      }
    	  },
    	 /*  eventClick: function(calEvent, jsEvent, view) {

    		    alert('Event: ' +description );
    	  },
       */
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
	                  url: "prodetail.do?command=detail&recipeno="+$(this).attr('url'),
	                  description: $(this).attr('description')
	                  // will be parsed
	                  
	                });
	                
	              });
	        	
	        	callback(events);
	        }
  		});
      },
     
      eventColor:'chocolate'
     

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
    

  </body>

</html>