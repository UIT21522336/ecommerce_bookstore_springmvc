package com.example.ecommerce_bookstore.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
    @GetMapping("/products/detail/{id}")
    public String getMethodName(@RequestParam("id") long id) {
        return "client/products/detail";
    }

}
