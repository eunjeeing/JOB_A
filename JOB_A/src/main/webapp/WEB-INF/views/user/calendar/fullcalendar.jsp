<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Calendar</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<link href='js/fullcalendar.min.css' rel='stylesheet' />
	<script src='js/moment.min.js'></script>
	<script src='js/fullcalendar.min.js'></script>
	
<style type="text/css">
	body {
       margin-top: 40px;
       text-align: center;
       font-size: 14px;
       font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	}
	
	#calendar {
	       width: 900px;
	       margin: 0 auto;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<c:import url="user/common/header.jsp"/>
	
		<div id='calendar'></div>
		
	</div>
	
	<script type="text/javascript">
		
		$(function(){
		 calendarEvent();
		});
		
		function calendarEvent(eventData){
		 $("#calender").html("");
		 var date = new Date();
		 var d = date.getDate();
		 var m = date.getMonth();
		 var y = date.getFullYear();
		 var calendar = $('#calender').fullCalendar({
		  header: {
		   left: "",
		   center: "title",
		//    right: "month,basicWeek,basicDay"
		   right: "today prev,next"
		   },
		   editable: true,
		   titleFormat: {
		   month: "yyyy년 MMMM",
		   week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
		   day: "yyyy년 MMM d일 dddd"
		   },
		   allDayDefault: false,
		   defaultView: "month",
		   editable: false,
		   monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		   monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		   dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		   dayNamesShort: ["일","월","화","수","목","금","토"],
		   buttonText: {
		   today : "오늘",
		   month : "월별",
		   week : "주별",
		   day : "일별",
		   },
		   events : eventData,
		   timeFormat : "HH:mm",
		 });
	</script>



</body>
</html>