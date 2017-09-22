package com.avizva.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.avizva.model.User;
import com.avizva.pojo.SecurityQuestions;
import com.avizva.pojo.UserType;
import com.avizva.service.AddressService;
import com.avizva.service.MailService;
import com.avizva.service.ProductService;
import com.avizva.service.UserOrdersService;
import com.avizva.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	UserOrdersService userOrderService;

	@Autowired
	private MailService mailService;

	@Autowired
	private AddressService addressService;

	@Autowired
	private ProductService productService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, "birthDate", new CustomDateEditor(format, false));
	}

	@RequestMapping("/profile")
	public ModelAndView showUser(HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return new ModelAndView("redirect:/login").addObject("message", "Please Loginfirst");
		}
		int id = (Integer) session.getAttribute("userId");
		session.setAttribute("user", userService.getUser(id));
		return new ModelAndView("userProfile").addObject("listAddress", addressService.getActiveAddresssByUserId(id))
				.addObject("orderList", userOrderService.getOrderList(id));
	}

	@RequestMapping("/userDeactivate")
	public ModelAndView userDeactivation() {
		return new ModelAndView("deactivate");
	}
	
	
	@RequestMapping(value="/submitUpdate", method = RequestMethod.POST)
	public ModelAndView submitUpdate(HttpSession session, @ModelAttribute User userNew, BindingResult result) {
		
		int id = (Integer) session.getAttribute("userId");
		User userById = userService.getUser(id);
		User updatedUser = userService.updateUser(userNew, userById);
		
		session.setAttribute("user", updatedUser);
		return new ModelAndView("redirect:/profile");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView addUser(@Valid @ModelAttribute User user, BindingResult result) {
		UserType role = UserType.ROLE_USER;
		user.setUserType(role);
		User savedUser = userService.saveUser(user);
		if (savedUser == null) {
			return new ModelAndView("error");
		}
		mailService.sendMail(savedUser.getEmail(), "Thanks for registration",
				"Thank you for registring on our site. We look forward to serve you in the future");
		return new ModelAndView("redirect:/login");
	}

	@RequestMapping(value = "/forgotPasswordUser", method = RequestMethod.POST)
	public ModelAndView forgotPassword(@RequestParam String email, HttpSession session) {
		User user = userService.getUser(email);
		if (user == null) {
			return new ModelAndView("redirect:/login").addObject("result", "failure").addObject("message",
					"No user found with given email id.");
		} else {
			session.setAttribute("forgotPassword", true);
			session.setAttribute("userId", user.getId());
			session.setAttribute("userEmail", user.getEmail());
			return new ModelAndView("forgotPasswordForm").addObject("securityQuestions",
					SecurityQuestions.securityQuestions);
		}
	}

	@RequestMapping(value = "/updatePasswordForgot")
	public ModelAndView updatePasswordForget(@RequestParam String password, @RequestParam int securityQuestionId,
			@RequestParam String securityAnswer, HttpSession session) {
		int userId = (Integer) session.getAttribute("userId");
		User updatedUser = userService.updateUserPasswordWithForgot(userId, securityQuestionId, securityAnswer,
				password);
		if (updatedUser == null) {
			return new ModelAndView("forgotPasswordForm")
					.addObject("securityQuestions", SecurityQuestions.securityQuestions).addObject("result", "failure")
					.addObject("message", "Invalid security question/answer");
		}
		return new ModelAndView("redirect:/login").addObject("result", "success").addObject("message",
				"User password updated successfully");
	}
	
	@RequestMapping(value = "/deactivate")
	public ModelAndView deactivation(HttpSession session)
	{
		if(session.getAttribute("isLoggedIn")==null)
		{
			return new ModelAndView("redirect:/login");
		}
		else
		{
			int id=(Integer) session.getAttribute("userId");
			boolean flag=userService.deactivateUser(id);
			if (!flag) {
				return new ModelAndView("error");
			}
			else
				return new ModelAndView("redirect:/userLogout");
		}
		
	}

}
