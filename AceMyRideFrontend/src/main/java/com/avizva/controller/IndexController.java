package com.avizva.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.avizva.pojo.SecurityQuestions;

/**
 * Controller to handle page requests
 * 
 * @author Pratyaksh Kumar
 * @author Raju Tikadar
 * @author Prateek
 *
 */
@Controller
public class IndexController {

	/**
	 * Method to return the home page
	 * 
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView showIndex(){
		return new ModelAndView("home");
	}
	
	/**
	 * Method to return about us page
	 * 
	 * @return
	 */
	@RequestMapping("/aboutUs")
	public ModelAndView showAboutUs() {
		return new ModelAndView("aboutUs");
	}
	
	/**
	 * Method to return contact us page
	 * 
	 * @return
	 */


	@RequestMapping("/contactUs")
	public ModelAndView showContactUs() {
		return new ModelAndView("contactUs");
	}

	/**
	 * Method to return login/register page
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView showLogin() {
		return new ModelAndView("login").addObject("securityQuestions", SecurityQuestions.securityQuestions);
	}

	/**
	 * Method to return profile page
	 * 
	 * @return
	 */

	//
	// /**
	// * Method to return profile page
	// *
	// * @return
	// */
	// @RequestMapping("/profile")
	// public ModelAndView showProfile() {
	// return new ModelAndView("profile");
	// }

	/**
	 * Method to return Forgot password page
	 * 
	 * @return
	 */
	@RequestMapping("/forgotPassword")
	public ModelAndView forgotPassword() {
		return new ModelAndView("forgotPassword");
	}

	@RequestMapping("/deactivateUser")
	public ModelAndView showDeactication() {
		return new ModelAndView("deactivate");
	}
	
}
