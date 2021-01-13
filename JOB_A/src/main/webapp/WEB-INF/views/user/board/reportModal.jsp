<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script type="text/javascript">
      $(function(){
	/* 여기는 게시글 신고 */
        var modal = document.getElementById('myModal');
        
        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");
        
        // Get the <span> element that closes the modal
          var span = document.getElementsByClassName("close")[0];                                          
          
          // When the user clicks on the button, open the modal 
          btn.onclick = function() {
            console.log("zzz");
            modal.style.display = "block";
          }
          
          // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
              modal.style.display = "none";
            }
            
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
              if (event.target == modal) {
                modal.style.display = "none";
              }
            }
  	/* 여기는 게시글 신고 */
  	
  	/* 여기는 댓글 신고 */

        var commentModal = document.getElementById('myModal');
        
        // Get the button that opens the modal
        var commentBtn = document.getElementsByClassName("reportBtn_comment");  // 댓글
        var commentBtn1 = document.getElementsByClassName("reportBtn_cocomment"); // 대댓글
        
        // Get the <span> element that closes the modal
          var commentSpan = document.getElementsByClassName("close")[0];                                          
          
          // When the user clicks on the button, open the modal 
          commentBtn.onclick = function() {
             console.log("댓글임zzz");
            commentModal.style.display = "block";
          }
          
          commentBtn1.onclick = function() {
               console.log("대댓글임zzz");
              commentModal.style.display = "block";
            }
          
          // When the user clicks on <span> (x), close the modal
            commentSpan.onclick = function() {
            	commentModal.style.display = "none";
            }
            
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
              if (event.target == commentModal) {
            	  commentModal.style.display = "none";
              }
            }
          	/* 여기는 댓글 신고 */

          	
          }); 

      
      function test(obj){
          console.log(obj.value);
          }

       $('.submitBtn').click(function(){
          $('.reason1').val($(this).val());
          if(confirm("정말 신고하시겠습니까?") == true) {
             alert("신고 요청을 성공하였습니다.");
             $('#form1').submit();
             
             } else{
             alert("신고 요청을 취소하였습니다.");
                return;
                }
       
          });
            </script>
            <style type="text/css">
              /* The Modal (background) */
            .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            /* overflow: auto; */ /* Enable scroll if needed */
	        background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 450px; /* Could be more or less, depending on screen size */                          
            height:300px;
            letter-spacing: 0.075em;
        }
        .modal-body{
            text-align: center;
            padding-top:40px;
        }

        /* The Close Button */
        .close {
            color: #f56a6a  !important;
            cursor: pointer;
            border-radius: 0.375em;
            float: right;
            font-size: 28px;
            font-weight: bold;
            margin-top: -10px;
     
        }
        .close:hover,
        .close:focus {
            color: #f56a6a ;
            text-decoration: none;
            cursor: pointer;
        }

</style>
</head>
<body>

      <!-- The Modal -->
      <div  id="myModal" class="modal">
   
        <!-- Modal content-->
  
        <div class="modal-content">
  
          <div class="modal-header">
  
            <span class="close">&times;</span>  
            <h4 class="modal-title"> 신고<h4> <!-- 사용자 지정 부분② : 타이틀 -->
  
          </div>
  
          <div class="modal-body">
            <form id="form1" action="${pageContext.request.contextPath}/insertReport.do" method="post">
  
           <!-- radio, checkbox가 안먹힘 : 템플릿에 먹혀서 그런거 같아서 일단 구현하려고 임시로 버튼 해놓음 -->
           <input type="hidden" class="modal_board" name="board2" value=""/>  				<!-- 게시글, 댓글 번호 -->
           <input type="hidden" class="modal_board_no" name="board2_no" value=""/>  		<!-- 게시글, 댓글 작성자 번호 -->
           <input type="hidden" class="modal_reporter" name="declare" value=""/>			<!-- 게시글, 댓글 신고자 번호 -->
           <input type="hidden" class="modal_separate" name="modal_separate" value=""> 		<!-- 댓글 게시글 구분 -->
           <!-- 여긴 댓글 -->

           
              <div class="form-group">
               <label for="reportReason"><h3>신고 사유를 선택해주세요.</h3></label> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
               <select class="form-control" name="reason" id="reportReason">		
                 <option class="reportConfirm" value="허위사실">&nbsp;&nbsp;&nbsp;허위 사실인 것 같아요!</option>
                 <option class="reportConfirm" value="욕설">&nbsp;&nbsp;&nbsp;욕설이 담겨져 있어요!</option>
                 <option class="reportConfirm" value="음란물">&nbsp;&nbsp;&nbsp;문란하다고 생각합니다!</option>
                 <option class="reportConfirm" value="광고글">&nbsp;&nbsp;&nbsp;광고글인 것 같아요!</option>
                 <option class="reportConfirm" value="기타">&nbsp;&nbsp;&nbsp;기타</option>
               </select>
               
                <br />
                <br />
          		<input type="submit" class="submitBtn" value="제출" />
             </div>
           <!-- <input type="button" class="reportBtn" value="허위사실">허위 사실인 것 같아요! <br>
             	<input type="button" class="reportBtn" value="음란물">문란하다고 생각합니다!<br>
              	<input type="button" class="reportBtn" value="광고글">광고글인 것 같아요!<br>
              	<input type="button" class="reportBtn" value="욕설">욕설이 담겨져 있어요!<br>
              	<input type="button" class="reportBtn" value="기타"/> 
     		  	<input type="button" class="reportBtn" name="reason" value="">기타 <input type="text"><br> -->
              
            </form>
          </div>
  
  
        </div>
  
      </div>
 </body>