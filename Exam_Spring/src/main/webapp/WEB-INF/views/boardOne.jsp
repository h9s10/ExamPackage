<%@page import="java.util.List"%>
<%@page import="com.min.edu.dtos.Answerboard_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<%
	Answerboard_DTO dto = (Answerboard_DTO)request.getAttribute("dto");
%>
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
<%!
   public String datePattern(String regdate) {
      return regdate.substring(0, regdate.indexOf(" "));
   }
%>
<body>
<div id = "container" class="table-responsive">
<h1>상세글 조회</h1>
   <c:forEach var="list" items="${lists}">
      <table class="table">
         <tr>
            <th>아이디</th><td>${list.id}</td>
         </tr>
         <tr>
            <th>제목</th><td>${list.title}</td>
         </tr>
         <tr>
            <th>내용</th><td>${list.content}</td>
         </tr>
         <tr>
            <th>등록일</th><td>${list.regdate}</td>
         </tr>
      </table>
</c:forEach>

	<form action="#" method="post" style="text-align: center;">
		<div >
				<input type = "button" value = "돌아가기" onclick="backView()">
				<input type = "button" value = "글 수정" onclick = "location.href='./modifyForm.do?seq=<%=dto.getSeq()%>'">
				<input type = "button" value = "답글 작성" onclick = "location.href='./replyForm.do?seq=<%=dto.getSeq()%>'">
				<input type = "button" value = "글 삭제" onclick = "location.href='./del.do?seq=<%=dto.getSeq()%>'">
		</div>
	</form>
</div>
</body>
</html>