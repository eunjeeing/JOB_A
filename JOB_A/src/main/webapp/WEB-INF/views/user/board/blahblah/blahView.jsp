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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/blah.jpg)
		no-repeat;
	background-position: center center;
	margin-top: 10px;
	height: 400px;
	display: flex;
}

.sub_news,.sub_news th,.sub_news td{
  border:0;
}

.sub_news a{
  color:#383838;
  text-decoration:none;
}

.sub_news{
  width:100%;
  border-bottom:1px solid #999;
  color:#666;
  font-size:15px;
  table-layout:fixed;
}

.sub_news caption{
  display:none;
}

.sub_news th{
  padding:5px 0 6px;
  border-top:solid 1px #999;
  border-bottom:solid 1px #b2b2b2;
  background-color:#f1f1f4;
  color:#333;
  font-weight:bold;
  line-height:20px;
  vertical-align:top;
  text-align: center;
}

.sub_news td{
  padding:8px 0 9px;
  border-bottom:solid 1px #d2d2d2;
  border-top: solid 1px #d2d2d2;
  text-align:center;
  line-height:18px;
}

.sub_news .date,.sub_news .hit{
  padding:0;
  font-family:Tahoma;
  font-size:11px;
  line-height:normal;
}

.sub_news .title{
  text-align:left; 
  padding-left:15px; 
  font-size:13px;
}

.sub_news .title .pic,.sub_news .title .new{
  margin:0 0 2px;
  vertical-align:middle;
}

.sub_news .title a.comment{
  padding:0;
  background:none;
  color:#f00;
  font-size:12px;
  font-weight:bold;
}

.sub_news tr.reply .title a{
  padding-left:16px;
  background:url(../images/ic_reply.png) 0 1px no-repeat;
}

.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}

.btn-default {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}

textarea {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}
</style>
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<c:import url="../../common/header.jsp" />

				<!-- Top Banner Area -->
				<div id="topbanner">
					<div id="topbanner-textarea">
						<h3 id="topbanner-text">블라블라</h3>
					</div>
				</div>

				<!-- View -->
				<section class="container">
					<div class="tableArea">
						<table class="sub_news" cellspacing="0">
							<tbody style="border: 1px solid #d2d2d2;">

								<tr>
									<td style="width: 10%; background-color: #f1f1f4;">제목</td>
									<td colspan="5"><span>${board2.board_Title }</span></td>
								</tr>
								<tr>
									<td style="background-color: #f1f1f4;">작성자</td>
									<td colspan="5"><span>${board2.mem_Nick }</span></td>
								</tr>
								<tr>
									<td style="background-color: #f1f1f4;">작성일</td>
									<td colspan="3"><span>${board2.board_Date }</span></td>
									<td style="background-color: #f1f1f4;">조회수</td>
									<td colspan="1"><span>${board2.board_View }</span></td>
								</tr>
								<tr style="height: 300px; overflow-y: auto; text-align: left;">
									<td style="background-color: #f1f1f4;">내용</td>
									<td colspan="5"><div class="imgArea">
<%-- 											<%
												if (bf != null && bf.getFileChangeName() != null && bf.getFileChangeName().length() > 0) {
											%>
											<img
												src="<%=request.getContextPath()%>/resources/boardUploadFiles/<%=bf.getFileChangeName()%>" />
											<%
												}
											%> --%>
										</div>
										<div class="textArea">
											${board2.board_Content }
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
			</div>
		</div>
		<c:import url="../../common/sideBar.jsp" />
	</div>
</body>
</html>