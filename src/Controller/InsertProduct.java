package Controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import entity.*;

@WebServlet("/CheckServlet")
public class InsertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.print("do post");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
		System.out.println("action=" + action);
		String Masp = request.getParameter("txtMaSP");
		String Maloai = request.getParameter("txtMaLoai");
		String Tensp = request.getParameter("txtTenSP");
		String Anh = request.getParameter("txtImg");
		int Dongia = Integer.parseInt(request.getParameter("txtDonGia"));
		int Soluong = Integer.parseInt(request.getParameter("txtSoLuong"));
		String Chitiet = request.getParameter("txtChiTiet");
		String Ghichu = request.getParameter("txtGhiChu");
		String masp_error = "", tensp_error = "", dongia_error = "", soluong_error = "", chitiet_error = "",
				ghichu_error = "";

		// Validate
		if (Masp.equals("")) {
			masp_error = "Vui lòng nhập mã sản phẩm (VD: SP1) !";
		} else if (ProductDAO.checkMasp(Masp)) {
			{
				masp_error = "Mã sản phẩm đã tồn tại !";
			}
		}
		if (masp_error.length() > 0) {
			request.setAttribute("masp_error", masp_error);
		}
		if (Tensp.equals("")) {
			tensp_error = "Vui lòng nhập tên sản phẩm !";
		}
		if (tensp_error.length() > 0) {
			request.setAttribute("tensp_error", tensp_error);
		}
		if (Dongia <= 0) {
			dongia_error = "Đơn giá không hợp lệ !";
		}
		if (Dongia <= 0) {
			request.setAttribute("dongia_error", dongia_error);
		}
		if (Soluong <= 0) {
			soluong_error = "Số lượng không hợp lệ !";
		}

		if (Soluong <= 0) {
			request.setAttribute("soluong_error", soluong_error);
		}
		if (Ghichu.equals("")) {
			ghichu_error = "Vui lòng nhập ghi chú sản phẩm !";
		}
		if (ghichu_error.length() > 0) {
			request.setAttribute("ghichu_error", ghichu_error);
		}
		if (Chitiet.equals("")) {
			chitiet_error = "Vui lòng nhập chi tiết sản phẩm !";
		}
		if (chitiet_error.length() > 0) {
			request.setAttribute("chitiet_error", chitiet_error);
		}

		request.setAttribute("txtMaSP", Masp);
		request.setAttribute("txtMaLoai", Maloai);
		request.setAttribute("txtTenSP", Tensp);
		request.setAttribute("txtDonGia", Dongia);
		request.setAttribute("txtSoLuong", Soluong);
		request.setAttribute("txtGhiChu", Ghichu);
		request.setAttribute("txtChiTiet", Chitiet);
		try {
			switch (action) {
			case "Insert":
				if (masp_error.length() == 0 && tensp_error.length() == 0 && chitiet_error.length() == 0
						&& ghichu_error.length() == 0 && dongia_error.length() == 0 && soluong_error.length() == 0) {
					Product pr = new Product(Masp, Maloai, Tensp, Anh, Dongia, Soluong, Chitiet, Ghichu);
					ProductDAO.insertProduct(pr);
					url = "/managerProduct.jsp";
					break;
				} else {
					url = "/managerProduct.jsp";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
