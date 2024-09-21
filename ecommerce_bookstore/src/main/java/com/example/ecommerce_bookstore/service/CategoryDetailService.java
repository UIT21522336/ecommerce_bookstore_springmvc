package com.example.ecommerce_bookstore.service;

import org.springframework.stereotype.Service;
import java.util.List;

import com.example.ecommerce_bookstore.domain.CategoryDetail;
import com.example.ecommerce_bookstore.repository.CategoryDetailRepository;

@Service
public class CategoryDetailService {
    private final CategoryDetailRepository categoryDetailRepository;

    public CategoryDetailService(CategoryDetailRepository categoryDetailRepository) {
        this.categoryDetailRepository = categoryDetailRepository;
    }

    public List<CategoryDetail> getAllCategoryDetails() {
        return this.categoryDetailRepository.findAll();
    }

    public CategoryDetail getCategoryDetailByName(String name) {
        return this.categoryDetailRepository.findByName(name);
    }
}
