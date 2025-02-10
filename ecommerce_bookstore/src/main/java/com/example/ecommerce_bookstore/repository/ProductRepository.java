package com.example.ecommerce_bookstore.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.example.ecommerce_bookstore.domain.CategoryDetail;
import com.example.ecommerce_bookstore.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    Product save(Product product);

    List<Product> findAll();

    Page<Product> findAll(Specification specification, Pageable pageable);

    Page<Product> findByOrderByIdDesc(Pageable pageable);

    Page<Product> findByCategoryDetail_Category_DisplayNameOrderBySoldDesc(String name,Pageable pageable);

    List<Product> findTop4ByOrderByIdAsc();

    Optional<Product> findById(long id);

    Page<Product> findByCategoryDetail(CategoryDetail categoryDetail, Pageable pageable);

    Page<Product> findByCategoryDetail_Category_DisplayName(String name, Pageable pageable);

    void delete(Product product);

    Optional<Product> findTopByOrderByPriceDesc();

}
