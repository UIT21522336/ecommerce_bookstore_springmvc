package com.example.ecommerce_bookstore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ecommerce_bookstore.domain.Order;
import com.example.ecommerce_bookstore.domain.OrderDetail;
import com.example.ecommerce_bookstore.repository.OrderDeailRepository;

@Service
public class OrderDetailService {
    private final OrderDeailRepository orderDeailRepository;

    public OrderDetailService(OrderDeailRepository orderDeailRepository) {
        this.orderDeailRepository = orderDeailRepository;
    }

    public void create(OrderDetail orderDetail) {
        this.orderDeailRepository.save(orderDetail);
    }

    public List<OrderDetail> getByOrder(Order order) {
        return this.orderDeailRepository.findByOrder(order);
    }
}
