package com.example.ecommerce_bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.ecommerce_bookstore.domain.Order;
import com.example.ecommerce_bookstore.domain.OrderDetail;
import java.util.List;


@Repository
public interface OrderDeailRepository extends JpaRepository<OrderDetail, Long> {
    OrderDetail save(OrderDetail orderDetail);

    List<OrderDetail> findByOrder(Order order);
}
