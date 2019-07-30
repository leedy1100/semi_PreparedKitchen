<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang='ko'>

<head>
<meta charset="UTF-8">
 <link href='packages/core/main.css' rel='stylesheet' />
	<link href='packages/daygrid/main.css' rel='stylesheet' />
	<link href='packages/timegrid/main.css' rel='stylesheet' />
	<script src='packages/core/main.js'></script>
	<script src='packages/interaction/main.js'></script>
	<script src='packages/daygrid/main.js'></script>
	<script src='packages/timegrid/main.js'></script>
    <script src='packages/core/locales/ko.js'></script>

    <style type="text/css">

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>

    <script>

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {

        	locale:'ko',

          plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },

          navLinks: true, // can click day/week names to navigate views
          selectable: true,
          selectMirror: true,
          
          select: function(arg) {
            var title = prompt('Event Title:');
            if (title) {
                calendar.addEvent({
                  title: title,
                  start: arg.start,
                  end: arg.end,
                  allDay: arg.allDay

                })
              }

              calendar.unselect()

            },

            editable: true,
            eventLimit: true, // allow "more" link when too many events

          eventClick: function(info){
        	  alert('Event : ' + info.event.title);
        	  
        	  info.event.remove();
          }
            
          });

        calendar.render();

      });

    </script>

  </head>

  <body>

 

    <div id='calendar'></div>

 

  </body>

</html>