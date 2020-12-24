<%@page import="com.min.edu.dtos.Member_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style type="text/css">
 	#container{
 		width : 800px;
 		margin: 40px auto;
 	
 	}
</style>
<script type="text/javascript" src = "./js/answerboard.js"></script>
<% Member_DTO loginDto = (Member_DTO)session.getAttribute("loginDto"); %>
</head>
<body>
<div id = "container">
	<div><a href = "javascript:history.back(-1)">뒤로 가기</a></div>
	<form action="./write.do" method="post">
		<table class="table table-bordered form-group">
			<h1>새글 작성</h1>
			<tr>
				<th>아이디</th>
				<th>제목</th>
				<th>내용</th>
			</tr>
			<tr>
				<td><input type = "text" name = "id" id = "id" value="<%= loginDto.getId() %>" class="form-control input-lg" required readonly></td>
				<td><input type = "text" name = "title" id = "title" class="form-control input-lg" required="required"></td>
				<td><textarea cols = "50" name = "content" id = "content" class="form-control" required="required"></textarea></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type = "submit" class="btn btn-primary" value = "새글 저장">
					<input type = "reset" class="btn btn-primary" value = "다시 작성" >
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>