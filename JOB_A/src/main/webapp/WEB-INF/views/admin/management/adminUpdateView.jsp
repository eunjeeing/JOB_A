<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 수정</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
<body class="vertical  dark  ">
	<div class="wrapper">
		<!-- 헤더 -->
		<c:import url="../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../common/sidebar.jsp" />
		<section>
			<main role="main" class="main-content">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-6">
						<h2 class="page-title">관리자 수정</h2>
							<div class="card shadow mb-4">
								<div class="card-header">
									<div class="card-body">
										<form action="${pageContext.request.contextPath }/admin/adminUpdate" method="post">
											<div class="form-group row">
												<label for="adminId" class="col-sm-3 col-form-label">사번</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="adminId"
														name="adminId" value="${admin.adminId}" readonly="readonly">
												</div>
											</div>
											<div class="form-group row">
												<label for="adminPw" class="col-sm-3 col-form-label">비밀번호</label>
												<div class="col-sm-6">
													<input type="password" class="form-control" id="adminPw"
														name="adminPw" size="20" onblur="validate2(this)" required>
												</div>
											</div>
											<div class="form-group row">
												<label for="adminPw2" class="col-sm-3 col-form-label">비밀번호 확인</label>
												<div class="col-sm-6">
													<input type="password" class="form-control" id="adminPw2" size="20" required>
												</div>
												<div class="passwordCheck"></div>
											</div>
											<div class="form-group row">
												<label for="adminName" class="col-sm-3 col-form-label">이름</label>
												<div class="col-sm-6">
													<input class="form-control" id="adminName" type="text"
														name="adminName" value="${admin.adminName}" readonly="readonly">
												</div>
											</div>
											<div class="form-group row">
												<label for="adminNick" class="col-sm-3 col-form-label">닉네임</label>
												<div class="col-sm-4">
													<input class="form-control" id="adminNick" type="text"
														name="adminNick" value="${admin.adminNick}">
												</div>
												<span class="guide ok">사용 가능</span>
				            				<span class="guide error">사용 불가</span>
				            				<span class="guide invalid">10글자 미만</span>
				            				<input type="hidden" name="nickNameDuplicateCheck" id="nickNameDuplicateCheck" value="0"/>
											</div>
											<fieldset class="form-group">
												<div class="row">
													<label for="adminPhone"
														class="col-form-label col-sm-3 pt-0">연락처</label>
													<div class="col-sm-6">
														<input class="form-control input-phoneus" id="adminPhone" 
															name="adminPhone" maxlength="14" value="${admin.adminPhone}" required>
													</div>
												</div>
											</fieldset>
											<div class="form-group row">
												<label for="adminEmail" class="col-sm-3 col-form-label">이메일</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="adminEmail"
														name="adminEmail" value="${admin.adminEmail}" readonly="readonly">
												</div>
											</div>
											<div>
												<input type="hidden" name="gradeNo" value="1" />
											</div>
											
											<div class="form-group mb-2">
												<button type="submit" class="btn btn-primary">수정</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</section>
	</div>

	<script>
	/*유효성 검사*/
	function validate2(obj){
	
		var validate = ''; // 정규식
		var valiMessage = ''; // 유효성 체크 메새지
		
		var inputValue = $(obj).val(); // 입력 값
		
		switch($(obj).attr('id')) {
			
		case 'adminPw':
			validate = /^[A-Za-z0-9_-]{6,18}$/; // (영문대소문자+숫자 6~18자리)
			valiMessage = '대,소문자와 숫자를 조합하여 6~18자리 생성해 주세요 ~^^';
			break;
			
		/* 관리자 연락처 사용시 필요할까봐 주석처리
		case 'tel':
			validate = /^\d{2,3}-\d{3,4}-\d{4}$/; // 010-0000-0000
			valiMessage = '전화번호 양식을 확인해주세요';
			break;
		*/
			
		}
		
		// 유효성 체크
		if(validate.test(inputValue)){
			valiText.text('');
		} else {
			alert(valiMessage);
		}
	}
	
	/* 비밀번호 확인 */
	$("#adminPw2").change(function(){
		if($('#adminPw').val() != $('#adminPw2').val()) $('.passwordCheck').html("확인 후 다시 입력하세요");
		else $('.passwordCheck').html("비밀번호가 일치합니다");
	});


	
	
	$("#adminNick").on("keyup", function(){
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

		$('.input-phoneus').mask('000-0000-0000');
	</script>
</body>
</html>