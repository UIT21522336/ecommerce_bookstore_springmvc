package com.example.ecommerce_bookstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.ecommerce_bookstore.domain.Order;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public void create(Order order) {
        this.orderRepository.save(order);
    }

    public List<Order> getAll() {
        return this.orderRepository.findAll();
    }

    public Page<Order> getByUser(User user,Pageable pageable) {
        return this.orderRepository.findByUser(user,pageable);
    }

    public Order getById(long id) {
        return this.orderRepository.findById(id);
    }

    public void update(Order order){
        this.orderRepository.save(order);
    }
}
