<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>邮件</title>
<style type="text/css">
table{
	width:100%;
	text-align: center;
	font-size: 20px;
}
input{
	width:100%;
	font-size: 20px;
}
td{
	border:dashed 1px;
}
#homePageImg {
	width: 30px;
}

#navALab {
	cursor: pointer;
	text-align: center;
	text-decoration: none;
}

#navTitle {
	line-height: 30px;
	text-align: center;
	width: 95%;
	display: inline-block;
	font-size: 28px;
}
.navDiv{
margin-bottom: 50px;
}
textarea {
	width:100%;
	height:450px;
	font-size: 20px;
}
</style>
</head>
<body>
<p>&nbsp;</p>
	<div class="navDiv">
		</a> <span id="navTitle">邮件通知</span>
	</div>
<table>
	<tr>
		<td>发件邮箱账号(163)</td>
		<td><input id="senderAccount" type="text" placeholder="xxx@163.com" value="gaobo5874269@163.com"></td>
		<td>发件邮箱授权码</td>
		<td><input id="senderPassword" type="password"></td>
		<td><input type="button" value="发送" onclick="sendMail()"></td>
	</tr>
	<tr>
		<td>收件人邮箱</td>
		<td colspan="4"><input type="text" id="recipientAddress"></td>
	</tr>
	<tr>
		<td>发件人邮箱</td>
		<td colspan="4"><input type="text" id="senderAddress" value="gaobo5874269@163.com"></td>
	</tr>
	<tr>
		<td>邮件主题</td>
		<td colspan="4"><input type="text" id="subject"></td>
	</tr>
	<tr>
		<td>正文</td>
		<td colspan="4"><textarea id="content"></textarea></td>
	</tr>
</table>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function sendMail(){
	var senderAddress=$("#senderAddress").val();
	var recipientAddress=$("#recipientAddress").val();
	var senderAccount=$("#senderAccount").val();
	var senderPassword=$("#senderPassword").val();
	var subject=$("#subject").val();
	var content=$("#content").val();
	if(senderAddress==""){
		alert('请填写发件人');
	}else if(recipientAddress==""){
		alert('请填写收件邮箱');
	}else if(senderAccount==""){
		alert('请填写发件账号');
	}else if(content==""){
		alert('请填写正文');
	}else{
		var url="message/sendMail.do";
		var data={"senderAddress":senderAddress,"recipientAddress":recipientAddress,"senderAccount":senderAccount,"senderPassword":senderPassword,"subject":subject,"content":content};console.log(data);
		$.getJSON(url,data,function(result){
			alert(result.message);
			window.location.reload();
		});
	}
}
</script>
</html>
