<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 목록 </title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
				<h2>회원 리스트</h2>
				<!--  검색 -->
				<div class="row" style="float: right">
					<select class="form-control custom-select" style="width: 25%" id="searchCondition" name="searchCondition">
						<option value="">-----</option>
						<option value="adminName">이름</option>
						<option value="adminNick">닉네임</option>
					</select>
					<div class="input-group" style="width: 60%; margin-left: 20px;">
						<input type="search" id="keyword" class="form-control" style="width: 70%">
						<button type="button" onclick="return search();">검색</button>
					</div>
				</div>
				
				<table>
					<thead>
						<tr>
							<th>상태</th>
							<th>아이디</th>
							<th>닉네임</th>
							<th>등급</th>
							<th>생년월일</th>
							<th>이메일</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList}" var="m">
							<tr>
								<td><span>${m.memState}</span></td>
								<td><span>${m.memId}</span></td>
								<td><span>${m.memNick}</span></td>
								<td><span>${m.gradeNo}</span></td>
								<td><span>${m.memBirth}</span></td>
								<td><a href="#"><span>${m.memEmail}</span></a></td>
								<td><span>${m.enrollDate}</span></td>
								<td><button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/adminDelete/${a.memNo}'">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</div>
		</div>
	</section>
	
	<script type="text/javascript">

		function search(){
			var searchKey = $("#keyword").val();
			var searchCdt = $("#searchCondition").val();
			
			if(searchKey == ""){
				Swal.fire({
	                title: "ʕ⁰̈●̫⁰̈ʔ..이러면 아모고토 검색할수가 없지",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			} else if(searchCdt == ""){
				Swal.fire({
	                title: "ʕʘ●̫ʘʔ..근데 뭘로 검색해?",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			} else {
				location.href="${pageContext.request.contextPath}/admin/Search?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();	
			}
			
		}
	</script>
</body>
</html>