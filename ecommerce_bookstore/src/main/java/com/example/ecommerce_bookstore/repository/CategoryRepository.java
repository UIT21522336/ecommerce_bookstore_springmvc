package com.example.ecommerce_bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import com.example.ecommerce_bookstore.domain.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    public List<Category> findAll();
}
