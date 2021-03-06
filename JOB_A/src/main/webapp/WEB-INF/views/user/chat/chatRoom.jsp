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
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<style>
		#banner {
		float : flex;
		height: 640px;
		}
		
		.left {
		width: 50%;
		padding-right : 10px;
		}
		
		.right {
			width : 50%;
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
			margin: 200px 0 0 70px;
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
									<th>??? ??????</th>
									<th style="width: 280px;">??? ??????</th>
									<th>??????</th>
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
						<div class="border-bottom" style="height: 32px;">
								<h3 class="">${chatRoom.CHAT_TITLE} &nbsp;&nbsp;&nbsp;
								<input type="hidden" id="chatNo" value="${chatRoom.CHAT_NO}">
									<c:if test="${chatRoom.CHAT_CREATOR.equals(member.memId) == false}">
										<a href="javascript:void(0)" id="exitChat"><i class="fas fa-door-open"></i></a>
									</c:if>
									<c:if test="${chatRoom.CHAT_CREATOR.equals(member.memId) == true}">
										<a href="javascript:void(0)" id="deleteChat"><i class="fas fa-door-open"></i></a>
									</c:if>
								</h3>
						</div>
						<div class="chat-list">
							<ul id="chatdata" class="chat-list p-5" style="height: 480px; overflow: auto;"></ul>
						</div>
						<div class="card-body border-top">
							<div class="row">
								<div class="col-9">
									<textarea placeholder="???????????? ???????????????" class=" b-0" id="message"></textarea>
								</div>
								<div class="col-3 text-right">
									<button type="button" class="btn btn-lg" id="sendChat">
										<i class="fa fa-paper-plane"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
		<c:import url="../common/sideBar.jsp"/>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
	<script>
		var sock = new SockJS("<c:url value='/chatting/${chatRoom.CHAT_NO}'/>");
		sock.onconnect = onOpen;
		sock.onclose=onClose;
		function onClose(){
	        self.close();
	    };

	    function onOpen(){
		    sock.send(${chatRoom.CHAT_NO});
		}
	    
	    // click & enter
		$(function(){
	        $("#sendChat").click(function(){
	            sendMessage(); // ?????? ????????? ??????
	            $("#message").val(''); // ?????? ??? ????????? ?????????
				$('#message').focus();
	        });
	        
	        $('#message').keypress(function(e) {
				if (e.which == 13 && !e.shiftKey) {
					sendMessage();
					event.preventDefault();
					$("#message").val('');
					$('#message').focus();
				}
			});
		});
		
		
		function sendMessage() {
     		if ($('#message').val() != "") {
         		sock.send($("#message").val());
         		pageDown(); // scroll
     		} else {
				alert("???????????? ???????????????!");
			};
        };
	    
	    
		var today=null;
		// ????????? ??????	    
		sock.onmessage = function(evt) {
			var data = evt.data; // new text????????? ????????? ?????? ?????????
	        var host = null; // ???????????? ?????? ????????? ip??????
	        var strArray = data.split("|"); // ????????? ??????????????????
	        var userName = null; // ????????? ??????

	        
	        // ????????? ????????? ??????
	        for(var i=0;i<strArray.length;i++) {
	            console.log('str['+i+'] :' + strArray[i]);	 		
	        }
	        
	        if(strArray.length>1) {
	            sessionId=strArray[0];
	            message=strArray[1];
	            host=strArray[2].substr(1,strArray[2].indexOf(":")-1);
	            userName=strArray[3];
	            today=new Date();
	            printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
	            
	            console.log(today);
	            var ck_host='${host}';
	     
	            console.log(sessionId);
	            console.log(message);
	            console.log('host : '+host);
	            console.log('ck_host : '+ck_host);
	            /* ???????????? ???????????? ??????????????? ?????? ?????? */
	            if(host==ck_host||(host==0&&ck_host.includes('0:0:'))) {
	                var printHTML="<div class='alert alert-danger' style='margin-left: 30%;'>";
	                printHTML+="<sub>"+printDate+"</sub><br/>";
	                printHTML+="["+userName+"] : "+message;
	                printHTML+="</div>";
	                $('#chatdata').append(printHTML);
	            } else {
	                var printHTML="<div class='alert alert-warning' style='margin-left: -5%;margin-right:30%;'>";
	                printHTML+="<sub>"+printDate+"</sub><br/>";
	                printHTML+="["+userName+"] : "+message;
	                printHTML+="</div>";
	                $('#chatdata').append(printHTML);
	            }
	            //console.log('chatting data : '+data);
	        } else {
	            today=new Date();
	            printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
	            message=strArray[0];
	            var printHTML="<div class='well'  style='margin-left30%:'>";
	            printHTML+="<div class='alert'>";
	            printHTML+="<sub>"+printDate+"</sub><br/>";
	            printHTML+= message;
	            printHTML+="</div>";
	            printHTML+="</div>";
	            $('#chatdata').append(printHTML);	
	        }
	    };
	
	 // exitConfirm
	    $("#exitChat").click(function () {
	    	Swal.fire({
	            title: '????????????',
	            text: "???????????? ??????????????????????",
	            showCancelButton: true,
	            confirmButtonColor: '#fff',
	            cancelButtonColor: '#fff',
	            confirmButtonText: '???????????? ????????????!',
	            cancelButtonText: '????????? ??? ????????????..?'
	    	}).then((result) => {
	            if (result.value) {
	            	sock.onclose();
	                location.href="${pageContext.request.contextPath}/chat/exitChat";
	            }
	        })
	    });

	    // exitConfirm
	    $("#deleteChat").click(function () {
	    	Swal.fire({
	            title: '??????(????????????????`)??????',
	            text: "???????????? ?????????????????????????",
	            showCancelButton: true,
	            confirmButtonColor: '#fff',
	            cancelButtonColor: '#fff',
	            confirmButtonText: '??? ?????? ??????????????????! ????????????????????????????????????????????????',
	            cancelButtonText: '????????? ??? ????????????..?'
	    	}).then((result) => {
	            if (result.value) {
	            	sock.onclose();
	               	location.href="${pageContext.request.contextPath}/chat/deleteChat/" + "${chatRoom.CHAT_NO}";
	            }
	        })
	    });
	    

		function pageDown() {
			$('#chatdata').animate({
				scrollTop : $('#chatdata').get(0).scrollHeight
			}, 10);
		}
		
	</script>
	
	<script type="text/javascript">
		function enterChatRoom(obj){
			var chatRoomNo = $(obj).val();
			location.href="${pageContext.request.contextPath}/chat/chatRoom/" + chatRoomNo;
		};
	</script>

	<script type="text/javascript">
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

</body>
</html>