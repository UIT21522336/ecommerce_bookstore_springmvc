package com.example.ecommerce_bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.ecommerce_bookstore.domain.CartDetail;
import com.example.ecommerce_bookstore.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByProduct(Product product);
}
