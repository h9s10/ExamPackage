<%@page import="com.min.edu.dtos.Answerboard_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>    
    
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
</head>
<%
	Answerboard_DTO dto = (Answerboard_DTO)request.getAttribute("dto");
%>
<body>
	<form action="./modify.do" method="post">
	<div id = "container" class="table-responsive">
	<input type = "hidden" name = "seq" value = "<%=dto.getSeq()%>">
			<h1>글수정</h1>
			<table class = "table">
			<tr>
				<th>아이디</th>
				<td>
					<%=dto.getId() %>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<%=dto.getTitle() %>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols = "50" name = "content"><%=dto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input class = "btn btn-success" type = "submit" value = "수정 완료">
					<input class = "btn btn-success" type = "button" value = "돌아가기" onclick="backView()">
				</td>
			</tr>
			</table>
	</div>
	</form>
<script type = "text/javascript">
	var textarea = document.getElementsByTagName("textarea")[0];
	var val =  textarea.textContent;
	val = val.replace(/<br>/gi,'\n');
	textarea.textContent = val;
</script>
</body>
</html>