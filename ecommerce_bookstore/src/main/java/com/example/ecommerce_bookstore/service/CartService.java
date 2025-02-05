package com.example.ecommerce_bookstore.service;

import org.springframework.stereotype.Service;

import com.example.ecommerce_bookstore.domain.Cart;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.repository.CartRepository;

@Service
public class CartService {
    private final CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public Cart getByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void create(Cart cart) {
        this.cartRepository.save(cart);
    }

    public void update(Cart cart){
        this.cartRepository.save(cart);
    }
}
