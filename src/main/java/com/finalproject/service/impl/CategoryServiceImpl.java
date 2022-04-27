package com.finalproject.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.CategoryDao;
import com.finalproject.entity.Category;
import com.finalproject.model.CategoryDTO;
import com.finalproject.service.CategoryService;

@Transactional
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public List<CategoryDTO> findAll() {
		List<Category> categories = categoryDao.findAll();
		List<CategoryDTO> categoryDTOs = new ArrayList<CategoryDTO>();
		for (Category category : categories) {
			CategoryDTO categoryDTO = new CategoryDTO();
			categoryDTO.setCategoryId(category.getCategoryId());
			categoryDTO.setCategoryName(category.getCategoryName());
			categoryDTOs.add(categoryDTO);
		}
		return categoryDTOs;
	}

}
