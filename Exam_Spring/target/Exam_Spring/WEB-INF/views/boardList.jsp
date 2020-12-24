<%@page import="com.min.edu.dtos.Member_DTO"%>
<%@page import="com.min.edu.dtos.Answerboard_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체글 조회</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style type="text/css">
 	#container{
 		width : 800px;
 		margin: 40px auto;
 	
 	}
</style>

<%
Member_DTO loginDto = (Member_DTO)session.getAttribute("loginDto");
%>

<script type="text/javascript" src = "./js/answerboard.js"></script>
</head>
<%!
   public String datePattern(String regdate) {
      return regdate.substring(0, regdate.indexOf(" "));
   }

   public String photo (int depth) {
      String result = "";
      String blank = "&nbsp;&nbsp;&nbsp;&nbsp;";
      String picture = "<img alt=\"댓글\" src='./images/reply.png'>";
      if (depth > 0) {
         for (int i = 0; i < depth; i++) {
            result += blank;
         }
         result += picture;
      }
      return result;
   }
%>
<%
	Object obj = request.getAttribute("lists");
	List<Answerboard_DTO> lists = (List<Answerboard_DTO>) obj;
%>
<body>
<div id="container">
<form action="multidel.do" method="post" onsubmit="return chsSubmit()">
<input type="button" value="LOGOUT" class="btn" style="float: right;" onclick="location.href='./logout.do'">
<h1>전체글 목록</h1>
<table class="table table-hover">
  <thead>
    <tr class="info">
      <c:if test=""></c:if>
      <th><input type="checkbox" id = "allCheck" onclick="checkAll(this.checked)"></th>
      <th>연번</th>
      <th>아이디</th>
      <th>제목</th>
      <th>등록일</th>
    </tr>
  </thead>
  <tbody>
   <%
   if (lists == null || lists.size() == 0) {
      %>
      <tr>
         <td colspan="8" style="text-align: center;">
            글이 존재하지 않습니다.
         </td>
      </tr>
      <%
   } else {
      for (Answerboard_DTO dto : lists) {
   %>
      <tr>
        <td><input type="checkbox" name="ch" value="<%=dto.getSeq()%>"></td>
        <td><%=dto.getSeq() %></td>
        <td><%=dto.getId() %></td>
        <%
          if (dto.getDelflag().trim().compareToIgnoreCase("y")==0) {
             %>
             <td style="color:red;">관리자에 의해 삭제 된 글입니다.-</td>
             <%
          } else {
             %>
             <td><a href="./boardOne.do?seq=<%=dto.getSeq() %>"><%=photo(dto.getDepth()) %><%=dto.getTitle() %></a></td>
             <%
          }
        %>
        <td><%=datePattern(dto.getRegdate())%></td>
      </tr>
   <%
      }
   }
   %>
  </tbody>
  <tfoot>
     <tr>
        <th style="text-align: center;" colspan="8">
           <input class="btn-info btn btn-primary" type="submit" value="다중삭제">
           <input class="btn-info btn btn-primary" type="button" value="새 글 입력"
           onclick = "location.href='./writeFrom.do'">
        </th>
     </tr>
  </tfoot>
</table>
</form>
</div>

</body>
</html>