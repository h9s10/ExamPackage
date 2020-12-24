<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
 	#container{
 		width : 800px;
 		margin: 40px auto;
 	
 	}
</style>

</head>
<body>
<div id="container">
	<h1>로그인</h1>
	
	<form action="./login.do" method="post">
		<div class="form-group">
			<label for="usr">ID:</label> 
			<input type="text"	class="form-control" name="id" required="required">
		</div>
		
		<div class="form-group">
			<label for="pwd">Password:</label>
			<input type="password" class="form-control" name="pw" required="required">
		</div>
		
		<div style="text-align: center;">
			<input class="btn btn-default" type="reset">
			<input type="submit" class="btn" value="로그인">
			<input type="button" class="btn btn-danger" value="회원가입" onclick="location.href='./signupForm.do'">
		</div>
	</form>
</div>
</body>
</html>