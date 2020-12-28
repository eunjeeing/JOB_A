<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 블라블라</title>
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<c:import url="../../common/header.jsp" />
				<div id="board-container">
					<form name="boardFrm"
						action="${pageContext.request.contextPath}/board/boardFormEnd.do"
						method="post" onsubmit="return validate();"
						enctype="multipart/form-data">
						<input type="text" class="form-control" placeholder="제목"
							name="boardTitle" id="boardTitle" required> <input
							type="text" class="form-control" name="boardWriter"
							value="${member.memId}" readonly required>
						<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
						<!-- style.css에서 div의  padding:10px을 제거함 -->
						<div class="input-group mb-3" style="padding: 0px;">
							<div class="input-group-prepend" style="padding: 0px;">
								<span class="input-group-text">첨부파일1</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" name="upFile"
									id="upFile1" multiple> <label class="custom-file-label"
									for="upFile1">파일을 선택하세요</label>
							</div>
						</div>
						<div class="input-group mb-3" style="padding: 0px;">
							<div class="input-group-prepend" style="padding: 0px;">
								<span class="input-group-text">첨부파일2</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" name="upFile"
									id="upFile2"> <label class="custom-file-label"
									for="upFile2">파일을 선택하세요</label>
							</div>
						</div>
						<textarea class="form-control" name="boardContent"
							placeholder="내용" required></textarea>
						<br /> <input type="submit" class="btn btn-outline-success"
							value="저장">
					</form>
				</div>
			</div>
		</div>
		<c:import url="../../common/sideBar.jsp" />
	</div>

</body>
</html>