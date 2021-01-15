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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/dataTables.bootstrap4.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/jquery.dataTables.min.js'></script>
    <script src='${pageContext.request.contextPath}/resources/admin/js/dataTables.bootstrap4.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<style>
		#banner {
		float : flex;
		height: 640px;
		}
		
		.left {
		width: 45%;
		padding-right : 10px;
		}
		
		.right {
			width : 55%;
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
		
		.newChatBtn {
			width: 350px; 
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
			width: 110%;
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
						<table id="dataTable-1">
							<thead>
								<tr>
									<th>방 번호</th>
									<th style="width: 280px;">방 제목</th>
									<th>입장</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${chatList}" var="list">
									<tr>
										<td><b>${list.chatNo}</b></td>
										<td><b>${list.chatTitle}</b></td>
										<td><button onclick="enterChatRoom(this)" value="${list.chatNo}" id="enterChatRoom"><i class="far fa-comments"></i></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:out value="${pageBar}" escapeXml="false"/>
					</div>
					
					
					<div class="right">
						<button type="button" class="button newChatBtn" data-toggle="modal" data-target="#exampleModalCenter">새로운 채팅</button>
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
   							<form id="newChatForm" action="${pageContext.request.contextPath }/chat/insertChat" method="post">
    							<div class="modal-body">
    								<h3 for="exampleInputTitle">채팅방 이름</h3>
    								<input type="text" class="form-control" name="chatTitle" id="newChatTitle" placeholder="30자 내외 입력" required>
    								<input type="hidden" name="creatorId" id="creatorId" value="${member.memId}">
    							</div>
    							<div class="modal-footer">
					        		<input type="submit" class="button" value="채팅 시작">
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
		</script>
			
		<script type="text/javascript">
		
			function enterChatRoom(obj){
				var chatRoomNo = $(obj).val();
				location.href="${pageContext.request.contextPath}/chat/chatRoom/" + chatRoomNo;
			};
		</script>


</body>
</html>