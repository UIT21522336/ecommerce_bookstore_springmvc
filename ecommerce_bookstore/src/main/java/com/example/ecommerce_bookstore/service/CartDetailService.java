package com.example.ecommerce_bookstore.service;

import org.springframework.stereotype.Service;

import com.example.ecommerce_bookstore.domain.CartDetail;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.repository.CartDetailRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

public CartDetail getByProduct(Product product){
    return this.cartDetailRepository.findByProduct(product);
}
}
