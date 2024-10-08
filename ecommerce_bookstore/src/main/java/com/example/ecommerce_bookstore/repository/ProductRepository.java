package com.example.ecommerce_bookstore.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.ecommerce_bookstore.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
    public Product save(Product product);

    public List<Product> findAll();

    public Optional<Product> findById(long id);

    public void delete(Product product);
}
