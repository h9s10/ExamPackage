<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
 	#container{
 		width : 800px;
 		margin: 40px auto;
 	
 	}
</style>
</head>
<script type="text/javascript">

function check(){
	var chkval = document.getElementById('chkval').value;
	
	if(chkval == '0'){
		alert("아이디를 다시 확인해주세요");
		return false;
	}else{
		return true;
	}
}

// 아이디 중복체크
$(document).ready(function(){
	$('#id').keyup(function(){
		$.ajax({
			type: "POST",
			url:"./idChk.do",
			data:"id="+ $(this).val(),
			async: true,
			success: function(msg){
				if(msg == "true"){
					$('#chkval').val('0');
					$('#result').html('사용 불가능한 아이디 입니다.');
					$('#result').css('color', 'red');
				}else{
					$('#chkval').val('1');
					$('#result').html('사용가능한 아이디 입니다.');
					$('#result').css('color', 'green');
				}
			},
			error : function(){
				alert("잘못된 요청입니다.");
			}
		});
	});
});
	
</script>
<body>
<div id="container">
	<h1>회원 가입</h1>
	
	<input type="hidden" id="chkval" value="1">
	
	<form action="./signup.do" method="post" onsubmit="return check();">
		<div class="form-group">
			<label for="usr">ID:</label> 
		    <input type="text"	class="form-control" id="id" name="id" required="required" placeholder="아이디 중복체크 여부를 확인해주세요">
		</div>
		<div id="result"></div>
		<div class="form-group">
			<label for="pwd">Name:</label>
			<input type="text" class="form-control" name="name" required="required">
		</div>
		
		<div class="form-group">
			<label for="pwd">Password:</label>
			<input type="password" class="form-control" name="pw" required="required">
		</div>
		
		<div style="text-align: center;">
			<input class="btn btn-default" type="reset">
			<input type="button" class="btn btn-danger" value="가입 취소" onclick="location.href='./loginForm.do'">
			<input type="submit" class="btn" value="가입 신청">
		</div>
	</form>
</div>
</body>
</html>