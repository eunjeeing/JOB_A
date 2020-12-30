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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<style>
		#banner {
		float : flex;
		height: 700px;
		}
		
		.left {
		width: 30%;
		padding-right : 10px;
		}
		
		.right {
			width : 70%;
			border-left : 1px black solid;
			border-color: lightgrey;
		}

		#h2 {
		border-bottom: solid 3px #f56a6a;
		    display: inline-block;
		    margin: 0 0 0 0;
		    padding: 0 0.75em 0.5em 0;
		}
		
		.btn-primary {
		    color: #fff;
		    background-color: #fff;
		    border-color: #fff;
		}
		.btn-primary:hover {
    		background-color: rgba(245, 106, 106, 0.05);
    		border-color: #f56a6a;
    	}
		
		.page-item.active .page-link {
		    z-index: 1;
		    color: #f56a6a;
		    background-color: #fff;
		    border-color: #f56a6a;
		}
		.page-link {
		    color: #f56a6a;
		}
	</style>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<c:import url="../common/header.jsp"/>
				<button type="button" class="button" data-toggle="modal" data-target="#exampleModalCenter">새로운 채팅</button>
				
				
				<section id="banner">					
					<div class="left">
							<table>
								<tr>
									
								
									<c:forEach items="${chatList}" var="c">
								
										<td><a href="${pageContext.request.contextPath}/chat/chatView/${c.CHAT_NO}" d="room${c.CHAT_NO}" class="croom" room_title="${c.CHAT_TITLE}"> <span><b>${c.CHAT_TITLE}</b> 입장</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:out value="${pageBar}" escapeXml="false"/>
					</div>
				
					<div class="right">
						<div class="chat-right-aside">
							<div class="chat-main-header">
								<div class="p-3 border-bottom">
									<h3 class="box-title">
										${c.CHAT_TITLE} <a href="javascript:void(0)" id="exitChatRoom"><i class="mdi-exit-to-app mdi float-right text-danger ml-3"></i></a><a href="javascript:void(0)"
											data-target="#invite-chatroom" data-toggle="modal"
										><i class="mdi-account-plus mdi text-muted float-right ml-3"></i></a><a href="javascript:void(0)" data-target="#renameCroomTitle" data-toggle="modal"><i
											class="mdi-lead-pencil mdi float-right"
										></i></a>
									</h3>
									<input type="hidden" id="chatNo" value="${c.CHAT_NO}" />
								</div>
							</div>
							<div class="chat-rbox">
								<ul class="chat-list p-5" id="chatList">

								</ul>
							</div>
							<div class="card-body border-top">
								<div class="row">
									<div class="col-9">
										<textarea placeholder="메세지를 입력하세요" class=" b-0" id="sendMSG"></textarea>
									</div>
									<div class="col-3 text-right">
										<button type="button" class="btn btn-lg" id="sendChat">
											<i class="fa fa-paper-plane"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
    						<div class="modal-content">
      							<div class="modal-header">
        							<h1 class="modal-title" id="exampleModalCenterTitle">새로운 채팅방 생성하기</h1>
        							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          								<span aria-hidden="true">&times;</span>
        							</button>
      							</div>
      
      
      							<form action="${pageContext.request.contextPath }/chat/insertChat" method="post">
	      							<div class="modal-body">
	      								<h3 for="exampleInputTitle">채팅방 이름</h3>
	      								<input type="text" class="form-control" name="chatTitle" id="exampleInputPassword1" placeholder="O글자 내외 입력">
	      							</div>
	      							<div class="modal-footer">
								        <button type="submit" class="button">채팅 시작</button>
      								</div>
   								</form>
  							</div>
						</div>
					</div>
			</div>
		</div>
		<c:import url="../common/sideBar.jsp"/>
	</div>
	
	
	<script>
		function chatAdd(form) {
			form.title.value = form.title.value.trim();
			if(form.title.value.length == 0) {
				alert('채팅방 제목을 입력하세요')}
			}
		


		 	function fn_chatting() {
			 	var title = '${chat.chatTitle}';
				var url = '${pageContext.request.contextPath}/chat/chatView/${chat.chatNo}';
				var status = 'width=500px, heigth=700px';

				var popup = window.open(url, title, status); /* url, title, status정보 보내서 새창열기  */
				
			 	}


			 	
	</script>


</body>
</html>