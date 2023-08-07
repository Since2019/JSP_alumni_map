<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>stuInfo Log-in by学以致用2528889836@qq.com</title>
</head>
<body >
	<h2 align="center"><font color=red>用户登录页面 </font></h2>
	
	<form action="loginSuccess.jsp" method="post">
	<table align="center" border="1">
		<tr>
			<td>请输入您的ID:</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>密&nbsp;&nbsp;码:</td>
			<td><input type="text" name="password"></td>
		</tr>
		<tr>
			<td><input type="submit" value="登录" name="login"></td>
			<td><input type="reset" value="重置" name="reset"></td>
		</tr>
	</table>
	<p align="center"><a href="registered.jsp" color=blue>注册用户</a></p>
	</form>
	
</body>
</html>
