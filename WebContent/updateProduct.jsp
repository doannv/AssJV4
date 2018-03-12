<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="entity.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update</title>
</head>
<body>
	<%
		CategoryDAO categoryDAO = new CategoryDAO();
		String tensp_error = "", dongia_error = "", soluong_error = "", chitiet_error = "",
				ghichu_error = "";

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
		<jsp:include page="header.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">
								<a href="managerProduct.jsp"> Quay lại</a>
							</div>
							<div class="panel-heading">Sửa Sản Phẩm</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="ProductUpdate" method="post">
											<div class="form-group">
												<br> Loại:<select name="Maloai" class="selectpicker">
													<%
														for (Category c : categoryDAO.getListCategory()) {
													%>
													<option value="<%=c.getMaloai()%>"><%=c.getMaloai()%></option>
													<%
														}
													%>
												</select><br>
											</div>

											<div class="form-group">
												<label>Tên sản phẩm</label> <span style="color: red"><%=tensp_error%></span>
												<input class="form-control" type="text" name="Tensp"
													value="<%=request.getParameter("Tensp")%>" />
											</div>										
											<div class="form-group">
												<label>Hình ảnh</label> <input type="file" name="Anh"
													value="" />
											</div>
											<div class="form-group">
												<label>Giá sản phẩm</label> <span style="color: red"><%=dongia_error%></span>
												<input class="form-control" type="text" name="Dongia"
													value="<%=request.getParameter("Dongia")%>" />
											</div>
											<div class="form-group">
												<label>Số lượng</label> <span style="color: red"><%=soluong_error%></span>
												<input class="form-control" type="text" name="Soluong"
													value="<%=request.getParameter("Soluong")%>" />
											</div>
											<div class="form-group">
												<label>Chi Tiết</label> <span style="color: red"><%=chitiet_error%></span>
												<textarea class="form-control" rows="5" name="Chitiet"></textarea>
											</div>
											<div class="form-group">
												<label>Ghi chú</label> <span style="color: red"><%=ghichu_error%></span>
												<input class="form-control" type="text" name="Ghichu"
													value="" />
											</div>

											<input type="hidden" name="action" value="Update">
											<input type="hidden" name="Masp"
												value="<%=request.getParameter("Masp")%>">
											<button type="submit" class="btn btn-success">Update</button>
											<button type="reset" class="btn btn-primary">Reset</button>
										</form>
										<br />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>