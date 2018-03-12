<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel='stylesheet prefetch'
	href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>

<link rel="stylesheet" href="css/style2.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>	
	<div class="login-card">
		<h1>Log-in</h1>
		<br>
		<form action="CheckServlet" method="post">
		User:<input type="text" name="txtUser" value = ""><br>
		Pass:<input type="password" name="txtPass" value=""><br><br>
		<input type="submit" name="action" value="Login" class="login login-submit">
	</form>		
	</div>
<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>