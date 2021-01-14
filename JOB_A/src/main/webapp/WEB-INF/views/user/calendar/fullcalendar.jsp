<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Calendar</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<!-- 풀캘린더 스타일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
<script src='${pageContext.request.contextPath}/resources/js/fullcalendar.js'></script>

<style type="text/css">
.fc-header-toolbar {
	/*
		the calendar will be butting up against the edges,
		but let's scoot in the header's buttons
		*/
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

html, body {
	margin: 0;
	padding: 0;
	font-size: 14px;
}

#calendar-container {
	position: relative;
	z-index: 1;
	margin-left: 20px;
}

#calendar {
	max-width: 1200px;
	margin: 20px auto;
	overflow-y: hidden;
	padding-right: 10px;
}

.fc-scrollgrid {
	height: auto;
	width: auto;
}
/* 검색창 스타일 */
	.container{
		width: 100%;
		vertical-align: middle;
		white-space: nowrap;
		position: relative;
		margin-left: 10px;
	}
	.container input#search::-webkit-input-placeholder {
		color: #65737e;
		cursor: pointer;
	}
	 
	.container input#search:-moz-placeholder { /* Firefox 18- */
		color: #65737e;  
	}
	 
	.container input#search::-moz-placeholder {  /* Firefox 19+ */
		color: #65737e;  
	}
	 
	.container input#search:-ms-input-placeholder {  
		color: #65737e;  
	}
	.container input#search{
		width: 55%;
		height: 50px;
		font-size: 10pt;
		float: left;
		color: #63717f;
		padding-left: 45px;
		margin-right: 20px;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
	}
	.container .icon{
		position: absolute;
		top: 45%;
		margin-left: 14px;
		margin-top: 14px;
		z-index: 1;
		color: #4f5b66;
		
		-webkit-transition: all .55s ease;
		-moz-transition: all .55s ease;
		-ms-transition: all .55s ease;
		-o-transition: all .55s ease;
		transition: all .55s ease;
	}
	.container:hover .icon{
		margin-top: 13px;
		color: #93a2ad;
		
		-webkit-transform:scale(1.5); /* Safari and Chrome */
		-moz-transform:scale(1.5); /* Firefox */
		-ms-transform:scale(1.5); /* IE 9 */
		-o-transform:scale(1.5); /* Opera */
		 transform:scale(1.5);
	}
	
	.container input#search:hover, .container input#search:focus, .container input#search:active{
	    outline:none;
	    background: rgba(222, 225, 226, 0.75);
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<c:import url="../common/header.jsp" />
				
					
				<div id="calendar-container">
					<div id="calendar"
						class="fc fc-media-screen fc-direction-ltr fc-theme-standard">
						<div class="fc-header-toolbar fc-toolbar ">
							<div class="fc-toolbar-chunk">
								<h2 class="fc-toolbar-title">December 2020</h2>
							</div>
							<div class="fc-toolbar-chunk"></div>
							<div class="fc-toolbar-chunk">
								
								<button disabled=""
									class="fc-today-button fc-button fc-button-primary"
									type="button">today</button>
									
								<div class="fc-button-group">
									<button class="fc-prev-button fc-button fc-button-primary"
										type="button" aria-label="prev">
										<span class="fc-icon fc-icon-chevron-left"></span>
									</button>

									<button class="fc-next-button fc-button fc-button-primary"
										type="button" aria-label="next">
										<span class="fc-icon fc-icon-chevron-right"></span>
									</button>
								</div>
							</div>
						</div>
						<div class="fc-view-harness fc-view-harness-active"
							style="height: 435px;">
							<div class="fc-daygrid fc-dayGridMonth-view fc-view">
								<table class="fc-scrollgrid  fc-scrollgrid-liquid">
									<thead>
										<tr
											class="fc-scrollgrid-section fc-scrollgrid-section-header ">
											<td><div class="fc-scroller-harness">
													<div class="fc-scroller" style="overflow: hidden scroll;">
														<table class="fc-col-header " style="width: 422px;">
															<colgroup></colgroup>
															<tbody>
																<tr>
																	<th class="fc-col-header-cell fc-day fc-day-sun"><div
																			class="fc-scrollgrid-sync-inner">
																			<a class="fc-col-header-cell-cushion ">Sun</a>
																		</div></th>
																	<th class="fc-col-header-cell fc-day fc-day-mon"><div
																			class="fc-scrollgrid-sync-inner">
																			<a class="fc-col-header-cell-cushion ">Mon</a>
																		</div></th>
																	<th class="fc-col-header-cell fc-day fc-day-tue"><div
																			class="fc-scrollgrid-sync-inner">
																			<a class="fc-col-header-cell-cushion ">Tue</a>
																		</div></th>
																	<th class="fc-col-header-cell fc-day fc-day-wed"><div
																			class="fc-scrollgrid-sync-inner">
																			<a class="fc-col-header-cell-cushion ">Wed</a>
																		</div></th>
																	<th class="fc-col-header-cell fc-day fc-day-thu"><div
																			class="fc-scrollgrid-sync-inner">
																			<a class="fc-col-header-cell-cushion ">Thu</a>
																		</div></th>
																	<th class="fc-col-header-cell fc-day fc-day-fri"><div
																			class="fc-scrollgrid-sync-inner">
																			<a class="fc-col-header-cell-cushion ">Fri</a>
																		</div></th>
																	<th class="fc-col-header-cell fc-day fc-day-sat"><div
																			class="fc-scrollgrid-sync-inner">
																			<a class="fc-col-header-cell-cushion ">Sat</a>
																		</div></th>
																</tr>
															</tbody>
														</table>
													</div>
												</div></td>
										</tr>
									</thead>
									<tbody>
										<tr
											class="fc-scrollgrid-section fc-scrollgrid-section-body  fc-scrollgrid-section-liquid">
											<td><div
													class="fc-scroller-harness fc-scroller-harness-liquid">
													<div class="fc-scroller fc-scroller-liquid-absolute">
														<div class="fc-daygrid-body fc-daygrid-body-unbalanced "
															style="width: 422px;">
															<table class="fc-scrollgrid-sync-table"
																style="width: 422px; height: 271px;">
																<colgroup></colgroup>
																<tbody>
																	<tr>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other"
																			data-date="2020-11-29"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">29</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-mon fc-day-past fc-day-other"
																			data-date="2020-11-30"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">30</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
																			data-date="2020-12-01"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">1</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
																			data-date="2020-12-02"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">2</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
																			data-date="2020-12-03"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">3</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
																			data-date="2020-12-04"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">4</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
																			data-date="2020-12-05"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">5</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																	</tr>
																	<tr>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
																			data-date="2020-12-06"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">6</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
																			data-date="2020-12-07"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">7</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
																			data-date="2020-12-08"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">8</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
																			data-date="2020-12-09"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">9</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
																			data-date="2020-12-10"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">10</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
																			data-date="2020-12-11"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">11</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
																			data-date="2020-12-12"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">12</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																	</tr>
																	<tr>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
																			data-date="2020-12-13"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">13</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
																			data-date="2020-12-14"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">14</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
																			data-date="2020-12-15"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">15</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
																			data-date="2020-12-16"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">16</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
																			data-date="2020-12-17"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">17</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
																			data-date="2020-12-18"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">18</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
																			data-date="2020-12-19"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">19</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																	</tr>
																	<tr>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
																			data-date="2020-12-20"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">20</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
																			data-date="2020-12-21"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">21</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
																			data-date="2020-12-22"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">22</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
																			data-date="2020-12-23"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">23</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
																			data-date="2020-12-24"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">24</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
																			data-date="2020-12-25"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">25</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
																			data-date="2020-12-26"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">26</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																	</tr>
																	<tr>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
																			data-date="2020-12-27"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">27</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
																			data-date="2020-12-28"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">28</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
																			data-date="2020-12-29"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">29</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-wed fc-day-today "
																			data-date="2020-12-30"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">30</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-thu fc-day-future"
																			data-date="2020-12-31"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">31</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other"
																			data-date="2021-01-01"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">1</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other"
																			data-date="2021-01-02"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">2</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																	</tr>
																	<tr>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sun fc-day-future fc-day-other"
																			data-date="2021-01-03"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">3</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-mon fc-day-future fc-day-other"
																			data-date="2021-01-04"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">4</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-tue fc-day-future fc-day-other"
																			data-date="2021-01-05"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">5</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-wed fc-day-future fc-day-other"
																			data-date="2021-01-06"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">6</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other"
																			data-date="2021-01-07"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">7</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other"
																			data-date="2021-01-08"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">8</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																		<td
																			class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other"
																			data-date="2021-01-09"><div
																				class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																				<div class="fc-daygrid-day-top">
																					<a class="fc-daygrid-day-number">9</a>
																				</div>
																				<div class="fc-daygrid-day-events"></div>
																				<div class="fc-daygrid-day-bg"></div>
																			</div></td>
																	</tr>
																	
																</tbody>
															</table>
														</div>
													</div>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
						<!-- 검색 & 새로고침 -->
					<div class="search-bar" style="margin-top: -20px; margin-bottom: 70px; margin-left: 60%;">				
						<div class="container" >
						    <span class="icon"><i class="fa fa-search"></i></span>
						    <input type="search" id="search" placeholder=" Search !" />
						</div>		
						<button type="button" onClick="search()"
								style="height: 50px; width: 50px;">
								<i class="fa fa-search" style="margin: -9px;"></i></button>											
						<button type="button" onClick="location.reload(false);"
								style="height: 50px; width: 50px;">
								<i class="fas fa-redo" style="margin: -9px;"></i></button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../common/sideBar.jsp" />

		<!-- Script -->
 
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth'
				});
				calendar.render();
				calendar.setOption('locale', 'ko');
				calendar.setOption('contentHeight', "auto");
			});
			
			$("#teachermale").on("change", function(){
			    $("#calendar").fullCalendar("refetchEvents");
			});
		</script>
</body>
</html>