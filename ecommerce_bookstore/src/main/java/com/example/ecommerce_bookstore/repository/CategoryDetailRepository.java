package com.example.ecommerce_bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.ecommerce_bookstore.domain.CategoryDetail;
import java.util.List;

public interface CategoryDetailRepository extends JpaRepository<CategoryDetail, Long> {
    public List<CategoryDetail> findAll();

    public CategoryDetail findByName(String name);
}
