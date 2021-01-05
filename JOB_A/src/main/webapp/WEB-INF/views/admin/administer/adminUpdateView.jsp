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
			<form action="${pageContext.request.contextPath }admin/adminUpdate" onsubmit="return validate();">
				<table>
					<thead>
						<tr>
							<th>관리자 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>사번 (아이디)</th>
							<td>
								${admin.adminId}
							</td>
						</tr>
						<tr>
							<th>비밀번호 *</th>
							<td>
								<input type="password" size="20" class="form-control" name="adminPw" id="adminPw" required/>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인 * </th>
							<td>
								<input type="password" size="20" class="form-control" id="adminPw2" required/>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								${admin.adminName}
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input type="text" name="adminNick" value="${admin.adminNick}">
							</td>
						</tr>
						<tr>
							<th>연락처</th>
				            <td>
				            	<input type="text" name="Phone1" id="Phone1" size="3" value="010" readonly="readonly"/> -
				               	<input type="text" name="Phone2" id="Phone2" maxlength="4" size="4"/> -
				            	<input type="text" name="Phone3" id="Phone3" maxlength="4" size="4"/>
				            	<input type="hidden" name="adminPhone" id="adminphone">
				            </td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td>
								<button onclick="">취소</button> &nbsp; <button type="submit" class="button">수정</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>

</section>
<script type="text/javascript">
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
</script>
</body>
</html>