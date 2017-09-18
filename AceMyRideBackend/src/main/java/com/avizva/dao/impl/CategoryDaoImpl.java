package com.avizva.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.avizva.dao.CategoryDao;
import com.avizva.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	public Category save(Category category) {
		Session session = sessionFactory.getCurrentSession();
		try {
			category.setEnabled(true);
			session.save(category);
			return category;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Transactional
	public Category delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Category category = session.get(Category.class, id);
			if(category!=null){
				category.setEnabled(false);
			}
			return category;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Transactional
	public Category update(Category category) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(category);
			return category;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Transactional
	public Category view(String categoryId) {
		Session session = sessionFactory.getCurrentSession();
		List<Category> categories = session.createCriteria(Category.class).add(Restrictions.eq("categoryId", categoryId)).list();
		if (categories.isEmpty())
			return null;
		return categories.get(0);
		
	}
	
	@Transactional
	public List<Category> viewAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Category.class).list();
	}

	@Transactional
	public Category view(int id) {
		return sessionFactory.getCurrentSession().get(Category.class, id);
	}

}
