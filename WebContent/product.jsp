<%@page import="java.text.NumberFormat"%>
<%@page import="entity.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="maincontent" class="col-xs-12 col-sm-8 col-md-9">
	<%
		ProductDAO productDAO = new ProductDAO();
		String ma = "";
		if (request.getParameter("MaLoai") != null) {
			ma = request.getParameter("MaLoai");
		}
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		List<Product> lst = productDAO.getListProductID(ma); 
	%>
	<div class="boxmain">
		<div class="tit-boxmain">

			<h3>
				<span>Sản Phẩm </span>
			</h3>
		</div>
		<%
			for (Product s : lst) {
		%>
		<div class="ct-boxmain row m0">
			<div class="col-xs-6 col-sm-4 col-md-3 p5">
				<div class="boxsp">
					<div class="imgsp">
						<img style="width: 200px; height: 200px" src="images/<%=s.getImg()%>" />
						<div class="img-label">
							<img src="images/hot.png">
						</div>
					</div>
					<div class="namesp">
						<a href="detailProduct.jsp?MaSanPham=<%=s.getMasp()%>"><%=s.getTensp()%></a>
					</div>
					<div class="pricesp"><%=nf.format(s.getGia())%>
						VNĐ
					</div>
					<div class="button-hd">
						<a href=""><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
						<a href="detailProduct.jsp?MaSanPham=<%=s.getMasp()%>"><i
							class="fa fa-eye" aria-hidden="true"></i></a>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
