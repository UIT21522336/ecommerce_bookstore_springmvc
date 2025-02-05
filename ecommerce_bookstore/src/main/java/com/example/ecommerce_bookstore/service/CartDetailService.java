package com.example.ecommerce_bookstore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ecommerce_bookstore.domain.Cart;
import com.example.ecommerce_bookstore.domain.CartDetail;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.repository.CartDetailRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

    public CartDetail getByCartAndProduct(Cart cart, Product product) {
        return this.cartDetailRepository.findByCartAndProduct(cart, product);
    }

    public List<CartDetail> getByCart(Cart cart) {
        return this.cartDetailRepository.findByCart(cart);
    }

    public void create(CartDetail cartDetail) {
        this.cartDetailRepository.save(cartDetail);
    }

    public void update(CartDetail cartDetail) {
        this.cartDetailRepository.save(cartDetail);
    }

    public void delete(CartDetail cartDetail) {
        this.cartDetailRepository.delete(cartDetail);
    }
}
