package com.example.ecommerce_bookstore.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.ecommerce_bookstore.domain.Order;
import com.example.ecommerce_bookstore.domain.User;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Order save(Order order);

    List<Order> findAll();

    Page<Order> findByUser(User user,Pageable pageable);

    Order findById(long id);
}
