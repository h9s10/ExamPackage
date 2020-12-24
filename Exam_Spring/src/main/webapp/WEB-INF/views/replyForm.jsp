<%@page import="com.min.edu.dtos.Member_DTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.min.edu.dtos.Answerboard_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%!
	public String formatDate(Date d){
	SimpleDateFormat shape = new SimpleDateFormat("YYYY년 MM월 dd일");
	return shape.format(d);
}
%>
<%
	Answerboard_DTO dto = (Answerboard_DTO)request.getAttribute("dto");
	Member_DTO loginDto = (Member_DTO)session.getAttribute("loginDto");
%>
<meta charset="UTF-8">
<title>답글 작성</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style type="text/css">
 	#container{
 		width : 800px;
 		margin: 40px auto;
 	
 	}
</style>
<script type="text/javascript" src = "./js/answerboard.js"></script>
</head>
<body>
<div id = "container" class="table-responsive">
	<form action="./reply.do" method="post">
		<input type = "hidden" name = "seq" value = "<%=dto.getSeq() %>"> 
		<table class="table">
			<h1>답글 작성</h1>
			<tr>
				<th>아이디 : </th>
				<td class="form-group"><input class="form-control" type = "text" name = "id" required readonly maxlength="10" value="<%=loginDto.getId()%>"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td class="form-group"><input class="form-control" type = "text" name = "title" required="required"></td>
			</tr>
			<tr>
				<th id = "conTxt">내용<br>(원본)</th>
				<td class="form-group">
				<input type = "hidden" id = "chkContent" value = "Y">
				<input type = "hidden" id = "hideContent" value = "<%=dto.getContent()%>">
					<textarea class="form-control" rows="10" cols="50" id = "txtArea" name = "content" required="required" onclick="contentCheck()">원본글 &gt;<%=dto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=formatDate(new Date())%></td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="btn btn-primary btn-sm btn-block" type = "submit" value = "답글 입력">
					<input class="btn btn-primary btn-sm btn-block" id = "replyReset" type = "reset" value = "입력 초기화">
				</th>
			</tr>
		</table>
	</form>
</div>
</body>
</html>