<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String masp = "";
		if (request.getParameter("MaSanPham") != null) {
			masp = request.getParameter("MaSanPham");
		}
		List<Product> lst = ProductDAO.getdetailProduct(masp);
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="home">
		<div class="container">
			<jsp:include page="danhmuc.jsp"></jsp:include>
			<section id="main"> <jsp:include page="left.jsp"></jsp:include>
			<div id="maincontent" class="col-xs-12 col-sm-8 col-md-9">
				<div class="boxmain">
					<div class="tit-boxmain">
						<h3>
							<span>Sản Phẩm </span>
						</h3>
					</div>
					<%
						for (Product product : lst) {
					%>
					<div class="ct-boxmain row m0">

						<div class="col-xs-6 col-sm-4 col-md-3 p5">
							<div class="boxsp">
								<div class="imgsp">
									<a href=""><img src="images/<%=product.getImg()%>"></a>									
								</div>
								<div class="namesp">
									<a href=""><%=product.getTensp()%></a>
								</div>
								<div class="pricesp"><%=nf.format(product.getGia())%> VNĐ</div>								
							</div>
						</div>

						<form style="">
							<p style="color: green;">
								Tên Sản Phẩm :
								<%=product.getTensp()%></p>
							<hr>
							<p style="color: green;">
								Đơn Giá :
								<%=nf.format(product.getGia())%>
								VNĐ
							</p>
							<hr>
							<p style="color: green;">
								Số Lượng Hàng Còn :
								<%=product.getSoluong()%></p>
							<hr>
							<p style="color: green;">
								Ghi Chú :
								<%=product.getGhichu()%></p>
							<hr>							
							
						</form>
					</div>
					<p style="color: green;">
								Chi Tiết Sản Phẩm :<%=product.getChitiet()%></p>
					<%
						}
					%>
				</div>
			</div>
			</section>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>