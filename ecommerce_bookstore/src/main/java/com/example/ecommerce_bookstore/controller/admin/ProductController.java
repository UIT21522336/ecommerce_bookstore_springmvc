package com.example.ecommerce_bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.ecommerce_bookstore.domain.Product;

@Controller
public class ProductController {
    @GetMapping("/admin/products/create")
    public String getCreateProductPage() {

        return "admin/products/create";
    }

}
