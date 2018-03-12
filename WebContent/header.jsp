<%@page import="entity.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- BOOTSTRAP CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<!-- AWESOME ICON FONT -->
<link href="lib/awesome/css/font-awesome.min.css" rel="stylesheet">

<!-- IMPORT FONT GOOGLE LINK -->
<link
	href="http://fonts.googleapis.com/css?family=Roboto+Condensed:300italic,400italic,700italic,400,700,300&amp;subset=vietnamese,latin,latin-ext"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:400,700"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<link href="css/style.css" rel="stylesheet">
<!-- SLIDE CSS -->
<link rel="stylesheet" href="lib/slider/default.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="lib/slider/nivo-slider.css" type="text/css"
	media="screen" />
<!-- Owl Carousel Assets -->
<link href="lib/owlcarousel/owl.carousel.css" rel="stylesheet">
<link href="lib/owlcarousel/owl.theme.css" rel="stylesheet">
</head>

<header id="header">
	<div class="topbar">
		<div class="container">
			<div class="col-xs-12 col-sm-6 p0 hotline-top">
				<img src="images/phone-24.png" alt="hotline" />
				<p>Điện thoại: 01626.784.656</p>
			</div>
		</div>
	</div>
	<div class="header">
		<div class="container">
			<div class="col-xs-12 col-md-4">
				<div id="logo">
					<a href="index.jsp"><img src="images/FPTshop.png" alt=""></a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div id="search">
					<input type="text" name="btn_searc" placeholder="Tìm phụ kiện" />
					<button type="submit" name="find"></button>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="cart">
					<div class="discart">
						<span class="mycart">Giỏ hàng:</span> <span
							class="count_products_cart">0 sản phẩm</span>
					</div>

					<div class="top-cart-content"></div>
				</div>
			</div>
		</div>
	</div>
	<%
		CategoryDAO categoryDAO = new CategoryDAO();
	%>
	<nav id="mainmenu" class="hidden-xs hidden-sm ">
		<div class="container">
			<ul class="x1">
				<li><a href="index.jsp">Trang chủ</a></li>
				<li><a href="">Sản phẩm</a> <i class="fa fa-caret-down"
					aria-hidden="true"></i>
					<ul class="drop2">
						<%
							for (Category c : categoryDAO.getListCategory()) {
						%>
						<li><a href="product.jsp?MaLoai=<%=c.getMaloai()%>"><%=c.getTenloai()%></a></li>
						<%
							}
						%>
					</ul></li>
				<li><a href="Gioithieu.html">Giới thiệu</a></li>
				<li><a href="">Tin tức</a></li>
				<li><a href="">Tư vấn</a></li>
				<li><a href="">Liên hệ</a></li>
				<!-- Example single danger button -->


			</ul>
			<a href="Login.jsp"><button
					style="background: #347091; position: absolute; left: 890px; top: 55px; width: 100px; height: 30px; border-radius: 10px; border: none; color: #fff;"
					type="submit" name="btn_dn">Login</button> </a>
		</div>
	</nav>

</header>

</html>