<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center"><font color=red>信息修改页</font></h2>
	<!-- 按提交键将会跳转到提交判断页面 -->
	<form action="submitSuccess.jsp" method="post">
	<table align="center" border="1">
		<tr>
			<td>输入真名:</td>
			<td><input type="text" name="name"></td>
			<td>请输入您所在的城市:</td>
			<td><input type="text" name="city"></td>
		</tr>
		<tr>
			<td>学&nbsp;&nbsp;校:</td>
			<td><input type="text" name="school"></td>
		</tr>
		<tr>
			<td>毕业感言:</td>
			<td><input type="text" name="note"></td>
		</tr>
		<tr>
			<td><input type="submit" value="提交" name="submit2DB"></td>
			<td><input type="reset" value="提交照片" name="photoSubmit"></td>
		</tr>
	</table>
	<p align="center"><a href="registered.jsp" color=blue>注册用户</a></p>
	</form>
</body>
</html>