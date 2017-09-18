package com.avizva.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.avizva.model.Category;
import com.avizva.model.Supplier;
import com.avizva.service.CategoryService;
import com.avizva.service.SupplierService;

@Controller
public class AdminController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private SupplierService supplierService;
	
	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public ModelAndView addCategory(@ModelAttribute Category category) {
		Category savedCategory = categoryService.saveCategory(category);
		if (savedCategory == null) {
			return new ModelAndView("error");
		}
		
		return new ModelAndView("redirect:/adminPage");
	}
	
	@RequestMapping(value = "/updateCategory", method = RequestMethod.POST)
	public ModelAndView updateCategory(@ModelAttribute Category category) {
		Category updatedCategory = categoryService.updateCategory(category);
		if (updatedCategory == null) {
			return new ModelAndView("error");
		}
		
		return new ModelAndView("redirect:/adminPage");
	}
	
	@RequestMapping(value = "/deleteCategory", method = RequestMethod.POST)
	public ModelAndView deleteCategory(@ModelAttribute Category category) {
		
		boolean wasDeleted= categoryService.deleteCategory(category.getId());
		if (wasDeleted==false) {
			return new ModelAndView("error");
		}
		
		return new ModelAndView("redirect:/adminPage");
	}
	
	@RequestMapping(value = "/viewCategories", method = RequestMethod.POST)
	public ModelAndView viewCategories() {
	
		return new ModelAndView("redirect:/adminPage");
	}
	
	@RequestMapping(value = "/addSupplier", method = RequestMethod.POST)
	public ModelAndView addSupplier(@ModelAttribute Supplier supplier) {
		
		Supplier savedSupplier = supplierService.saveSupplier(supplier);
		if (savedSupplier == null) {
			return new ModelAndView("error");
		}
		
		return new ModelAndView("redirect:/adminPage");
	}
	
	@RequestMapping(value = "/updateSupplier", method = RequestMethod.POST)
	public ModelAndView updateSupplier(@ModelAttribute Supplier supplier) {
		
		Supplier updatedSupplier = supplierService.updateSupplier(supplier);
		if (updatedSupplier == null) {
			return new ModelAndView("error");
		}
		
		return new ModelAndView("redirect:/adminPage");
	}
	
	@RequestMapping(value = "/deleteSupplier", method = RequestMethod.POST)
	public ModelAndView deleteSupplier(@ModelAttribute Supplier supplier) {
		
		boolean wasDeleted= supplierService.deleteSupplier(supplier.getId());
		if (wasDeleted==false) {
			return new ModelAndView("error");
		}
		
		return new ModelAndView("redirect:/adminPage");
	}
	
	@RequestMapping(value = "/viewSuppliers", method = RequestMethod.POST)
	public ModelAndView viewSuppliers() {
	
		
		return new ModelAndView("redirect:/adminPage");
	}	
	
	@RequestMapping(value="/adminPage")
	public ModelAndView callAdmin(){
		
		return new ModelAndView("adminPanel").addObject("listSuppliers", supplierService.getAllSuppliers())
				.addObject("listCategories", categoryService.getAllCategories());
	}

}
