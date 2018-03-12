<%@page import="entity.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<title>Quản Lý Sản Phẩm</title>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<%
		ProductDAO productDAO = new ProductDAO();
		List<Product> maloai = productDAO.getListProduct();
		CategoryDAO categoryDAO = new CategoryDAO();
		int start = 0, end = 5;
		if (maloai.size() < 5) {
			end = maloai.size();
		}
		if (request.getParameter("start") != null) {
			start = Integer.parseInt(request.getParameter("start"));
		}
		if (request.getParameter("end") != null) {
			end = Integer.parseInt(request.getParameter("end"));
		}
		List<Product> listProduct = productDAO.getListByPages(maloai, start, end);
		String masp_error = "", tensp_error = "", dongia_error = "", soluong_error = "", chitiet_error = "",
				ghichu_error = "";
		if (request.getAttribute("masp_error") != null) {
			masp_error = (String) request.getAttribute("masp_error");
		}

		if (request.getAttribute("tensp_error") != null) {
			tensp_error = (String) request.getAttribute("tensp_error");
		}
		if (request.getAttribute("dongia_error") != null) {
			dongia_error = (String) request.getAttribute("dongia_error");
		}
		if (request.getAttribute("soluong_error") != null) {
			soluong_error = (String) request.getAttribute("soluong_error");
		}
		if (request.getAttribute("chitiet_error") != null) {
			chitiet_error = (String) request.getAttribute("chitiet_error");
		}
		if (request.getAttribute("ghichu_error") != null) {
			ghichu_error = (String) request.getAttribute("ghichu_error");
		}
	%>
	<div id="wrapper">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		</nav>
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-12">
							<h1 class="page-header">
								<a href="managerProduct.jsp">Quản Lý <small>Sản Phẩm</small></a>
							</h1>
						</div>
					</div>
				</div>
				<h2>Danh Sách Sản Phẩm</h2>
				<div class="table-responsive">
					<font color="red">${erorr_search}</font>
					<form action="SearchServlet" method="post">
						Tên Sản Phẩm : <input type="text" name="SanPham"> 
						<input type="hidden" name="action" value="Search">
						<button type="submit" class="btn btn-primary">Tìm kiếm</button>
					</form>
					<form action="CheckServlet" method="post">
						<div class="col-md-4">
							Mã SP: <span style="color: red"><%=masp_error%></span> <input
								type="text" name="txtMaSP" class="form-control" value=""><br>
							Loại:<select name="txtMaLoai" class="selectpicker">
								<%
									for (Category c : categoryDAO.getListCategory()) {
								%>
								<option value="<%=c.getMaloai()%>"><%=c.getMaloai()%></option>
								<%
									}
								%>
							</select><br> Tên SP: <span style="color: red"><%=tensp_error%></span>
							<input type="text" name="txtTenSP" class="form-control"
								placeholder="Tên sản phẩm"> <br> Ảnh: <input
								type="file" name="txtImg"> <br> Đơn Giá: <span
								style="color: red"><%=dongia_error%></span> <input type="text"
								name="txtDonGia" class="form-control" value="1"> <br>
							Số lượng: <span style="color: red"><%=soluong_error%></span> <input
								type="text" name="txtSoLuong" class="form-control" value="1">
							<br> Ghi chú: <span style="color: red"><%=ghichu_error%></span>
							<input type="text" name="txtGhiChu" class="form-control"
								placeholder="Ghi chú"> <br> Chi tiết: <span
								style="color: red"><%=chitiet_error%></span>
							<textarea class="form-control" rows="5" name="txtChiTiet"></textarea>
							<br> <input type="hidden" name="action" value="Insert">
							<button type="submit" class="btn btn-primary">Thêm</button>
						</div>
					</form>
					<table class="table-bordered">
						<thead>
							<tr>
								<th>#</th>
								<th>Loại</th>
								<th><center>Tên SP</center></th>
								<th>Hình ảnh</th>
								<th>Đơn Giá</th>
								<th>Số lượng</th>
								<th>Ghi chú</th>
								<th>Chi tiết</th>
								<th><center>Edit</center></th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="i" items="${listSP}">
								<tr>
									<td style="width: 40px">${i.masp}</td>
									<td>${i.maloai}</td>
									<td><center>${i.getTensp()}</center></td>
									<td><img style="width: 100px; height: 100px"
										src="images/${i.img }" /></td>
									<td>${i.gia}</td>
									<td>${i.soluong}</td>
									<td>${i.chitiet}</td>
									<td style="width: 300px">${i.ghichu}</td>
									<td class="center" style="text-align: center;"><a
										href="updateProduct.jsp?action=Update&Masp=${i.masp}&Maloai=${i.maloai}&Tensp=${i.tensp}&Dongia=${i.gia}&Soluong=${i.soluong}"
										class="btn btn-primary">Sửa</a></td>
									<td class="center" style="text-align: center;"><a
										href="ProductUpdate?action=Delete&Masp=${i.masp}"
										class="btn btn-primary"
										onclick="return confirm('Bạn có muốn xóa không ?')">Xóa</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
