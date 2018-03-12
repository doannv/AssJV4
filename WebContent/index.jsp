<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Assignment Java 4</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="home">
		<div class="container">
			<jsp:include page="danhmuc.jsp"></jsp:include>
			<section id="main">
				<jsp:include page="left.jsp"></jsp:include>
				<jsp:include page="content.jsp" />
			</section>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>