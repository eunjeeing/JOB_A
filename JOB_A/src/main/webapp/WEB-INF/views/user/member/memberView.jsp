<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- cnd방식으로 sockjs불러오기 -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- 부트스트랩적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous">
</script>


<title>회원정보 수정 페이지</title>
<style>

	/* 회원가입 폼 사이드바 옆으로 배열*/
	#list_2 {

		display: flex;
		height: 1800px;
	}
	
	/* 폼 배치 조절 */
	#list_2 form{
		width: 580px;
		margin: 0 auto;
		padding-top: 100px;
	}
	
	/* 회원가입 버튼 중간배열 */
	.memberEnrollForm input[type=submit]{
		margin-left : 150px;
	}

	/* 필수입력 * color */
	.star {
		color: rgba(232, 112, 112, 0.85);
	}
	
	/* 선호지역 드롭바*/
	#sido1, #sido2, #sido3, #sigugun1, #sigugun2, #sigugun3{
		width : 280.67px;
		border : solid 1px rgba(210, 215, 217, 0.75);
		border-radius : 4px;
		margin-top: 10px;
	}

	/*중복닉네임체크관련*/
	td#memNick-container{position:relative;}
	td#memNick-container span.guide {display:none;font-size: 12px;position:absolute; top:10px; right:20px; padding-top:13px; padding-right:5px;}
	td#memNick-container span.ok{color:green;}
	td#memNick-container span.error, span.invalid{color:red;}
	
	/* 이메일 api*/
	#mail_check_input_box_false{
	    background-color:#ebebe4;
	}

	#mail_check_input_box_true{
	    background-color:white;
	}

	.domain_select{
		border : solid 1px rgba(210, 215, 217, 0.75);
		border-radius : 4px;
		width : 280.67px;
	}
	
	#memBirth{
		border : solid 1px rgba(210, 215, 217, 0.75);
		border-radius : 4px;
		width : 280.67px;
	}
	
	/* 수정 버튼 */
	#updated{
		margin-left : 0px;
	}
	.buttons{
	text-align: center;
	}
	.buttons input{
		margin: 0 5px ;
	}
