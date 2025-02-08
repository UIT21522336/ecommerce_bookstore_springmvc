package com.example.ecommerce_bookstore.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> matchPriceRange(double min, double max) {
        return (root, query, builder) -> {
            return builder.between(root.get(Product_.PRICE), min, max);
        };
    }

    public static Specification<Product> matchFormat(List<String> format) {
        return (root, query, builder) -> {
            return builder.in(root.get(Product_.FORMAT)).value(format);
        };
    }
}
