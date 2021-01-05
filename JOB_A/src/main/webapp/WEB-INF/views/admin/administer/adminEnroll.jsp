<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 등록</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
<section>
	<div>
		<div>
			<form action="${pageContext.request.contextPath }/admin/adminEnroll" method="post">
				<table>
					<thead>
						<tr>
							<th>관리자 등록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>사번 (아이디)</th>
							<td>
								<input type="text" id="adminId" name="adminId" onkeyup="enroll(this.value)">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" id="adminPw" readonly="readonly"><br />
								초기 비밀번호는 사번으로 설정됩니다
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" name="adminName">
							</td>
						</tr>
						<tr>
							<th>연락처</th>
				            <td>
				            	<input type="text" name="adminPhone" id="adminphone" size="3" value="010" readonly="readonly"/> -
				               	<input type="text" name="adminPhone2" id="adminphone2" maxlength="4" size="4"/> -
				            	<input type="text" name="adminPhone3" id="adminphone3" maxlength="4" size="4"/>
				            </td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" id="adminEmail" readonly="readonly"> @job-jo8a.com
							</td>
						</tr>
						<tr>
							<th>직급</th>
							<td>
								<select name='gradeNo' size='1'>
				                	<option value=''>선택하세요</option>
				                	<option value='0'>슈퍼관리자</option>
				              	   	<option value='1'>일반관리자</option>
			         		        
					           	</select>
							</td>
						</tr>
					
					</tbody>
					<tfoot>
						<tr>
							<td>
								<button type="submit" class="button">등록</button> &nbsp; <button onclick="" class="button">취소</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>

</section>
<script>

	function validate() {
		var phone1 = document.getElementById('Phone1');
	    var phone2 = document.getElementById('Phone2');
	    var phone3 = document.getElementById('Phone3');
	
	    if (phone2.value != '') {
	        if (!chk(/^[0-9]{4}$/, phone2, "4자리 입력"))
	        	return false;
	        if (!chk(/^[0-9]{4}$/, phone3, "4자리 입력"))
	        	return false;
	        }
	
	 	function chk(re, e, msg) {
	        if (re.test(e.value)) {
	        	return true;
	        }
	
	        alert(msg);
	        e.value = "";
	        e.focus();
	        return false;
	 	} 
	
	 	var result = [phone1, phone2, phone3].join("-");
	 	document.getElementById("adminPhone").innerHTML = result
	}	
	
	// 같은값 입력받기
	function enroll(val){
	    document.getElementById('adminPw').value = val;
	    document.getElementById('adminEmail').value = val;
	}

	
</script>
</body>
</html>