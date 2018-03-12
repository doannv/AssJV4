package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import entity.Product;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String erorr_search = "Vui lòng nhập tên sản phẩm !";
		String Tensp = request.getParameter("SanPham");
		try {
			if (action.equals("Search")) {
				if (Tensp.equals("")) {
					request.setAttribute("erorr_search", erorr_search);
					RequestDispatcher rd = request.getRequestDispatcher("managerProduct.jsp");
					rd.forward(request, response);
				} else {
					List<Product> list = ProductDAO.getSearchListProduct(Tensp);
					request.setAttribute("listSP", list);
					RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
					rd.forward(request, response);
				}
			}
		} catch (Exception e) {
		}
	}

}
