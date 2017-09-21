package com.avizva.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avizva.dao.UserDao;
import com.avizva.model.User;
import com.avizva.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger LOGGER = LogManager.getLogger();

	@Autowired
	private UserDao userDao;

	public User saveUser(User user) {
		LOGGER.info("Saving user with email " + user.getEmail());
		User savedUser = userDao.save(user);
		LOGGER.info("User saved successfully. ID=" + user.getId() + " email=" + user.getEmail());
		return savedUser;
	}

	public User updateUser(User userNew, User userById) {


		if (!userNew.getName().equals("")) {
			userById.setName(userNew.getName());
		}
		if (!userNew.getContact().equals("")) {
			userById.setContact(userNew.getContact());
		}
		if (userNew.getBirthDate() != null) {
			userById.setBirthDate(userNew.getBirthDate());
		}

		LOGGER.info("Updating user with email " + userNew.getId());
		User updatedUser = userDao.update(userById);
		LOGGER.info("User updated " + userNew.getId());
		updatedUser = userDao.userWithAddresses(updatedUser);
		return updatedUser;
	}


	public boolean deleteUser(int id) {
		LOGGER.info("Deleting user with id " + id);
		User deletedUser = userDao.delete(id);
		if (deletedUser == null) {
			LOGGER.error("Some error occured while deleting user with id:" + id);
			return false;
		}
		LOGGER.info("User with id " + id + "deleted");
		return true;
	}

	public User getUser(int id) {
		return userDao.view(id);
	}

	public User getUser(String email) {
		return userDao.view(email);
	}


	public boolean deactivateUser(int id) {
		User deactivateUser = userDao.delete(id);
		if (deactivateUser == null)
			return false;
		return true;
	}

	public User updateUserPasswordWithForgot(int userId, int securityQuestionId, String securityAnswer,
			String password) {
		LOGGER.info("Updating forgot password for user id" + userId);
		User user = userDao.view(userId);
		if (user.getSecurityQuestionId() == securityQuestionId
				&& user.getSecurityAnswer().trim().toLowerCase().equals(securityAnswer.trim().toLowerCase())) {
			user.setPassword(password);
			user = userDao.update(user);
			return user;
		}
		LOGGER.info("Invalid user authentication for changing password");
		return null;
	}


}
