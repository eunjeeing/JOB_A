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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
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
								</thead>
								<tbody>
									<c:forEach items="${chatList}" var="c">
										<tr>
											<td><span>${c.CHAT_TITLE}</span></td>
											<td><button onclick="fn_chatting();" class="button">입장</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<c:out value="${pageBar}" escapeXml="false"/>
						</div>
						<div class="right">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">새로운 채팅</button>
						</div>
					</section>
				</div>
			</div>
			<c:import url="../common/sideBar.jsp"/>
		</div>
		
		 <script type="text/javascript">
		 	function fn_chatting() {
			 	var title = 'chattingRoom';
				var url = '${pageContext.request.contextPath}/chatting.do';
				var status = 'width=500px, heigth=700px';

				var popup = window.open(url, title, status); /* url, title, status정보 보내서 새창열기  */
				
			 	}
		 </script>
		
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">새로운 채팅방 생성하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${pageContext.request.contextPath}/chat/chatting.do" method="post">
	      <div class="modal-body">
			  <input type="text" class="form-control" name="userId" placeholder="채팅방 제목을 입력하세요" required>
	      </div>
	      <div class="modal-footer">
        <button type="button" class="btn btn-primary">생성</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
     </form>
    </div>
  </div>
</div>
	
	</body>
</html>