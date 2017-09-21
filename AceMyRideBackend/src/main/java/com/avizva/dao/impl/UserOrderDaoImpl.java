package com.avizva.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.avizva.dao.UserOrdersDao;
import com.avizva.model.UserOrders;

@Repository
public class UserOrderDaoImpl implements UserOrdersDao {

	private static final Logger LOGGER = LogManager.getLogger();

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public UserOrders save(UserOrders userOrders) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(userOrders);
			return userOrders;
		} catch (Exception e) {
			LOGGER.error("Exception occured while saving order", e);
			return null;
		}
	}

	@Override
	@Transactional
	public UserOrders update(UserOrders userOrders) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(userOrders);
			return userOrders;
		} catch (Exception e) {
			LOGGER.error("Exception occured while updating order", e);
			return null;
		}
	}

	@Override

	public UserOrders delete(UserOrders userOrders) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public List<UserOrders> getUserOrders(int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from UserOrders where userId=:userId order by id desc");
		query.setParameter("userId", userId);
		return query.list();
	}

	@Override
	@Transactional
	public UserOrders get(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(UserOrders.class, id);
	}

}
