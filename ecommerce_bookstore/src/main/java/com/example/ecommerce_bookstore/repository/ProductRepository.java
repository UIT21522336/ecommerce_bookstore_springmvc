package com.example.ecommerce_bookstore.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.ecommerce_bookstore.domain.CategoryDetail;
import com.example.ecommerce_bookstore.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);

    List<Product> findAll();

    List<Product> findTop4ByOrderByIdAsc();

    Optional<Product> findById(long id);

    List<Product> findByCategoryDetail(CategoryDetail categoryDetail);

    void delete(Product product);
}
