<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
		rel="stylesheet">
<title>검색 결과</title>
</head>
<body>

	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<c:import url="../common/header.jsp" />
				
								<section class="container">
					<div class="wrapped">
						<div role="main" class="contents">

							<div class="article-list">
								<c:forEach items="${BoardList}" var="board">
									<div class="article-list-pre">
										<div class="tit" id="${b.board_No}">
										<p style="display:none;">${b.board_Name}</p>
											<h3 class="hh">${b.board_Title}</h3>
											<p class="pre-txt">${b.board_Content}</p>
										</div>
										<div class="sub">
											<p class="name">${b.mem_Nick}</p>
											<div class="wrap-info">
												<i class="far fa-eye"> ${b.board_View }</i> <i
													class="far fa-comment"> ${b.comm_Count }</i>
												<div class="info_fnc">
													${b.board_Date} <i class="far fa-bookmark" id="bookmark"></i>
												</div>
											</div>
										</div>
									</div>
									<c:if test="{b.fileCount>0}">
									<div class="article-list-pre attach-img-pre">
										<div class="tit" id="${b.board_No}">
											<p style="display:none;">${b.board_No }</p>
											<h3 class="hh">${b.board_Title}</h3>
											<p class="pre-txt">${b.board_Content}</p>
											<span class="attach-img">
												<img src="#">
											</span>										
										</div>
										<div class="sub">
											<p class="name">${b.mem_Nick}</p>
											<div class="wrap-info">
												<i class="far fa-eye"> ${b.board_View }</i> <i
													class="far fa-comment"> ${b.comm_Count }</i>
												<div class="info_fnc">
													${b.board_Date} <i class="far fa-bookmark" id="bookmark"></i>
												</div>
											</div>
										</div>
									</div>
									</c:if>									
								</c:forEach>
							</div>
						</div>
					</div>
					<br /> <br />
					<center>
						<c:out value="${pageBar}" escapeXml="false" />
					</center>

				</section>
				
				<c:import url="../common/sideBar.jsp" />
			</div>
		</div>
	</div>
	
</body>
</html>