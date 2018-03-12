package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import entity.Product;
import util.hbnUtil;

public class ProductDAO {
	@SuppressWarnings("unchecked")
	public static boolean checkMasp(String Masp) {
		List<Product> list = null;
		Session session = hbnUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		String sql = "from Product where MaSanPham = '" + Masp + "' ";
		System.out.println(sql);
		Query query = session.createQuery(sql);
		list = query.list();
		if (list.size() > 0) {
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<Product> getListProduct() {
		List<Product> list = new ArrayList<Product>();
		Session session = hbnUtil.openSession();
		Transaction transaction = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			String sql = "from Product";
			System.out.println(sql);
			Query query = session.createQuery(sql);
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public static List<Product> getSearchListProduct(String tensp) {
		List<Product> list = new ArrayList<Product>();
		Session session = hbnUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			String sql = "from Product ";
			System.out.println(sql);
			if (tensp.length() > 0) {
				sql = "from Product where TenSanPham like '%" + tensp + "%' ";
			}
			System.out.println(sql);
			list = session.createQuery(sql).list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

	@SuppressWarnings({ "unchecked" })
	public static List<Product> getdetailProduct(String masp) {
		List<Product> list = new ArrayList<Product>();
		Session session = hbnUtil.openSession();
		Transaction transaction = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			String sql = "from Product where MaSanPham='" + masp + "'";
			Query query = session.createQuery(sql);
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;

	}

	@SuppressWarnings("unchecked")
	public List<Product> getListProductID(String ma) {
		List<Product> list = new ArrayList<Product>();
		Session session = hbnUtil.openSession();
		Transaction transaction = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			String sql = "from Product where MaLoai='" + ma + "' ";
			Query query = session.createQuery(sql);
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public static boolean insertProduct(Product sp) {
		Session session = hbnUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(sp);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println(e);
			return false;
		}
	}

	public boolean editProduct(Product product) {
		Session session = hbnUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.update(product);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

	public static boolean deleteProduct(String Masp) {
		Session session = hbnUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Product product = (Product) session.get(Product.class, Masp);
			session.delete(product);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

	public List<Product> getListByPages(List<Product> maloai, int start, int end) throws SQLException {
		ArrayList<Product> list = new ArrayList<Product>();
		for (int i = start; i < end; i++) {
			list.add(maloai.get(i));
		}
		return list;
	}
}
