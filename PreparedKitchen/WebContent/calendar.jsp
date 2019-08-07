<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>

<html lang='ko'>

<head>
<meta charset="UTF-8">
 <link href='fullcalendar/fullcalendar.css' rel='stylesheet' />
 <link href='fullcalendar/fullcalendar.print.css' rel='stylesheet' />

	<script src='fullcalendar/fullcalendar.js'></script>

    <script src="js/jquery-3.4.1.min.js"></script>
  
    <script src="js/bootstrap.min.js"></script>
    
	<script src="fullcalendar/lib/moment.min.js"></script>

	
	

    <style type="text/css">

  
  
</style>

<script type="text/javascript">

$(function() {

    $('#calendar').fullCalendar({

      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,listYear'
      },

      displayEventTime: false, // don't show the time column in list view

    

      eventClick: function(event) {
       
        window.open(event.url, '_blank', 'width=700,height=600');
        return false;
      }

    });

  });

    </script>

  </head>

  <body>

 

    <div id='calendar'></div>

 

  </body>

</html>