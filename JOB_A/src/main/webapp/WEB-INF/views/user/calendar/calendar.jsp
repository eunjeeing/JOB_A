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


</style>
</head>
<body>
	<div class="calendar">
        <div class="header">
            <div class="year-month"></div>
            <div class="nav">
                <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                <button class="nav-btn go-today" onclick="goToday()">Today</button>
                <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
            </div>
        </div>
        <div class="main">
            <div class="days">
                <div class="day">일</div>
                <div class="day">월</div>
                <div class="day">화</div>
                <div class="day">수</div>
                <div class="day">목</div>
                <div class="day">금</div>
                <div class="day">토</div>
            </div>
            <div class="dates"></div>
        </div>
    </div>
    
    
    <script type="text/javascript">
	    const date = new Date();
	
		const viewYear = date.getFullYear();
		const viewMonth = date.getMonth();
		
		document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

		const prevLast = new Date(viewYear, viewMonth, 0);
		const thisLast = new Date(viewYear, viewMonth + 1, 0);

		const PLDate = prevLast.getDate();
		const PLDay = prevLast.getDay();

		const TLDate = thisLast.getDate();
		const TLDay = thisLast.getDay();

		const prevDates = [];
		const thisDates = [...Array(TLDate + 1).keys()].slice(1);
		const nextDates = [];

		if (PLDay !== 6) {
			  for (let i = 0; i < PLDay + 1; i++) {
			    prevDates.unshift(PLDate - i);
			  }
			}
		
		for (let i = 1; i < 7 - TLDay; i++) {
		  nextDates.push(i);
		}
		
		const dates = prevDates.concat(thisDates, nextDates);
		
		dates.forEach((date, i) => {
		  dates[i] = `<div class="date">${date}</div>`;
		})
		
		document.querySelector('.dates').innerHTML = dates.join('');
    </script>
</body>
</html>