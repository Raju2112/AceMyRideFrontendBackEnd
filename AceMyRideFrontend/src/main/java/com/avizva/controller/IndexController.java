package com.avizva.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.avizva.pojo.SecurityQuestions;
import com.avizva.service.CategoryService;

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
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private CategoryService categoryService;

	/**
	 * Method to return the home page
	 * 
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView showIndex(){
		servletContext.setAttribute("listOfCategories", categoryService.getAllCategories());
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
	 * Method to return return the product page
	 * 
	 * @return
	 */
	@RequestMapping("/return")
	public ModelAndView showReturn() {
		return new ModelAndView("return");
	}

	/**
	 * Method to return purchase protection page
	 * 
	 * @return
	 */
	@RequestMapping("/purchaseProtection")
	public ModelAndView showProtection() {
		return new ModelAndView("purchaseProtection");
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

	@RequestMapping("/loginAdmin")
	public ModelAndView index21() {
		return new ModelAndView("loginAdmin");

	}
	//
	@RequestMapping("/loginError")
	public ModelAndView index3() throws Exception {
		return new ModelAndView("loginError");

	}



}
