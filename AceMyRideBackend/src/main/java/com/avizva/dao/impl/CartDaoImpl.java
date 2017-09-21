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

import com.avizva.dao.CartDao;
import com.avizva.model.CartItem;

@Repository
public class CartDaoImpl implements CartDao {

	private static final Logger LOGGER = LogManager.getLogger(CartDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public CartItem save(CartItem cartItem) {
		Session session = sessionFactory.getCurrentSession();
		LOGGER.info("Saving cart item " + cartItem.getProduct().getProductId());
		try {
			session.save(cartItem);
			LOGGER.info("Cart item saved " + cartItem.getId());
			return cartItem;
		} catch (Exception e) {
			LOGGER.error(e);
			return null;
		}
	}

	@Override
	@Transactional
	public CartItem update(CartItem cartItem) {
		Session session = sessionFactory.getCurrentSession();
		LOGGER.info("Updating cart item " + cartItem.getId());
		try {
			session.update(cartItem);
			LOGGER.info("Cart item updated " + cartItem.getId());
			return cartItem;
		} catch (Exception e) {
			LOGGER.error(e);
			return null;
		}
	}

	@Override
	@Transactional
	public CartItem delete(CartItem cartItem) {
		Session session = sessionFactory.getCurrentSession();
		LOGGER.info("Deleting cart item " + cartItem.getId());
		try {
			session.delete(cartItem);
			LOGGER.info("Cart item deleted " + cartItem.getId());
			return cartItem;
		} catch (Exception e) {
			LOGGER.error(e);
			return null;
		}
	}


	@Override
	@Transactional
	public CartItem get(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(CartItem.class, id);
	}

	@Override
	@Transactional
	public List<CartItem> getForUser(int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from CartItem where userId=:userId");
		query.setParameter("userId", userId);
		return query.list();
	}

	@Override
	@Transactional
	public CartItem getByProductIDUserId(int productId, int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from CartItem where productId=:productId and userId=:userId and orderProcessed=false");
		query.setParameter("productId", productId);
		query.setParameter("userId", userId);
		if (query.list().isEmpty())
			return null;
		return (CartItem) query.list().get(0);
	}

}
