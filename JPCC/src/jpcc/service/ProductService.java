package jpcc.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import jpcc.entity.Product;

@Transactional
@Component
public class ProductService {
	@Autowired
	SessionFactory factory;
	
	public void insert(Product product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(product);
			t.commit();
		} 
		catch (Exception e) {
			t.rollback();
			throw new RuntimeException(e);
		}
		finally{
			session.close();
		}
	}
	
	public void update(Product product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(product);
			t.commit();
		} 
		catch (Exception e) {
			t.rollback();
			throw new RuntimeException(e);
		}
		finally{
			session.close();
		}
	}
	
	public void delete(Product product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(product);
			t.commit();
		} 
		catch (Exception e) {
			t.rollback();
			throw new RuntimeException(e);
		}
		finally{
			session.close();
		}
	}
	
	public void refresh(Product product) {
		Session session = factory.getCurrentSession();
		session.refresh(product);
	}
	
	public Product get(Integer id) {
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		return product;
	}
	
	public List<Product> list() {
		String hql = "FROM Product";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}

	public List<Product> search(String keywords) {
		String hql = "FROM Product WHERE " +
				" name LIKE :kw OR " +
				" category.name LIKE :kw OR " +
				" brand.name LIKE :kw";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("kw", "%"+keywords+"%");
		List<Product> list = query.list();
		return list;
	}

	

	public List<Product> getSpecialItems() {
		String hql = "FROM Product WHERE special=true";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}

	public List<Product> getExpensiveItems() {
		String hql = "FROM Product WHERE startingPrice>= 50000 ORDER BY startingPrice DESC";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}
}
