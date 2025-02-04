package com.example.ecommerce_bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.ecommerce_bookstore.domain.Cart;
import com.example.ecommerce_bookstore.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);

    Cart save(Cart cart);
}
