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
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<style>
		#banner {
		float : flex;
		height: 710px;
		}
		
		.left {
		width: 40%;
		padding-right : 10px;
		}
		
		.right {
			width : 60%;
			border-left : 1px black solid;
			border-color: lightgrey;
			padding-left : 10px;
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
		
		.newChat {
			width: 400px; 
			height: 150px !important; 
			font-size: 40px !important;
			margin: 200px 0 0 180px;
		}
		
		.modal-header .close  {
			height: 40px;
			margin: 10px 0 0 0;
			font-size: 2rem;
			line-height: 0.5;
		}
		.modal-title {
			font-size: 50px;
		}
		
		#exitChat {
			margin-left: 
		}
		
		#chatList {
			width: auto;
			height: 400px;
		}
		
		#message {
			resize: none; 
			width: 600px;
		}
	</style>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<c:import url="../common/header.jsp"/>				
				<section id="banner">					
					<div class="left">
						<table>
							<c:forEach items="${chatList}" var="list">
								<tr>
									<td><b>${list.chatTitle}</b></td>
									<td><button type="button" onclick="location.href='${pageContext.request.contextPath}/chat/chatList/${list.chatNo}'"> 입장</button></td>
								</tr>
							</c:forEach>
						</table>
						<c:out value="${pageBar}" escapeXml="false"/>
					</div>
				
					<div class="right">
						<c:if test="${chatNo eq 0}">
							<button type="button" class="button newChat" data-toggle="modal" data-target="#exampleModalCenter">새로운 채팅</button>
						</c:if>
						<c:if test="${chatNo ne 0}">
							<div class="chat-right-aside">
								<div class="chat-main-header">
									<div class="p-3 border-bottom">
										<h3 class="box-title">${chat.CHAT_TITLE} <a href="javascript:void(0)" id="exitChat"><i class="fas fa-door-open"></i></a></h3>
										<input type="hidden" id="chatNo" value="${chat.CHAT_NO}" />
									</div>
								</div>
								<div class="chat-rbox">
									<ul class="chat-list p-5" id="chatList" >
	
									</ul>
								</div>
								<div class="card-body border-top">
									<div class="row">
										<div class="col-9">
											<textarea placeholder="메세지를 입력하세요" class=" b-0" id="message"></textarea>
										</div>
										<div class="col-3 text-right">
											<button type="button" class="btn btn-lg" id="sendChat">
												<i class="fa fa-paper-plane"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</section>
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
   						<div class="modal-content">
   							<div class="modal-header">
     							<h2 class="modal-title" id="exampleModalCenterTitle">새로운 채팅방 생성하기</h2>
     							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
       								<span aria-hidden="true">&times;</span>
     							</button>
   							</div>
   							<form action="${pageContext.request.contextPath }/chat/insertChat" method="post">
    							<div class="modal-body">
    								<h3 for="exampleInputTitle">채팅방 이름</h3>
    								<input type="text" class="form-control" name="chatTitle" id="exampleInputPassword1" placeholder="30자 내외 입력">
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
	    
		// addConfirm
		function chatAdd(form) {
			form.chatTitle.value = form.chatTitle.value.trim();
			if(form.chatTitle.value.length == 0) {
				alert('채팅방 제목을 입력하세요')}
			}
        
	 	// exitConfirm
		$("#exitChat").click(function () {
			Swal.fire({
                title: '🚰·̫🚰',
                text: "채팅방을 나가시겠습니까?",
                showCancelButton: true,
                confirmButtonColor: '#fff',
                cancelButtonColor: '#fff',
                confirmButtonText: '가차없이 나가겠어!',
                cancelButtonText: '쵸큼만 더 있어볼까..?'
			}).then((result) => {
                if (result.value) {
                    location.href="${pageContext.request.contextPath}/chat/exitChat";
                }
            })
        });

		


		
        // Menu.
          var $menu = $('#menu'),
             $menu_openers = $menu.children('ul').find('.opener');
    
          // Openers.
             $menu_openers.each(function() {
    
                var $this = $(this);
    
                $this.on('click', function(event) {
    
                   // Prevent default.
                      event.preventDefault();
    
                   // Toggle.
                      $menu_openers.not($this).removeClass('active');
                      $this.toggleClass('active');
    
                   // Trigger resize (sidebar lock).
                      $window.triggerHandler('resize.sidebar-lock');
    
                });
    
             });
             
             var sock = new SockJS("<c:url value='/chatting'/>");
     	 	sock.onmessage=onMessage; /* 메세지 전송 */
     		sock.onclose=onClose; /* 메세지 닫기 */

     	    var today=null;
	
	     	// send
    		$("#sendChat").click(function(){
                console.log("send message.....");
                /* 채팅창에 작성한 메세지 전송 */
                sendMessage();
                /* 전송 후 작성창 초기화 */
                $("#message").val('');
            });
			 	
	</script>


</body>
</html>