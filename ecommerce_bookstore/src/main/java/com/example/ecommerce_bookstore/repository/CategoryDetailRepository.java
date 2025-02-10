package com.example.ecommerce_bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.ecommerce_bookstore.domain.Category;
import com.example.ecommerce_bookstore.domain.CategoryDetail;
import java.util.List;

public interface CategoryDetailRepository extends JpaRepository<CategoryDetail, Long> {
    List<CategoryDetail> findAll();

    CategoryDetail findByName(String name);

    List<CategoryDetail> findByCategory(Category category);
}
