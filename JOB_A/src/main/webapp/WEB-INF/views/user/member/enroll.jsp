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


<title>회원가입</title>
<style>

	/* 회원가입 폼 사이드바 옆으로 배열*/
	#list_2 {
		display: flex;
		height: 1800px;
	}
	/* 폼 배치 조절 */
	.memberEnrollForm {
		padding-top: 100px;
		padding-left: 280px;

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


							<form class="memberEnrollForm" id="memberEnrollForm" action="memberEnroll.do" method="post" onsubmit="return validate();">
								<!-- 기본정보 테이블 -->
								<input type="hidden" class="check_email" value="false" /> <!-- 이메일 인증 여부 -->
								<input type="hidden" class="email" name="memEmail" value="" />	<!-- 컨트롤러로 보낼 이메일 -->
								<input type="hidden" class="check_Id" value="false" /> <!-- 아이디 중복 체크 여부 -->
								<input type="hidden" class="check_info" value="false" /> <!-- 약관 체크 여부 -->
								
								<table>
									<tr>
										<h2 class="info">기본정보</h2>
									</tr>
									<tr>
										<th class="table_th">아이디 <span class="star">*</span> </th>
										<td>
											<input type="text" size="30" class="userInputId" name="memId" id="memId_" required></td>
										<td>
											<!-- 아이디 중복검사 --> &nbsp;
											<button type="button" class="duplicateCheck" name="idDuplicateCheck" id="idDuplicateCheck">중복확인</button>
										</td>
									</tr>
									
									<tr>
										<th class="table_th">비밀번호 <span class="star">*</span> </th>
										<td>
											<input type="password" size="30" class="form-control" name="memPw" id="password1" required />
										</td>
									</tr>
									<tr>
										<th class="table_th">비밀번호 확인 <span class="star">*</span> </th>
										<td>
											<input type="password" size="30" class="form-control" name="memPwCheck" id="password2" required />
										</td>
										<td>										
											<div class="passwordCheck"></div>
										</td>
									</tr>
									<tr>
										<th class="table_th">닉네임 <span class="star">*</span></th>
										<td id="memNick-container">
											<input type="text" size="30" class="form-control" name="memNick" id="nickname_" placeholder="10글자 미만" required />
											<!-- 닉네임 중복 검사 코멘트 추가 -->
											<span class="guide ok">사용 가능</span>
				            				<span class="guide error">사용 불가</span>
				            				<span class="guide invalid">10글자 미만</span>
				            				<input type="hidden" name="nickNameDuplicateCheck" id="nickNameDuplicateCheck" value="0"/>
										</td>
									</tr>
									
									<tr>
										<th class="table_th">이메일 <span class="star">*</span> </th>
										<td>
											<input type="text" size="11" class="mail_input"  id="memEmail" required /> &nbsp;@&nbsp;
											
											<select name="domain" size="1" id="domain" class="domain_select" >
												<option value="none" >&nbsp;&nbsp;&nbsp;- 선택 -</option>
												<option value="self" >- 직접입력 -</option>
												<option value="naver.com" >naver.com</option>
												<option value="gmail.com" >gmail.com</option>
												<option value="hanmail.net" >hanmail.net</option>
												<option value="nate.com" >nate.com</option>
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
										<td id="bir_yy" class="box">
											<input type="date" size="30" id="memBirth" name="memBirth" /> 
											<!-- BIRTH_YY --> 
											<!--<input type="text" size="5" id="yy" class="int" min="1900" max="2020" maxlength="4" placeholder="년(4자)">&nbsp;년
								
													<select size="1" name="birth_mm" id="mm" class="int"> 
													    <option>&nbsp;--</option>
					                                    <option value="01">1</option>
					                                    <option value="02">2</option>
					                                    <option value="03">3</option>
					                                    <option value="04">4</option>
					                                    <option value="05">5</option>
					                                    <option value="06">6</option>
					                                    <option value="07">7</option>
					                                    <option value="08">8</option>
					                                    <option value="09">9</option>                                    
					                                    <option value="10">10</option>
					                                    <option value="11">11</option>
					                                    <option value="12">12</option>
													</select> 월
		
								 				<input type="text" size="2.5" id="dd" class="int" min="1" max="31" maxlength="2"> 일 -->
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
											<input type="checkbox" name="category_No" id="job1" class="jobCheck" value="3" /> 
											<label class="form-check-label" for="job1">IT·인터넷</label> 
											
											<input type="checkbox" name="category_No" id="job2" class="jobCheck" value="7" /> 
											<label class="form-check-label" for="job2">의료</label>

											<input type="checkbox" name="category_No" id="job3" class="jobCheck" value="1" /> 
											<label class="form-check-label" for="job3">경영·사무</label><br> 
											
											<input type="checkbox" name="category_No" id="job4" class="jobCheck" value="5" /> 
											<label class="form-check-label" for="job4">서비스</label>5

											<input type="checkbox" name="category_No" id="job5" class="jobCheck" value="9" /> 
											<label class="form-check-label" for="job5">교육</label>
										</td>
									</tr>
									
									<tr>
										<th class="table_th">선호지역</th>
										<td>
											<select name="memArea" size="1"  class="location_sido" id="sido1">
												<option value="" >------- 시/도 -------</option>
											</select> 
											<select name="memArea" size="1"  class="location_sigu" id="sigugun1">
												<option value="" >------- 구 -------</option>
											</select>
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
											<select name="memArea" size="1" class="location_sido" id="sido2">
												<option value="">------- 시/도 -------</option>
											</select> 
											<select name="memArea" size="1" class="location_sigu" id="sigugun2">
												<option value="" >------- 구 -------</option>
											</select>
										</td>
									</tr>
									<br />
									<tr>
										<th></th>
										<td>
											<select name="memArea" size="1" class="location_sido" id="sido3">
												<option value="" >------- 시/도 -------</option>
											</select> 
											<select name="memArea" size="1" class="location_sigu" id="sigugun3">
												<option value="" >------- 구 -------</option>
										</select></td>
									</tr>
								</table>
								<br> <br>
								<!-- 약관동의 테이블 -->
								<table>
									<tr>
										<h2 class="info">약관동의</h2>
									</tr>
									<tr>
										<th> <!-- <input type="checkbox" name="click1" id="click1">  -->
										</th>
										<td>
											<!--<a href="#" onclick="show('content')">  JOBA 서비스 이용약관 동의 (필수) &nbsp;&nbsp;></a> -->
											<input type="checkbox" name="agree" id="agree1" class="agree_"> 
											<label class="form-check-label" for="agree1" onclick="show('content')"> JOBA 서비스 이용약관 동의 (필수) </label>
										</td>

									</tr>
									<tr>
										<td colspan="3">
										<textarea id="content" readonly="readonly" rows="5" cols="66" style="display: none;">
											제 1 조 (목적)
											
											이 약관은 JOBA회사가 제공하는 JOBA 및 JOBA 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
											
											
											제 2 조 (정의)
											
											이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
											①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 JOBA 및 JOBA 관련 제반 서비스를 의미합니다.
											②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "JOBA"와 이용계약을 체결하고 "JOBA"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
											③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "JOBA"가 승인하는 문자와 숫자의 조합을 의미합니다.
											④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
											⑤"유료서비스"라 함은 "JOBA"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
											⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
											⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다. 
										</textarea>
										</td>
									</tr>
									<tr>
										<th><!--  <input type="checkbox" name="click2" id="click2">   -->
										</th>
										<td>
											<!--<a href="#" onclick="show('content')"> JOBA 개인정보 수집 동의 (필수) &nbsp;&nbsp;> </a> -->
											<input type="checkbox" name="agree" id="agree2" class="agree_"> 
											<label class="form-check-label" for="agree2" onclick="show('content2')"> JOBA 서비스 이용약관 동의 (필수) </label>
										</td>
									</tr>
									<tr>
										<td colspan="3">
										<textarea id="content2" readonly="readonly" rows="5" cols="66" style="display: none;">
											정보통신망법 규정에 따라 JOBA에 회원가입 신청하시는 분께 수집하는 
											개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 
											자세히 읽은 후 동의하여 주시기 바랍니다.
								
								
											1. 수집하는 개인정보
											
											이용자는 회원가입을 하지 않아도 자유게시판 열람 등 대부분의 JOBA가 제공하는 서비스를 일반 회원과 동일하게 이용할 수 있습니다. 
											이용자가 각종 게시판 작성, 채팅, 캘린더, 1:1문의, 멘토&멘티 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 
											JOBA는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. 
										</textarea>
										</td>
									</tr>
								</table>

								<br> 
									<input type="submit" id="enroll" class="button" value="회원가입"> &nbsp;&nbsp; 
									<input type="button" id="cancel" class="button" value="취소">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<c:import url="../common/sideBar.jsp" />
		
	</div>
</body>
						<!-- 선호지역 스크립트 -->
						<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
						<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
				
						<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
						
						<script type="text/javascript">

						var code = ""; 	//이메일전송 인증번호 저장위한 코드

							/* 아이디 중복 체크 */
							$(".duplicateCheck").click(function(){
								var memId = $(".userInputId").val();
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
								var email = $(".mail_input").val()+"@"+$("#domain option:selected").val(); // 입력한 이메일
								// console.log("email : " + email);
								var checkBox = $(".mail_check_input");        // 인증번호 입력란
							    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
   						    $.ajax({
   						   
   						        type:"GET",
   						        url:"member/emailCheck.do",
   						        data: "email=" + email,
   						        success:function(data){ 				// data : 스트링으로 변환된 인증코드

   						        // console.log("data : " + data);
   						        boxWrap.attr("disabled", false);
   	   							boxWrap.attr("id", "mail_check_input_box_true");
   	   							code = data;
   	   						        }
								});
							});

							/*인증확인 버튼 클릭 시*/
							$(".confirm_code").click(function(){
								var userInputCode = $(".mail_check_input_box").val();
								var email = $(".mail_input").val()+"@"+$("#domain option:selected").val(); // 입력한 이메일

								console.log("code: "+code+"userInputCode: "+userInputCode);

								if( code != null ){
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
						        
						        if(memNick.length>10) {
						        	$(".guide.error").hide();
						        	$(".guide.ok").hide();
						        	$(".guide.invalid").show();
						        	return;
						        	
						        } else {
						        	
							        $.ajax({
							            url  : "${pageContext.request.contextPath}/member/checkNicknameDuplicate.do",
							            data : {memNick:memNick},
							            dataType: "json",
							            success : function(data){
							                // console.log(data);
							                // if(data=="true") //stream 방식
							                if(data.isUsable==true){ //viewName 방식
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
							});
						
						
						function validate(){
							var memNick = $("#nickname_");
							if(memNick.val().trim().length>10){
								alert("닉네임은 최소 10자리 미만이어야 합니다.");
								memNick.focus();
								return false;
							}
							
							// 아이디 중복 체크 여부
							if($(".check_Id").val()=="false"){
								alert("아이디를 다시 확인 해주세요.");
								return false;
								
							}
							
							// 닉네임 중복 체크 여부
						    if($("#nickNameDuplicateCheck").val()==0){
						        alert("사용가능한 닉네임을 입력해주세요.");
						        return false;
						    }

						    // 이용약관 체크 여부
						    if($(".check_info").val()=="false"){
								alert("이용약관 필수에 동의 해주세요.");
								return false;
							}
									    
						    // 이메일 인증 확인 여부
						    if($(".check_email").val()=="false"){
						        alert("이메일 인증을 해주세요.");
						        return false;
							} 
							
							return true;
							}

							/* 선호지역 API 스크립트 */
							jQuery(document).ready(function(){
								  //sido option 추가
								  jQuery.each(hangjungdong.sido, function(idx, code){
								    //append를 이용하여 option 하위에 붙여넣음
								    jQuery('#sido1').append(fn_option(code.sido, code.codeNm));
								  });
								 
								  //sido 변경시 시군구 option 추가
								  jQuery('#sido1').change(function(){
								    jQuery('#sigugun1').show();
								    jQuery('#sigugun1').empty();
								    jQuery('#sigugun1').append(fn_option('','선택')); //
								    jQuery.each(hangjungdong.sigugun, function(idx, code){
								      if(jQuery('#sido1 > option:selected').val() == code.sido)
								        jQuery('#sigugun1').append(fn_option(code.sigugun, code.codeNm));
								    });
								 
								    //세종특별자치시 예외처리
								    //옵션값을 읽어 비교
								    if(jQuery('#sido1 option:selected').val() == '36'){
								      jQuery('#sigugun1').hide();
								      //index를 이용해서 selected 속성(attr)추가
								      //기본 선택 옵션이 최상위로 index 0을 가짐
								      jQuery('#sigugun1 option:eq(1)').attr('selected', 'selected');
								      //trigger를 이용해 change 실행
								      jQuery('#sigugun1').trigger('change');
								    }
								  });
								 
								  //시군구 변경시 행정동 옵션추가
								  // jQuery('#sigugun').change(function(){
								    //option 제거
								    /*
								    jQuery('#dong').empty();
								    jQuery.each(hangjungdong.dong, function(idx, code){
								      if(jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
								        jQuery('#dong').append(fn_option(code.dong, code.codeNm));
								    });
								    
								    //option의 맨앞에 추가
								    jQuery('#dong').prepend(fn_option('','선택'));
								    //option중 선택을 기본으로 선택
								    jQuery('#dong option:eq("")').attr('selected', 'selected');
								 
								  });
								*/
								 
								  jQuery('#sigugun1').change(function(){
								    var sido = jQuery('#sido1 option:selected').val();
								    var sigugun = jQuery('#sigugun1 option:selected').val();
								    //var dong = jQuery('#dong option:selected').val();
								    var dongCode = sido + sigugun + '00';    
		
								    var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido1").val());
								    var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun1").val()&&i.sido==$("#sido1").val());
								    
								    var sido = hangjungdong.sido[sidoIdx].codeNm;//시
								    var sigungu = hangjungdong.sigugun[sigugunIdx].codeNm;//시군구
		
								    alert(sido + ":" + sigungu);
								    
								  });
								});
								function fn_option(code, name){
								  return '<option value="' + code +'">' + name +'</option>';
								}
		
								/*두번째 선호지역 */
								jQuery(document).ready(function(){
									  //sido option 추가
									  jQuery.each(hangjungdong.sido, function(idx, code){
									    //append를 이용하여 option 하위에 붙여넣음
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
									 
									    //세종특별자치시 예외처리
									    //옵션값을 읽어 비교
									    if(jQuery('#sido2 option:selected').val() == '36'){
									      jQuery('#sigugun2').hide();
									      //index를 이용해서 selected 속성(attr)추가
									      //기본 선택 옵션이 최상위로 index 0을 가짐
									      jQuery('#sigugun2 option:eq(1)').attr('selected', 'selected');
									      //trigger를 이용해 change 실행
									      jQuery('#sigugun2').trigger('change');
									    }
									  });
									
									 
									  jQuery('#sigugun2').change(function(){
									    var sido = jQuery('#sido2 option:selected').val();
									    var sigugun = jQuery('#sigugun2 option:selected').val();
									    //var dong = jQuery('#dong option:selected').val();
									    var dongCode = sido + sigugun + '00';    
		
									    var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido2").val());
									    var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun2").val()&&i.sido==$("#sido2").val());
									    
									    var sido = hangjungdong.sido[sidoIdx].codeNm;//시
									    var sigungu = hangjungdong.sigugun[sigugunIdx].codeNm;//시군구
		
									    alert(sido + ":" + sigungu);
									    
									  });
									});
									function fn_option(code, name){
									  return '<option value="' + code +'">' + name +'</option>';
									}
		
									/*세번째 선호지역 */
									jQuery(document).ready(function(){
										  //sido option 추가
										  jQuery.each(hangjungdong.sido, function(idx, code){
										    //append를 이용하여 option 하위에 붙여넣음
										    jQuery('#sido3').append(fn_option(code.sido, code.codeNm));
										  });
										 
										  //sido 변경시 시군구 option 추가
										  jQuery('#sido3').change(function(){
										    jQuery('#sigugun3').show();
										    jQuery('#sigugun3').empty();
										    jQuery('#sigugun3').append(fn_option('','선택')); //
										    jQuery.each(hangjungdong.sigugun, function(idx, code){
										      if(jQuery('#sido3 > option:selected').val() == code.sido)
										        jQuery('#sigugun3').append(fn_option(code.sigugun, code.codeNm));
										    });
										 
										    //세종특별자치시 예외처리
										    //옵션값을 읽어 비교
										    if(jQuery('#sido3 option:selected').val() == '36'){
										      jQuery('#sigugun3').hide();
										      //index를 이용해서 selected 속성(attr)추가
										      //기본 선택 옵션이 최상위로 index 0을 가짐
										      jQuery('#sigugun3 option:eq(1)').attr('selected', 'selected');
										      //trigger를 이용해 change 실행
										      jQuery('#sigugun3').trigger('change');
										    }
										  });
										
										 
										  jQuery('#sigugun3').change(function(){
										    var sido = jQuery('#sido3 option:selected').val();
										    var sigugun = jQuery('#sigugun3 option:selected').val();
										    //var dong = jQuery('#dong option:selected').val();
										    var dongCode = sido + sigugun + '00';    
		
										    var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido3").val());
										    var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun3").val()&&i.sido==$("#sido3").val());
										    
										    var sido = hangjungdong.sido[sidoIdx].codeNm;//시
										    var sigungu = hangjungdong.sigugun[sigugunIdx].codeNm;//시군구
		
										    alert(sido + ":" + sigungu);
										    
										  });
										});
										function fn_option(code, name){
										  return '<option value="' + code +'">' + name +'</option>';
										}		
					
							/* 이용약관 클릭시 보여지는 스크립트*/
							function show(id) {
								obj = document.getElementById(id);
								if (obj.style.display == "none") {
									obj.style.display = "inline";
								} else {
									obj.style.display = "none";
								}
							}
							
							/* 이용약관 체크박스 체크시 */			
							   $("#agree1").change(function(){
							       if($("#agree1").is(":checked") && $("#agree2").is(":checked")){
										$(".check_info").val("true");							       
							       }
							       else{
										$(".check_info").val("false");						        
							       }
							   });
							   
							   $("#agree2").change(function(){
							       if($("#agree1").is(":checked") && $("#agree2").is(":checked")){
										$(".check_info").val("true");				           
							       }
							       else{
										$(".check_info").val("false");							           
							       }
							   });
						</script>
</html>