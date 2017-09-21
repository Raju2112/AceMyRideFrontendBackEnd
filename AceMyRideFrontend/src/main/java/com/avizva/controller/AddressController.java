package com.avizva.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.avizva.model.Address;
import com.avizva.model.User;
import com.avizva.service.AddressService;
import com.avizva.service.UserService;

@Controller
public class AddressController {
	@Autowired
	AddressService addressService;

	@Autowired
	UserService userService;

	@RequestMapping("/address")
	public ModelAndView showAddress(HttpSession session) {
		int id = (Integer) session.getAttribute("userId");
		return new ModelAndView("redirect:/profile").addObject("address", addressService.getActiveAddresssByUserId(id));
	}

	@RequestMapping("/addAddress")
	public ModelAndView addAddress(HttpSession session, @ModelAttribute Address address) {
		int id = (Integer) session.getAttribute("userId");
		User user = userService.getUser(id);
		if (user == null) {
			return new ModelAndView("redirect:/login").addObject("result", "failure").addObject("message",
					"Login session expires.");
		}
		address.setUserId(id);
		Address updatedAddress = addressService.saveAddress(address);
		return new ModelAndView("redirect:/profile");
	}

	@RequestMapping("/updateAddress")
	public ModelAndView updateAddress(HttpSession session, @ModelAttribute Address address) {
		int id = (Integer) session.getAttribute("userId");
		User user = userService.getUser(id);
		if (user == null) {
			return new ModelAndView("redirect:/login").addObject("result", "failure").addObject("message",
					"Login session expires.");
		}
		address.setUserId(id);
		address.setActive(true);
		Address updatedAddress = addressService.updateAddress(address);
		return new ModelAndView("redirect:/profile");
	}

	@RequestMapping("/deleteAddress")
	public ModelAndView deleteAddress(HttpSession session, @ModelAttribute Address address) {
		int id = (Integer) session.getAttribute("userId");
		User user = userService.getUser(id);
		if (user == null) {
			return new ModelAndView("redirect:/login").addObject("result", "failure").addObject("message",
					"Login session expires.");
		}
		address.setUserId(id);
		Address deletedAddress = addressService.deactivateAddress(address);
		return new ModelAndView("redirect:/profile");
	}

}
