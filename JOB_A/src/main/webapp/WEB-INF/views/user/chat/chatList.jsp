<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
	<style>
		#banner {
		float : flex;
		height: 800px;
		}
		
		.left {
		width: 60%;
		padding-right : 10px;
		}
		
		.right {
			width : 40%;
			border-left : 1px black solid;
		}

		#h2 {
		border-bottom: solid 3px #f56a6a;
		    display: inline-block;
		    margin: 0 0 0 0;
		    padding: 0 0.75em 0.5em 0;
		}
	</style>
</head>
	<body>
		<div id="wrapper">
			<div id="main">
				<div class="inner">
					<c:import url="../common/header.jsp"/>
						<header class="major">
							<h2 id="h2">채팅방 목록</h2>
						</header>
					<section id="banner">					
						<div class="left">
							<table>
								<thead>
									<tr>
										<th>채팅방 이름</th>
									</tr>
									<c:forEach items="${chatList}" var="c">
										<tr>
											<th><span>${c.CHAT_TITLE}</span></th>
											<th><a href="#" class="button">입장</a></th>
										</tr>
									</c:forEach>
								</thead>
							</table>
						</div>
						<div class="right">
							<button type="button" data-toggle="modal" data-target="#newChat" class="button" style="width: 200px; height: 100px;">새로운 채팅</button>
						</div>
					</section>
				</div>
			</div>
			<c:import url="../common/sideBar.jsp"/>
		</div>
		
		<div class="modal fade" id="newChat" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
			    	<div class="modal-header">
			      		<h5 class="modal-title" id="loginModalLabel">채팅방 생성</h5>
			      		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        		<span aria-hidden="true">&times;</span>
			      		</button>
			    	</div>
			       <!--로그인폼 -->
			       <!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
					<form action="${pageContext.request.contextPath}/chat/chatView.do" method="post">
						<div class="modal-body">
							<input type="text" class="form-control" name="chatTitle" placeholder="채팅방 이름" required>
							<br />
						</div>
			      		<div class="modal-footer">
					        <button type="submit" class="btn btn-outline-success">채팅 시작</button>
					        <button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
			      		</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>