</style>
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<div id="container">
					<div id="join-container">
						<c:import url="../common/header.jsp" />
						<div id="list_2">

							<form class="memberEnrollForm" id="memberEnrollForm" action="memberUpdated.do" method="post" onsubmit="return validate();">
								<!-- 기본정보 테이블 -->
								<input type="hidden" class="check_email" value="true" /> 
								<input type="hidden" class="email" name="memEmail" value="${member.memEmail}" />	
								<input type="hidden" class="check_Id" value="false" />
								<input type="hidden" class="check_info" value="false" /> 
								<input type="hidden" class="local" value="${member.memArea}" /> 
								<input type="hidden" class="check_nickName" value="${member.memNick}" />
								<!-- 선호지역 -->
								<input type="hidden" class="local1" name="memArea" value="">
								<input type="hidden" class="local2" name="memArea" value="">
								<input type="hidden" class="local3" name="memArea" value="">
								<!-- ★관심 직종 배열 바인딩★ -->
								<c:forEach items="${wishcategory}" var="categoryList" varStatus="status">
									<input type="hidden" class="jobList" id="category${status.count}" value="${categoryList.resultCategory}"/> 
								</c:forEach>
								
								<table>
									<tr>
										<h2 class="info">기본정보</h2>
									</tr>
									<tr>
										<th class="table_th">아이디 <span class="star">*</span> </th>
										<td>
											<input type="text" size="30" class="userInputId" name="memId" id="memId_" readonly="readonly" value="${member.memId}"required ></td>
										<td>
										</td>
									</tr>
									
									<tr>
										<th class="table_th">비밀번호 <span class="star">*</span> </th>
										<td>
											<input type="password" size="30" class="form-control" name="memPw" id="password1" onblur="validate2(this)" placeholder="영문 대소문자 + 숫자 6~18" required />
										</td>
									</tr>
									<tr>
										<th class="table_th">비밀번호 확인 <span class="star">*</span> </th>
										<td>
											<input type="password" size="30" class="form-control" name="memPwCheck" id="password2" placeholder="영문 대소문자 + 숫자 6~18" required />
										</td>
										<td>										
											<div class="passwordCheck"></div>
										</td>
									</tr>
									<tr>
										<th class="table_th">닉네임 <span class="star">*</span></th>
										<td id="memNick-container">
											<input type="text" size="30" class="form-control" maxlength="6" memNick" id="nickname_" value="${member.memNick}" required />
											<!-- 닉네임 중복 검사 코멘트 추가 -->
											<span class="guide ok">사용 가능</span>
				            				<span class="guide error">사용 불가</span>
				            				<span class="guide invalid">최대 6글자</span>
				            				<input type="hidden" name="nickNameDuplicateCheck" id="nickNameDuplicateCheck" value="1"/>
										</td>
										<td>
											
										</td>
									</tr>
									
									<tr>
										<th class="table_th">이메일 <span class="star">*</span> </th>
										<td>
											<input type="text" class="mail_input" id="memEmail" onblur="validate2(this)" value="${member.memEmail}" required /> &nbsp;@&nbsp;
											<br />
											<select name="domain" size="1" id="domain" class="domain_select" onblur="validate2($('#email'))">
												<option value="none" >&nbsp;&nbsp;&nbsp; ---------- 선택 ----------</option>
												<option value="naver.com" >&nbsp;&nbsp;naver.com</option>
												<option value="gmail.com" >&nbsp;&nbsp;gmail.com</option>
												<option value="hanmail.net" >&nbsp;&nbsp;hanmail.net</option>
												<option value="nate.com" >&nbsp;&nbsp;nate.com</option>
											</select> 
											
										</td>
										<td>
											&nbsp;
											<button type="button" class="mail_check_button" id="confirmCode">인증코드 발송</button> <br>
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
											<input type="text" size="30"  class="mail_check_input_box" id="mail_check_input_box_false" disabled="disabled" />
										</td>
										<td>&nbsp;
											<button type="button" class="confirm_code" name="confirmCodeCheck" id="confirmCodeCheck">인증확인</button>
										</td>

									</tr>
									<tr>
										<th class="table_th">생년월일 <span class="star">*</span></th>
										<td>
											<input type="date" size="30" id="memBirth" name="memBirth" onchange="check()" disabled="disabled" value="${member.memBirth}"/> 
										</td>
									</tr>
								</table>
								
								<br> <br>
								<!-- 추가정보 테이블 -->
								<table>
									<tr>
										<h2 class="info">추가정보</h2>
									</tr>
									<tr>
										<th class="table_th">관심직종 <span class="star">*</span></th>
										<td>
											<input type="checkbox" name="category_No" id="job1" class="jobCheck" value="1" /> 
											<label class="form-check-label" for="job1">경영·사무</label> 
											
											<input type="checkbox" name="category_No" id="job2" class="jobCheck" value="2" /> 
											<label class="form-check-label" for="job2">마케팅·광고·홍보</label>

											<input type="checkbox" name="category_No" id="job3" class="jobCheck" value="3" /> 
											<label class="form-check-label" for="job3">IT·미디어</label><br> 
											
											<input type="checkbox" name="category_No" id="job4" class="jobCheck" value="4" /> 
											<label class="form-check-label" for="job4">영업</label>

											<input type="checkbox" name="category_No" id="job5" class="jobCheck" value="5" /> 
											<label class="form-check-label" for="job5">서비스</label>
											
											<input type="checkbox" name="category_No" id="job6" class="jobCheck" value="6" /> 
											<label class="form-check-label" for="job6">연구개발</label>
											
											<input type="checkbox" name="category_No" id="job7" class="jobCheck" value="7" /> 
											<label class="form-check-label" for="job7">의료</label><br>
											
											<input type="checkbox" name="category_No" id="job8" class="jobCheck" value="8" /> 
											<label class="form-check-label" for="job8">건설</label>
											
											<input type="checkbox" name="category_No" id="job9" class="jobCheck" value="9" /> 
											<label class="form-check-label" for="job9">교육</label>
											
											<input type="checkbox" name="category_No" id="job10" class="jobCheck" value="10" /> 
											<label class="form-check-label" for="job10">생산·제조</label>
											
											<input type="checkbox" name="category_No" id="job11" class="jobCheck" value="11" /> 
											<label class="form-check-label" for="job11">무역·유통</label>
											
										</td>
									</tr>
									
									<tr>
										<th class="table_th">선호지역</th>
										<td>
											<select name="" size="1"  class="location_sido" id="sido1">
												<option value="" > &nbsp;&nbsp;---------- 시/도 ----------</option>
											</select> 
											<br />
											<select name="" size="1"  class="location_sigu" id="sigugun1">
												<option value="" >&nbsp;&nbsp;----------- 구 -----------</option>
											</select>
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
											<select name="" size="1" class="location_sido" id="sido2">
												<option value="" > &nbsp;&nbsp;---------- 시/도 ----------</option>
											</select> 
											<br />
											<select name="" size="1" class="location_sigu" id="sigugun2">
												<option value="" >&nbsp;&nbsp;----------- 구 -----------</option>
											</select>
										</td>
									</tr>
									<br />
									<tr>
										<th></th>
										<td>
											<select name="" size="1" class="location_sido" id="sido3">
												<option value="" > &nbsp;&nbsp;---------- 시/도 ----------</option>
											</select> 
											<br />
											<select name="" size="1" class="location_sigu" id="sigugun3">
												<option value="" >&nbsp;&nbsp;----------- 구 -----------</option>
										</select></td>
									</tr>
								</table>
								<div class="buttons">								
									<input type="button" class="updateSuccess" onclick="location.href='${pageContext.request.contextPath}/member/memberDelete.do'" value="회원탈퇴">&nbsp;
									<input type="button" class="updateSuccess" value="취소" onclick="location.href='${pageContext.request.contextPath}/member/myPage.do'">&nbsp;
									<input type="submit" class="updateSuccess" id="updated" value="수정" >
								</div>
								<br> 
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<c:import url="../common/sideBar.jsp" />
		
	</div>
	
