window.onload = function(){
	// 체크박스
   var chs = document.getElementsByName("ch");
   var allCheck = document.getElementById("allCheck");
   for (var i = 0; i < chs.length; i++) {
      chs[i].onclick = function(){
         if(chs.length == chsConfirm()){
            allCheck.checked = true;
         }else{
            allCheck.checked = false;
         }
      }
   }
   
   var resetBtn = document.getElementById("replyReset");
   resetBtn.onclick = function(){
	   document.getElementById("conTxt").innerHTML = "내용<br>(원본)";
   }
   
}

function chsConfirm(){
   var chs = document.getElementsByName("ch");
   var cnt = 0;
   for (var i = 0; i < chs.length; i++) {
      if(chs[i].checked) {
         cnt++;
      }
   }
   return cnt;
}


function checkAll(bool){
   var chs = document.getElementsByName("ch");
   for (var i = 0; i < chs.length; i++) {
      chs[i].checked = bool;
   }
}

function submitForm(){
   document.forms[0].submit();
}

function chsSubmit(){
   var isc = false;
   if(chsConfirm() < 1){
      alert('선택된 글이 없습니다.');
   }else{
	   submitForm();
	   alert("삭제 되었습니다.")
   }
   return isc;
}

function backView(){
	history.back(-1);
}

function contentCheck(){
	var obj1 = document.getElementById("hideContent").value;
	var obj2 = document.getElementById("txtArea").value;
	var obj3 = obj2.replace("원본글 >","");
	if(obj1==obj3){
		document.getElementById("txtArea").value="";
		document.getElementById("conTxt").innerHTML = "내용<br>작성중";
		
	}
}

