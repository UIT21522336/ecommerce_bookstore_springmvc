package com.example.ecommerce_bookstore.service;

import java.util.List;

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

    public void create(Order order){
        this.orderRepository.save(order);
    }

    public List<Order>  getByUser(User user){
        return this.orderRepository.findByUser(user);
    }

    public Order getById(long id){
        return this.orderRepository.findById(id);
    }
}
