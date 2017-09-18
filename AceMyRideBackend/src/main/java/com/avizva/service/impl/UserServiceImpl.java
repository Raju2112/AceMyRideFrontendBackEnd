package com.avizva.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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


	public User updateUser(User user) {
		LOGGER.info("Updating user with email " + user.getId());
		User updatedUser = userDao.update(user);
		LOGGER.info("User updated " + user.getId());
		updatedUser=userDao.userWithAddresses(updatedUser);
		return updatedUser;
	}

	public User updateUser(User updatedUser, int id) {

		User userById = getUser(id);
		if (updatedUser.getName() != null) {
			userById.setName(updatedUser.getName());
		}
		if (updatedUser.getContact() != null) {
			userById.setContact(updatedUser.getContact());
		}
		if (updatedUser.getBirthDate() != null) {
			userById.setBirthDate(updatedUser.getBirthDate());
		}

		return userDao.update(userById);

	}

	public String changePassword(String oldPassword, String newPassword, int id) {

		String msg = null;
		User userById = getUser(id);
		if (userById.getPassword().equalsIgnoreCase(oldPassword)) {
			userById.setPassword(newPassword);
			User userPass = userDao.update(userById);
			if (userPass == null) {
				msg = "Old Password is Incorrect!!";
			} else {
				msg = "Password Changed";
			}
		}
		return msg;

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
	@Transactional
	public User getUserWithAddresses(int id) {
		User user = userDao.view(id);
		user.setAddresses(user.getAddresses());
		return user;
	}

}