</body>
			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
			
						<!-- 선호지역 스크립트 -->
						<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
						<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
				
						<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
						
						<script type="text/javascript">

						var code = ""; 	
						
						/* 이메일 바인딩 */
						$(function(){
							var email = $("#memEmail").val();
							var email_id = email.split("@");
		
							 console.log(email_id[0]);					
							 console.log(email_id[1]);	
							$("#memEmail").val(email_id[0]);
							$("#domain").val(email_id[1]);

						/* 관심직종 배열 바인딩 */
							var jobList = $(".jobList").length;
							console.log("jobList : " + jobList);
							for(var i = 1; i <= jobList; i++){
								$('input:checkbox[name="category_No"][value="'+$("#category"+i).val()+'"]').prop('checked', true);	
							}
						});

						$("#memEmail").change(function(){
			
							var email = $(".email").val().split("@");
							console.log(email[0]);
							
							var email2 = $("#memEmail").val();
							console.log(email2);

							if(email[0] != email2){
								$('.check_email').val("false");
								console.log("이메일인증을하시오");
								}else{
									$('.check_email').val("true");

									}
							});
						
						/*각 종 유효성 검사*/
						function validate2(obj){
						
							var validate = ''; 
							var valiMessage = '';
							
							var inputValue = $(obj).val(); 
							
							switch($(obj).attr('id')) {
							case 'memId_':
								validate = /^[a-z][a-z0-9_-]{3,17}$/; // (영문소문자+숫자 4~18자리, 영문소문자로 시작)
								valiMessage = '소문자와 숫자를 조합하여 4~18자리 생성해 주세요 ~^^';
								break;
								
							case 'password1':
								validate = /^[A-Za-z0-9_-]{6,18}$/; // (영문대소문자+숫자 6~18자리)
								valiMessage = '대,소문자와 숫자를 조합하여 6~18자리 생성해 주세요 ~^^';
								break;
							
							case 'memEmail':
								validate = /^[A-Za-z0-9_-]{1,18}$/;
								valiMessage = '이메일 형식을 확인해주세요';
							
								break;
								
							}
							
							// 유효성 체크
							if(validate.test(inputValue)){
								valiText.text('');
							} else {
								alert(valiMessage);
							}
						}
							
							/* 아이디 중복 체크 */
							$(".duplicateCheck").click(function(){
								var memId = $(".userInputId").val();
								
									if(memId == null || memId == ""){
										alert("아이디를 입력해주세요!!");	
												
										} else{ 
											
								console.log("userInputId : " + memId);

								$.ajax({
									url  : "${pageContext.request.contextPath}/member/idCheckDuplicate.do",
									data : {memId:memId},
							        dataType: "json",
							        success : function(data){
							        console.log(data);

							        if(data.checkId==true){
										alert("사용 가능한 아이디입니다.");
										$(".check_Id").val('true');
										
								        } else{
											alert("이미 가입된 아이디입니다.");
									        }
									}
									});
											}
								});

							/* 비밀번호 확인 */
							$("#password2").change(function(){
								if($('#password1').val() != $('#password2').val()) $('.passwordCheck').html("다시적어줘잉~~");
								else $('.passwordCheck').html("잘~~했어!");
							});

							$("#memberEnrollForm").submit(function(event){
								if($("#password1").val() == "" || $("#memId_").val() == "") alert("아이디나 비밀번호는 필수에용~!");
								else if($('#password1').val() != $('#password2').val()) alert("비밀번호 확인 값이 다른데 한 번 더 확인해보시겠어요? ");
								else return;
								event.preventDefault();
							});

							/* 인증번호 이메일 전송 */
							$(".mail_check_button").click(function(){
								var email = $(".mail_input").val()+"@"+$("#domain option:selected").val();
								
									if($(".mail_input").val() == null || $(".mail_input").val() == "" || $("#domain option:selected").val() == "none"){
											alert("이메일을 다시 확인해주세요 ~^^");
											
										} else{
											alert("인증번호를 발송했습니다! ")
								var checkBox = $(".mail_check_input");       
							    var boxWrap = $(".mail_check_input_box");    
							    console.log("1");
   						    $.ajax({
   						   		
   						        type:"GET",
   						        url:"emailCheck.do",
   						        data: "email=" + email,
   						        success:function(data){ 				

   						        boxWrap.attr("disabled", false);
   	   							boxWrap.attr("id", "mail_check_input_box_true");
   	   							code = data;
   	   						        }
								});
											}
							});

							/*인증확인 버튼 클릭 시*/
							$(".confirm_code").click(function(){
								var userInputCode = $(".mail_check_input_box").val();
								var email = $(".mail_input").val()+"@"+$("#domain option:selected").val(); 

								console.log("code: "+code+"userInputCode: "+userInputCode);

								if( code != null && code != ""){
									if( code == userInputCode){
										alert("이메일 인증 성공 >_<");
										$(".check_email").val("true");
										$(".email").val(email);
										
									}else{
										alert("이메일 다시 확인해줘잉~~");
									}
									
								}else{
									alert("인증번호 발급받아줘잉~~");
								}
						
							});

							/* 닉네임 중복검사 이벤트 추가 */
							$("#nickname_").on("keyup", function(){
						        var memNick = $(this).val().trim(); 
						        
						   
						        var nickName = $(".check_nickName").val().trim();
					        	console.log("memNick:"+memNick+"nickName:"+nickName);
					        	
						        if( memNick == nickName || memNick =="" || memNick == null){ 
							        	console.log("같다");
					                    $(".guide.ok").hide();
							        	$(".guide.error").hide();
					                    $(".guide.invalid").hide();
					                    
								        
						        } else {
						        if(memNick.length>6 ) {
						        	$(".guide.error").hide();
						        	$(".guide.ok").hide();
						        	$(".guide.invalid").show();
						        	return;
						        }else{
						        	
							        $.ajax({
							            url  : "${pageContext.request.contextPath}/member/checkNicknameDuplicate.do",
							            data : {memNick:memNick},
							            dataType: "json",
							            success : function(data){
								            
							                if(data.isUsable==true){ 
							                    $(".guide.error").hide();
							                    $(".guide.invalid").hide();
							                    $(".guide.ok").show();
							                    $("#nickNameDuplicateCheck").val(1);
							                } else {
							                    $(".guide.error").show();
							                    $(".guide.invalid").hide();
							                    $(".guide.ok").hide();
							                    $("#nickNameDuplicateCheck").val(0);
							                }
							            }, error : function(jqxhr, textStatus, errorThrown){
							                console.log("ajax 처리 실패");
							                //에러로그
							                console.log(jqxhr);
							                console.log(textStatus);
							                console.log(errorThrown);
							            }
						        	});
						     	}
						     console.log(memNick);
						        } 
						     
						        
							});
						
						
						function validate(){
							var memNick = $("#nickname_");
							if(memNick.val().trim().length>6){
								alert("닉네임은 최대 6자리 입니다.");
								memNick.focus();
								return false;
							}
							
							// 여기서부턴 중복 체크 여부
						    if($("#nickNameDuplicateCheck").val()==0){
						        alert("사용가능한 닉네임을 입력해주세요.");
						        return false;
						    }
									    
						    if($(".check_email").val()=="false"){
						        alert("이메일 인증을 해주세요.");
						        return false;
							} 
							
							return true;
							}

							// 생년월일 날짜 제약조건
							   function check(){
						        var date = new Date();
						 
						        var date2 = new Date( $("#memBirth").val());
						        
						        if(date2>date){
							       alert("당신 미래에서 오셨나요 ? ")
						            $("#memBirth").val(null);
						        }
						    };
						
							/* 선호지역 API 스크립트 */
							jQuery(document).ready(function(){
								 
								  jQuery.each(hangjungdong.sido, function(idx, code){
								    
								    jQuery('#sido1').append(fn_option(code.sido, code.codeNm));
								  });
								 
								 
								  jQuery('#sido1').change(function(){
								    jQuery('#sigugun1').show();
								    jQuery('#sigugun1').empty();
								    jQuery('#sigugun1').append(fn_option('','선택')); //
								    jQuery.each(hangjungdong.sigugun, function(idx, code){
								      if(jQuery('#sido1 > option:selected').val() == code.sido)
								        jQuery('#sigugun1').append(fn_option(code.sigugun, code.codeNm));
								    });
								 
								    if(jQuery('#sido1 option:selected').val() == '36'){
								      jQuery('#sigugun1').hide();
								      jQuery('#sigugun1 option:eq(1)').attr('selected', 'selected');
								      jQuery('#sigugun1').trigger('change');
								    }
								  });

								  jQuery('#sigugun1').change(function(){
								    var sido = jQuery('#sido1 option:selected').val();
								    var sigugun = jQuery('#sigugun1 option:selected').val();
								    var dongCode = sido + sigugun + '00';    
		
								    var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido1").val());
								    var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun1").val()&&i.sido==$("#sido1").val());
								    
								    var sido = hangjungdong.sido[sidoIdx].codeNm;
								    var sigungu = hangjungdong.sigugun[sigugunIdx].codeNm;
		
								    $(".local1").val(sido+" "+sigungu); 
								    
								  });
								});
								function fn_option(code, name){
								  return '<option value="' + code +'">' + name +'</option>';
								}
		
								/*두번째 선호지역 */
								jQuery(document).ready(function(){
								
									  jQuery.each(hangjungdong.sido, function(idx, code){
									    jQuery('#sido2').append(fn_option(code.sido, code.codeNm));
									  });
									 
									  //sido 변경시 시군구 option 추가
									  jQuery('#sido2').change(function(){
									    jQuery('#sigugun2').show();
									    jQuery('#sigugun2').empty();
									    jQuery('#sigugun2').append(fn_option('','선택')); //
									    jQuery.each(hangjungdong.sigugun, function(idx, code){
									      if(jQuery('#sido2 > option:selected').val() == code.sido)
									        jQuery('#sigugun2').append(fn_option(code.sigugun, code.codeNm));
									    });
									 
									    if(jQuery('#sido2 option:selected').val() == '36'){
									      jQuery('#sigugun2').hide();
									      jQuery('#sigugun2 option:eq(1)').attr('selected', 'selected');
									      jQuery('#sigugun2').trigger('change');
									    }
									  });
									
									 
									  jQuery('#sigugun2').change(function(){
									    var sido = jQuery('#sido2 option:selected').val();
									    var sigugun = jQuery('#sigugun2 option:selected').val();
									    var dongCode = sido + sigugun + '00';    
		
									    var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido2").val());
									    var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun2").val()&&i.sido==$("#sido2").val());
									    
									    var sido = hangjungdong.sido[sidoIdx].codeNm;
									    var sigungu = hangjungdong.sigugun[sigugunIdx].codeNm;
		
									    $(".local2").val(sido+" "+sigungu); 
									    
									  });
									});
									function fn_option(code, name){
									  return '<option value="' + code +'">' + name +'</option>';
									}
		
									/*세번째 선호지역 */
									jQuery(document).ready(function(){
										
										  jQuery.each(hangjungdong.sido, function(idx, code){
										    jQuery('#sido3').append(fn_option(code.sido, code.codeNm));
										  });
										 
										  jQuery('#sido3').change(function(){
										    jQuery('#sigugun3').show();
										    jQuery('#sigugun3').empty();
										    jQuery('#sigugun3').append(fn_option('','선택')); //
										    jQuery.each(hangjungdong.sigugun, function(idx, code){
										      if(jQuery('#sido3 > option:selected').val() == code.sido)
										        jQuery('#sigugun3').append(fn_option(code.sigugun, code.codeNm));
										    });
										 
										    if(jQuery('#sido3 option:selected').val() == '36'){
										      jQuery('#sigugun3').hide();
										      jQuery('#sigugun3 option:eq(1)').attr('selected', 'selected');
										      jQuery('#sigugun3').trigger('change');
										    }
										  });
										
										 
										  jQuery('#sigugun3').change(function(){
										    var sido = jQuery('#sido3 option:selected').val();
										    var sigugun = jQuery('#sigugun3 option:selected').val();
										    var dongCode = sido + sigugun + '00';    
		
										    var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido3").val());
										    var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun3").val()&&i.sido==$("#sido3").val());
										    
										    var sido = hangjungdong.sido[sidoIdx].codeNm;
										    var sigungu = hangjungdong.sigugun[sigugunIdx].codeNm;
		
										    $(".local3").val(sido+" "+sigungu);
										    
										  });
										});
										function fn_option(code, name){
										  return '<option value="' + code +'">' + name +'</option>';
										}	

										/* 선호지역 바인딩 */
										$(function(){
											var area = $(".local").val();
											var area_local = area.split(",");
											console.log("area는?:"+area);
											var area1 = area_local[0].split(" ");
											var area2 = area_local[1].split(" ");
											var area3 = area_local[2].split(" ");
											
											console.log(area1[0], area1[1]);
											console.log(area2[0], area2[1]);
											
											/* 첫 번째 선호지역 하드코딩 */
										    var result = hangjungdong.sido.findIndex(i => i.codeNm == area1[0]);
										    var resultsido = hangjungdong.sido[result].sido;
										    console.log("resultsido:"+resultsido);
										    
										    var result2 = hangjungdong.sigugun.findIndex(i=>i.codeNm == area1[1]  &&i.sido==resultsido);					   
										    var result2sigungu = hangjungdong.sigugun[result2].sigugun;
										    console.log("result2sigungu:"+result2sigungu);

										    $("#sido1").val(resultsido).prop("selected", true).trigger('change');
											$("#sigugun1").val(result2sigungu).prop("selected", true);		
											$(".local1").val(area1[0]+" "+area1[1]); 
											
										    /* 두 번째 선호지역 하드코딩 */
										    var result = hangjungdong.sido.findIndex(i => i.codeNm == area2[0]);
										    var resultsido = hangjungdong.sido[result].sido;
										    console.log("resultsido:"+resultsido);
										    
										    var result2 = hangjungdong.sigugun.findIndex(i=>i.codeNm == area2[1]  &&i.sido==resultsido);					   
										    var result2sigungu = hangjungdong.sigugun[result2].sigugun;
										    console.log("result2sigungu:"+result2sigungu);

											$("#sido2").val(resultsido).trigger('change');
											$("#sigugun2").val(result2sigungu).prop("selected", true);					
											$(".local2").val(area2[0]+" "+area2[1]); 
											
										    /* 세 번째 선호지역 하드코딩 */
										    var result = hangjungdong.sido.findIndex(i => i.codeNm == area3[0]);
										    var resultsido = hangjungdong.sido[result].sido;
										    console.log("resultsido:"+resultsido);
										    
										    var result2 = hangjungdong.sigugun.findIndex(i=>i.codeNm == area3[1]  &&i.sido==resultsido);					   
										    var result2sigungu = hangjungdong.sigugun[result2].sigugun;
										    console.log("result2sigungu:"+result2sigungu);
																			
											$("#sido3").val(resultsido).trigger('change');
											$("#sigugun3").val(result2sigungu).prop("selected", true);					
											$(".local3").val(area3[0]+" "+area3[1]); 
											
										});
	
														
						</script>

</html>
