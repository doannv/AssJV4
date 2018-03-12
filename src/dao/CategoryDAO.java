package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.Category;
import util.hbnUtil;

public class CategoryDAO {
	@SuppressWarnings("unchecked")
	public List<Category> getListCategory() {
		List<Category> list = new ArrayList<Category>();
		Session session = hbnUtil.getSessionFactory().getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			String sql = "from Category";
			Query query = session.createQuery(sql);
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return list;
	}
}
