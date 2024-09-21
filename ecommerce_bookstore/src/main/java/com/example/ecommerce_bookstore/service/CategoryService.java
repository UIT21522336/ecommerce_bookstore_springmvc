package com.example.ecommerce_bookstore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ecommerce_bookstore.domain.Category;
import com.example.ecommerce_bookstore.repository.CategoryRepository;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAllCategories() {
        return this.categoryRepository.findAll();
    }
}
