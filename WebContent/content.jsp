<%@page import="java.text.NumberFormat"%>
<%@page import="entity.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="home">
	<div class="container">
<div id="maincontent" class="col-xs-12 col-sm-8 col-md-9">
	<%
		ProductDAO productDAO = new ProductDAO();
		List<Product> lst = productDAO.getListProduct();
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
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
						<a><img style="width: 200px; height: 200px" src="images/<%=s.getImg() %>" /></a>
						<div class="img-label">
							<img src="images/hot.png">
						</div>
					</div>
					<div class="namesp">
						<a href="detailProduct.jsp?MaSanPham=<%=s.getMasp()%>"><%=s.getTensp()%></a>
					</div>
					<div class="pricesp"><%=nf.format(s.getGia()) %> VNĐ
					</div>					
					<div class="button-hd">
						<a href=""><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
						<a href="detailProduct.jsp?MaSanPham=<%=s.getMasp()%>"><i
							class="fa fa-eye" aria-hidden="true"></i></a>
					</div>									
				</div>	
				<br>			
			</div>		
			<%
				}
			%>

		</div>
	</div>
</div>
</div>
</div>

