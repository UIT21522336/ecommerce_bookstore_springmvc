package com.example.ecommerce_bookstore.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.service.ProductService;

@Controller
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products/detail/{id}")
    public String getProductDetail(@PathVariable("id") long id, Model model) {
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);
        return "client/products/detail";
    }

}
