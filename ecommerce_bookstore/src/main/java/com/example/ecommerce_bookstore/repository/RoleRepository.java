package com.example.ecommerce_bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.ecommerce_bookstore.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    public Role findByName(String name);
}
