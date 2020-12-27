<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 목록 </title>
<style type="text/css">
.container{
		width: 10%;
		vertical-align: middle;
		white-space: nowrap;
		position: relative;
		margin-left: 10px;
	}
	.container input#search::-webkit-input-placeholder {
		color: #65737e;
		cursor: pointer;
	}
	 
	.container input#search:-moz-placeholder { /* Firefox 18- */
		color: #65737e;  
	}
	 
	.container input#search::-moz-placeholder {  /* Firefox 19+ */
		color: #65737e;  
	}
	 
	.container input#search:-ms-input-placeholder {  
		color: #65737e;  
	}
	.container input#search{
		width: 120%;
		height: 50px;
		font-size: 10pt;
		float: left;
		color: #63717f;
		padding-left: 45px;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
	}
	.container .icon{
		position: absolute;
		top: 45%;
		margin-left: 18px;
		margin-top: 14px;
		z-index: 1;
		color: #4f5b66;
		
		-webkit-transition: all .55s ease;
		-moz-transition: all .55s ease;
		-ms-transition: all .55s ease;
		-o-transition: all .55s ease;
		transition: all .55s ease;
	}
	.container:hover .icon{
		margin-top: 13px;
		color: #93a2ad;
		
		-webkit-transform:scale(1.5); /* Safari and Chrome */
		-moz-transform:scale(1.5); /* Firefox */
		-ms-transform:scale(1.5); /* IE 9 */
		-o-transform:scale(1.5); /* Opera */
		 transform:scale(1.5);
	}
	
	.container input#search:hover, .container input#search:focus, .container input#search:active{
	    outline:none;
	    background: rgba(222, 225, 226, 0.75);
	}
</style>
</head>
<body>
	<section>
		<div>
			<div>
				<h2>관리자 리스트</h2>
				<div class="container">
				    <span class="icon"><i class="fa fa-search"></i></span>
					<input type="search" id="search" placeholder=" Search !" />
				</div>
				<table>
					<thead>
						<tr>
							<th>등록번호</th>
							<th>사번</th>
							<th>이름</th>
							<th>닉네임</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>등록날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${adminList}" var="a">
							<tr>
								<td><span>${a.adminNo}</span></td>
								<td><span>${a.adminId}</span></td>
								<td><span>${a.adminName}</span></td>
								<td><span>${a.adminNick}</span></td>
								<td><a href="#"><span>${a.adminEmail}</span></a></td>
								<td><span>${a.adminPhone}</span></td>
								<td><span>${a.enrollDate}</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</div>
		</div>
	</section>
</body>
</html>