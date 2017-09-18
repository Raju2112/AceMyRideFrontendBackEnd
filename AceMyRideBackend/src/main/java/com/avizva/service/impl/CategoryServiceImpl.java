package com.avizva.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avizva.dao.CategoryDao;
import com.avizva.model.Category;
import com.avizva.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	public Category saveCategory(Category category) {
		category.setDescription(category.getDescription().trim());
		category.setEnabled(true);
		Category savedCategory=categoryDao.save(category);
		return savedCategory;
	}

	public Category updateCategory(Category category) {
		category.setDescription(category.getDescription().trim());
		category.setEnabled(true);
		Category updatedCategory=categoryDao.update(category);
		return updatedCategory;
	}

	public boolean deleteCategory(int id) {
		Category deletedCategory = categoryDao.delete(id);
		if (deletedCategory == null)
			return false;
		return true;
	}

	public Category getCategory(int id) {
		return categoryDao.view(id);
	}

	public Category getCategory(String categoryId) {
		return categoryDao.view(categoryId);
	}
	
	public List<Category> getAllCategories()
	{
		List<Category> completeList=categoryDao.viewAll();
		return completeList.stream().filter(category -> category.isEnabled()).collect(Collectors.toList());
	}

}
