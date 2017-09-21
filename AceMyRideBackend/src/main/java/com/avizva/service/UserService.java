package com.avizva.service;

import com.avizva.dao.UserDao;
import com.avizva.model.User;

/**
 * Service for accessing {@link UserDao}
 * 
 * @author Pratyaksh Kumar
 * @author Raju Tikadar
 * @author Prateek
 *
 */
public interface UserService {

	/**
	 * Calls the dao to save user in database
	 * 
	 * @param user
	 *            The user to be persisted
	 * @return User the saved user object
	 */
	public User saveUser(User user);

	/**
	 * Calls the dao to update user in database
	 * 
	 * @param user
	 *            The user to be updated
	 * @return User the updated user object
	 */
	public User updateUser(User user, User userById);

	/**
	 * Calls the dao to delete the user from database
	 * 
	 * @param id
	 *            The id of the user
	 * @return boolean Whether the user was successfully deleted or not
	 */
	public boolean deleteUser(int id);

	/**
	 * Gets the user object with the given id
	 * 
	 * @param id
	 * @return User the user object
	 */
	public User getUser(int id);

	/**
	 * Gets the user object with the given email
	 * 
	 * @param email
	 *            the given email of the user
	 * @return User the user object
	 */
	public User getUser(String email);

	/**
	 * Deactivates the user with the given id
	 * 
	 * @param id
	 *            the given id of the user
	 * @return User the deactivated user object
	 */
	public boolean deactivateUser(int id);

	/**
	 * Forgot password mechanism
	 * 
	 * @param userId
	 *            id of the user
	 * @param securityQuestionId
	 *            id of the security question that the user entered while
	 *            registring
	 * @param securityAnswer
	 *            answer to the said security question
	 * @param password
	 *            the new password to be set
	 * @return User user object if the password is updated else null
	 */
	public User updateUserPasswordWithForgot(int userId, int securityQuestionId, String securityAnswer,
			String password);



}
