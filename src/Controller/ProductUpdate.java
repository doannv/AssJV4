package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import entity.Product;

@WebServlet("/ProductUpdate")
public class ProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductDAO prDAO = new ProductDAO();

	public ProductUpdate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if (action.equals("Delete")) {
			System.out.println("do Delete");
			String masp = request.getParameter("Masp");
			ProductDAO.deleteProduct(masp);
			RequestDispatcher rd = request.getRequestDispatcher("managerProduct.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
		String Masp = request.getParameter("Masp");
		String Maloai = request.getParameter("Maloai");
		String Tensp = request.getParameter("Tensp");
		String Anh = request.getParameter("Anh");
		int Dongia = Integer.parseInt(request.getParameter("Dongia"));
		int Soluong = Integer.parseInt(request.getParameter("Soluong"));
		String Chitiet = request.getParameter("Chitiet");
		String Ghichu = request.getParameter("Ghichu");
		String maloai_error = "", tensp_error = "", dongia_error = "", soluong_error = "", chitiet_error = "",
				ghichu_error = "";

		// Validate
		if (Maloai.equals("")) {
			maloai_error = "Vui lòng nhập loại sản phẩm (VD: Iphone) !";
		}
		if (maloai_error.length() > 0) {
			request.setAttribute("maloai_error", maloai_error);
		}

		if (Tensp.equals("")) {
			tensp_error = "Vui lòng nhập tên sản phẩm !";
		}
		if (tensp_error.length() > 0) {
			request.setAttribute("tensp_error", tensp_error);
		}

		if (Chitiet.equals("")) {
			chitiet_error = "Vui lòng nhập chi tiết sản phẩm !";
		}
		if (chitiet_error.length() > 0) {
			request.setAttribute("chitiet_error", chitiet_error);
		}

		if (Ghichu.equals("")) {
			ghichu_error = "Vui lòng nhập ghi chú sản phẩm !";
		}
		if (ghichu_error.length() > 0) {
			request.setAttribute("ghichu_error", ghichu_error);
		}
		if (Soluong <= 0) {
			soluong_error = "Số lượng không hợp lệ !";
		}

		if (Soluong <= 0) {
			request.setAttribute("soluong_error", soluong_error);
		}

		if (Dongia <= 0) {
			dongia_error = "Đơn giá không hợp lệ !";
		}
		if (Dongia <= 0) {
			request.setAttribute("dongia_error", dongia_error);
		}

		try {
			switch (action) {
			case "Update":
				if (maloai_error.length() == 0 && tensp_error.length() == 0 && chitiet_error.length() == 0
						&& ghichu_error.length() == 0) {
					Product pr = new Product(Masp, Maloai, Tensp, Anh, Dongia, Soluong, Chitiet, Ghichu);
					prDAO.editProduct(pr);
					url = "/managerProduct.jsp";
					break;
				} else {
					url = "/updateProduct.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
