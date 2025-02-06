package com.example.ecommerce_bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.ecommerce_bookstore.domain.Cart;
import com.example.ecommerce_bookstore.domain.CartDetail;
import com.example.ecommerce_bookstore.domain.Product;
import java.util.List;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartAndProduct(Cart cart, Product product);

    List<CartDetail> findByCart(Cart cart);

    CartDetail findById(long id);

    CartDetail save(CartDetail cartDetail);

    void delete(CartDetail cartDetail);
}
