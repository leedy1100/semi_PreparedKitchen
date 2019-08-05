<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
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
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="packages/moment-timezone/main.js"></script>
    <script src="packages/moment/main.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
	<script src="packages/bootstrap/main.js"></script>
	<script src="daygrid/main.js"></script>
	
	<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
	<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
	
	

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
  
  .popper,
  .tooltip {
    position: absolute;
    z-index: 9999;
    background: white;
    color: black;
    width: 150px;
    border-radius: 3px;
    box-shadow: 0 0 2px rgba(0,0,0,0.5);
    padding: 10px;
    text-align: center;
  }
  .style5 .tooltip {
    background: #1E252B;
    color: #FFFFFF;
    max-width: 200px;
    width: auto;
    font-size: .8rem;
    padding: .5em 1em;
  }
  .popper .popper__arrow,
  .tooltip .tooltip-arrow {
    width: 0;
    height: 0;
    border-style: solid;
    position: absolute;
    margin: 5px;
  }

  .tooltip .tooltip-arrow,
  .popper .popper__arrow {
    border-color: white;
  }
  .style5 .tooltip .tooltip-arrow {
    border-color: #1E252B;
  }
  .popper[x-placement^="top"],
  .tooltip[x-placement^="top"] {
    margin-bottom: 5px;
  }
  .popper[x-placement^="top"] .popper__arrow,
  .tooltip[x-placement^="top"] .tooltip-arrow {
    border-width: 5px 5px 0 5px;
    border-left-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    bottom: -5px;
    left: calc(50% - 5px);
    margin-top: 0;
    margin-bottom: 0;
  }
  .popper[x-placement^="bottom"],
  .tooltip[x-placement^="bottom"] {
    margin-top: 5px;
  }
  .tooltip[x-placement^="bottom"] .tooltip-arrow,
  .popper[x-placement^="bottom"] .popper__arrow {
    border-width: 0 5px 5px 5px;
    border-left-color: transparent;
    border-right-color: transparent;
    border-top-color: transparent;
    top: -5px;
    left: calc(50% - 5px);
    margin-top: 0;
    margin-bottom: 0;
  }
  .tooltip[x-placement^="right"],
  .popper[x-placement^="right"] {
    margin-left: 5px;
  }
  .popper[x-placement^="right"] .popper__arrow,
  .tooltip[x-placement^="right"] .tooltip-arrow {
    border-width: 5px 5px 5px 0;
    border-left-color: transparent;
    border-top-color: transparent;
    border-bottom-color: transparent;
    left: -5px;
    top: calc(50% - 5px);
    margin-left: 0;
    margin-right: 0;
  }
  .popper[x-placement^="left"],
  .tooltip[x-placement^="left"] {
    margin-right: 5px;
  }
  .popper[x-placement^="left"] .popper__arrow,
  .tooltip[x-placement^="left"] .tooltip-arrow {
    border-width: 5px 0 5px 5px;
    border-top-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    right: -5px;
    top: calc(50% - 5px);
    margin-left: 0;
    margin-right: 0;
  }

</style>

    <script>

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {

        	locale:'ko',
        	
        	events: [
        		
        		      {
        		        groupId: '999',
        		        title: 'Repeating Event',
        		        description: '와 진짜 답도없다..',
        		        start: '2019-08-16'
        		      },
        		
        	    {
        	      title: 'My Event',
        	      start: '2019-08-01',
        	      description: '살려줘'
        	    }
        	    // more events here
        	  ],
        	
    
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
            var description = prompt('description:')
            if (title) {
                calendar.addEvent({
                  title: title,
                  description: description,
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
          },
          
          eventRender: function(info) {
              var tooltip = new Tooltip(info.el, {
            	  title : info.event.title + '<p>' + info.event.extendedProps.description + '</p>',
                  
                delay: {
                    show: "800",
                    hide: "50"
                  },
                placement: 'top',
                trigger: 'hover',
                html: true,
                container: 'body'
              });
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