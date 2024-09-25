package com.example.ecommerce_bookstore.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.service.ProductService;

@Controller
public class HomepageController {
    private final ProductService productService;

    public HomepageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("")
    public String getHomepage(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "client/homepage/homepage";
    }

}
