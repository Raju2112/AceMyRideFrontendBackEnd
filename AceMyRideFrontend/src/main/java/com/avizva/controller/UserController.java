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
import com.avizva.service.MailService;
import com.avizva.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private MailService mailService;


	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, "birthDate", new CustomDateEditor(format, false));
	}

	@RequestMapping("/profile")
	public ModelAndView showUser(HttpSession session) {
		int id=(Integer) session.getAttribute("userId");
		session.setAttribute("user", userService.getUser(id));
		return new ModelAndView("userProfile");
	}
	

	@RequestMapping(value="/submitUpdate", method = RequestMethod.POST)
	public ModelAndView submitUpdate(HttpSession session,@ModelAttribute User user) {
		User updatedUser=userService.updateUser(user);
		
		session.setAttribute("user", updatedUser);
		return new ModelAndView("userProfile");
	}


	@RequestMapping("/registerUser")
	public ModelAndView showRegister() {
		return new ModelAndView("register");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView addUser(@Valid @ModelAttribute User user, BindingResult result) {
		System.out.println(result.getAllErrors());
		System.out.println(user);
		User savedUser = userService.saveUser(user);
		if (savedUser == null) {
			return new ModelAndView("error");
		}
		mailService.sendMail(savedUser.getEmail(), "Thanks for registration",
				"Thank you for registring on our site. We look forward to serve you in the future");
		return new ModelAndView("redirect:/").addObject("user", savedUser);
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
		System.out.println(updatedUser);
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
				return new ModelAndView("redirect:/logout");
		}
		
	}
	
	@RequestMapping(value = "/submitUpdatePassword")
	public ModelAndView updatePassword(@RequestParam String oldPassword, @RequestParam String newPassword,
			HttpSession session)
	{
		String msg = null;
		if(session.getAttribute("isLoggedIn")==null)
		{
			return new ModelAndView("redirect:/login");
		}
		else
		{
			int id = (Integer) session.getAttribute("userId");
			String message = userService.changePassword(oldPassword, newPassword, id);
			return new ModelAndView("redirect:/profile", msg, message);
		}
		
	}

	@RequestMapping(value = "/submitUpdate")
	public ModelAndView update(@Valid @ModelAttribute User updatedUser, HttpSession session) {
		if (session.getAttribute("isLoggedIn") == null) {
			return new ModelAndView("redirect:/login");
		} else {
			int id = (Integer) session.getAttribute("userId");
			updatedUser = userService.updateUser(updatedUser, id);
			return new ModelAndView("redirect:/profile");
		}

	}

	@RequestMapping(value = "/viewById")
	public ModelAndView view(HttpSession session) {
		if (session.getAttribute("isLoggedIn") == null) {
			return new ModelAndView("redirect:/login");
		} else {
			int id = (Integer) session.getAttribute("userId");

			User viewUser = userService.getUser(id);
			if (viewUser == null) {
				return new ModelAndView("error");
			} else
				return new ModelAndView("redirect:/view").addObject("user", viewUser);
		}

	}

}
