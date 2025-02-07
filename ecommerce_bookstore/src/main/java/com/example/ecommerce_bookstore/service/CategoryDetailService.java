package com.example.ecommerce_bookstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;

import com.example.ecommerce_bookstore.domain.Category;
import com.example.ecommerce_bookstore.domain.CategoryDetail;
import com.example.ecommerce_bookstore.repository.CategoryDetailRepository;

@Service
public class CategoryDetailService {
    private final CategoryDetailRepository categoryDetailRepository;

    public CategoryDetailService(CategoryDetailRepository categoryDetailRepository) {
        this.categoryDetailRepository = categoryDetailRepository;
    }

    public List<CategoryDetail> getAll() {
        return this.categoryDetailRepository.findAll();
    }

    public CategoryDetail getByName(String name) {
        return this.categoryDetailRepository.findByName(name);
    }

    public List<CategoryDetail> getByCategory(Category category) {
        return this.categoryDetailRepository.findByCategory(category);
    }
}
