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
			<form action="">
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
							<th>직급</th>
							<td>
								<select name='gradeNo' size='1'>
				                	<option value=''>선택하세요</option>
				                	<option value='0'>슈퍼관리자</option>
				              	   	<option value='1'>일반관리자</option>
			         		        
					           	</select>
							</td>
						</tr>
						<tr>
							<th>연락처</th>
				            <td>
				            	<input type="text" name="phone1"> -
				               	<input type="text" name="phone2"> -
				               	<input type="text" name="phone3">
				            </td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td>
								<button onclick="">등록</button> &nbsp; <button onclick="">취소</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>

</section>
	<script>
	function enroll(val){
	    document.getElementById('adminPw').value = val;
	    
	}
	</script>
</body>
</html>