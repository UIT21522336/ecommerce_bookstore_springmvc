package com.example.ecommerce_bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import com.example.ecommerce_bookstore.domain.User;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    public User save(User user);

    public List<User> findAll();

    public Optional<User> findById(long id);

    void delete(User user);
}
